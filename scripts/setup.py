import os
import time
import sys
import re
import subprocess

import serial
from termcolor import cprint, colored

PORT = '/dev/ttyUSB0'

BUILD_DIR = 'firmware/build'
SETUP_BIN = os.path.join(BUILD_DIR, 'setup.bin')
MAIN_BIN = os.path.join(BUILD_DIR, 'main.bin')

FLASH_SETUP_CMD = ['stm32flash', '-w', SETUP_BIN, PORT]
FLASH_MAIN_CMD = ['stm32flash', '-w', MAIN_BIN, PORT]
RUN_CMD = ['stm32flash', '-g', '0x0', PORT]

FEATURE_NAMES = {
    'sdcard': 'SD Card',
    'rf': 'RF Chip',
    'baro': 'Barometric Sensor',
    'gps': 'GPS'
}

FEATURE_MARKERS = {
    'sdcard': 'Config file TRACKER.CFG:',
    'rf': 'TaskRF: v24',
    'baro': 'BMP280:  @76',
    'gps': '$GPGSA'
}

class Failure(Exception):
    pass

def flash_setup():
    res = subprocess.call(FLASH_SETUP_CMD)
    if res:
        raise Failure("Flashing setup firmware failed!")
    res = subprocess.call(RUN_CMD)
    if res:
        raise Failure("Starting firmware failed!")

def flash_main():
    res = subprocess.call(FLASH_MAIN_CMD)
    if res:
        raise Failure("Flashing main firmware failed!")

def detect_aircrat_id():
    print(colored("Detecting Aircraft Id... ", 'blue'), end='', flush=True)
    aircraft_id = None
    log = []
    with serial.Serial(PORT, 115200, timeout=1) as ser:
        for attempt in range(30):
            line = ser.readline()

            try:
                line = line.decode('utf-8')
            except UnicodeDecodeError:
                continue

            log.append(line)
            # check for aircraft id
            m = re.match(r'.*Parameters initialized: \d:\d:([0-9A-F]{6}).*',
                         line)
            if m:
                aircraft_id = m.group(1)
                continue

            # check for success message
            m = re.match(r'.*Setup completed!.*', line)
            if aircraft_id and m:
                break
        else:
            print()
            cprint("Setup failed:", 'red')
            for line in log:
                print("   %s" % line, end='')
            print()
            raise Failure("Setup failed")

    cprint(aircraft_id, 'green')
    return aircraft_id

def detect_features():
    with serial.Serial(PORT, 115200, timeout=0) as ser:
        # Start the firmware
        cprint('Starting firmware...', 'blue')
        res = subprocess.call(RUN_CMD)
        if res:
            raise Failure("Starting firmware failed!")

        cprint('Detecting features...', 'blue')
        to_detect = set(FEATURE_MARKERS.keys())

        attempt = 50
        while attempt:
            line = ser.readline().decode()
            if not line:
                time.sleep(0.1)
                continue

            attempt -= 1
            print(">", colored(line.strip(), 'white'))
            for feature, marker in FEATURE_MARKERS.items():
                if marker in line:
                    if feature in to_detect:
                        to_detect.remove(feature)
                    cprint("  Detected: %s" % FEATURE_NAMES[feature], 'green')

            if not to_detect:
                break
        else:
            for feature in to_detect:
                cprint('  Not Detected: %s' % FEATURE_NAMES[feature], 'red')
            raise Failure("Not all features detected")

    cprint("All features detected", 'blue')


def report_success(aircraft_id):
    print()
    print(colored('Your aircraft Id:', 'blue'),
          colored(aircraft_id, 'green', attrs=['bold']))
    cprint("Success!", 'blue')

def welcome():
    cprint("Setting up Ked Tracker", 'blue')
    print(colored("Put jumpers on", 'blue'),
          colored('BOOT', 'blue', attrs=['bold']),
          colored('and', 'blue'),
          colored('BT_KEY', 'blue', attrs=['bold']),
          colored('and press', 'blue'),
          colored("Enter", attrs=['bold']),
          end='')
    input('')

def ask_to_reset():
    print(colored("Reset device and press", 'blue'),
          colored("Enter", attrs=['bold']),
          '',
          end='')
    input('')

def main():
    welcome()
    flash_setup()
    aircraft_id = detect_aircrat_id()
    ask_to_reset()
    flash_main()
    detect_features()
    report_success(aircraft_id)

if __name__ == '__main__':
    try:
        main()
    except Failure as e:
        cprint("*** Error: %s" % e, 'red')
        sys.exit(1)
