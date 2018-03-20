#!/usr/bin/env python3
"""Package firmware into .fw file
"""

import sys
import argparse
import zlib
import io

FW_MARKER = "KEDT"
FORMAT_REV = 1
STM32_BYTEORDER = 'little'

parser = argparse.ArgumentParser(description='Package firmware.')
parser.add_argument('binfile',
                    help='Binary (.bin) file containing firmware')
parser.add_argument('outputfile',
                    help='Output filename (.fw) with packaged firmware')
parser.add_argument('--version', '-v',
                    required=True,
                    help='firmware version in form of MAJOR.MINOR')
parser.add_argument('--variant',
                    help='firmware variant (arbitrary string < 8 characters')


class Error(Exception):
    pass


def parse_version(version):
    parts = version.split(".")

    if len(parts) != 2:
        raise Error("Version should be in MAJOR.MINOR format")

    versions = [int(p) for p in parts]
    if not all(0 <= v < 256 for v in versions):
        raise Error("Version numbers should be less than 256")
    return versions


def crc32(contents: bytes):
    return zlib.crc32(contents)


def package(inputfname: str, outputfname: str, version: str, 
            variant: str=''):
    print("Packaging %s version %s, variant: %s" % 
          (inputfname, version, variant))

    version_major, version_minor = parse_version(version)

    with open(inputfname, 'rb') as f:
        bin_contents = f.read()

    print("Binary size: %s bytes" % len(bin_contents))
    bin_crc32 = crc32(bin_contents)
    print("Calculated CRC32: 0x%x" % bin_crc32)

    with open(outputfname, 'wb') as f:
        # Write the format defined in firmware.h
        # FirmwareHeader.marker
        f.write('{0:\0<5}'.format(FW_MARKER).encode())
        # FirmwareHeader.format
        f.write(FORMAT_REV.to_bytes(1, STM32_BYTEORDER))
        # FirmwareHeader.versionMajor
        f.write(version_major.to_bytes(1, STM32_BYTEORDER))
        # FirmwareHeader.versionMinor
        f.write(version_minor.to_bytes(1, STM32_BYTEORDER))
        # FirmwareHeader.versionStr
        f.write('{0:\0<8}'.format(version).encode())
        # FirmwareHeader.variant
        f.write('{0:\0<8}'.format(variant or '').encode())
        # FirmwareHeader.bodyCrc
        f.write(bin_crc32.to_bytes(4, STM32_BYTEORDER))
        # FirmwareHeader.reserved
        f.write(b'\0' * 4)

        # Finally we can write the firmware itself
        f.write(bin_contents)

    print("Packaged to %s" % outputfname)

def main():
    args = parser.parse_args(sys.argv[1:])

    try:
        package(args.binfile, args.outputfile, 
                args.version, args.variant)
    except Error as e:
        print("*** Error: %s" % e)
        return 1

    return 0


if __name__ == '__main__':
    sys.exit(main())
