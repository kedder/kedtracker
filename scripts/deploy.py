import os
import time
import sys
import re
import subprocess

import serial
from termcolor import cprint, colored

PORT = '/dev/ttyUSB0'

APP_START_ADDR = '0x08002000'
APP_START_PAGE = '8'
BOOTLOADER_BUILD_DIR = 'bootloader/build'
APP_BUILD_DIR = 'firmware/build'
BOOTLOADER_BIN = os.path.join(BOOTLOADER_BUILD_DIR, 'bootloader.bin')
SETUP_BIN = os.path.join(APP_BUILD_DIR, 'setup.bin')
MAIN_BIN = os.path.join(APP_BUILD_DIR, 'main.bin')

FLASH_BOOTLOADER_CMD = ['stm32flash', '-w', BOOTLOADER_BIN, PORT]
FLASH_SETUP_CMD = ['stm32flash', '-w', SETUP_BIN, '-s', '8', PORT]
RUN_CMD = ['stm32flash', '-g', APP_START_ADDR, PORT]

FEATURE_NAMES = {
    'bootloader': 'Bootloader running',
    'flashing': 'Firmware flashing',
    'aircraftid': 'Aircraft Id',
    'setupdone': 'Setup Completed',
    'sdcard': 'SD Card',
    'txpower': 'TX Power Configured',
    'rf': 'RF Chip',
    'baro': 'Barometric Sensor',
    'gps': 'GPS',
    'flashsize': 'Flash Size'
}

FEATURE_MARKERS = {
    'bootloader': r'Ked Tracker Bootloader',
    'flashing': r'Flashing firmware',
    'aircraftid': r'Parameters initialized: \d:\d:([0-9A-F]{6})',
    'setupdone': r'Setup completed!',
    'sdcard': r'Config file TRACKER.CFG:',
    'txpower': r'RFM69HW/\+20dBm',
    'rf': r'TaskRF: (v24)',
    'baro': r'BMP280:  @76',
    'gps': r'\$GPGSA',
    'flashsize': r'TaskCTRL.*(64|128)kB'
}

class Failure(Exception):
    pass


def flash_bootloader():
    cprint("Flashing bootloader...", 'blue')

    res = subprocess.call(FLASH_BOOTLOADER_CMD)
    if res:
        raise Failure("Flashing bootloader failed!")


def flash_setup():
    cprint("Flashing setup firmware...", 'blue')
    res = subprocess.call(FLASH_SETUP_CMD)
    if res:
        raise Failure("Flashing setup firmware failed!")
    cprint("Starting setup firmware...", 'blue')
    res = subprocess.call(RUN_CMD)
    if res:
        raise Failure("Starting firmware failed!")


def detect_features():
    features = {}
    with serial.Serial(PORT, 115200, timeout=0) as ser:
        cprint('Detecting features...', 'blue')
        to_detect = set(FEATURE_MARKERS.keys())

        attempt = 50
        while attempt:
            try:
                line = ser.readline().decode()
            except UnicodeDecodeError:
                continue

            if not line:
                time.sleep(0.1)
                continue

            attempt -= 1
            print(">", colored(line.strip(), 'white'))
            for feature, marker in FEATURE_MARKERS.items():
                match = re.search(marker, line)
                if match:
                    if match.groups():
                        features[feature] = match.groups()
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
    return features


def report_success(features):
    print()

    aircraft_id, = features['aircraftid']
    flash_size, = features['flashsize']

    print(colored('Flash Size: %skB' % flash_size, 'blue'))
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

def main():
    welcome()
    flash_bootloader()
    flash_setup()
    features = detect_features()
    report_success(features)

if __name__ == '__main__':
    try:
        main()
    except Failure as e:
        cprint("*** Error: %s" % e, 'red')
        sys.exit(1)
