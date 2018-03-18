/*
 * Bootloader for STM32F103
 * Copyright (C) 2018 Andrey Lebedev
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef __FIRMWARE_H__
#define __FIRMWARE_H__

#include <stdint.h>
#include <stdbool.h>

#include "ff.h"

#include "crc32.h"

#define FW_MARKER "KEDTR"

typedef enum {
    FW_FOUND=0,
    FW_NO_DRIVE,
    FW_NOT_FOUND,
    FW_CANNOT_OPEN,
    FW_READ_FAILED,
    FW_CRC_MISMATCH,
} FirmwareStatus;

typedef struct {
    char marker[6];
    uint8_t format;
    uint8_t versionMajor;
    uint8_t versionMinor;
    uint8_t reserved[3];
    char versionStr[8];
    char variant[8];
    uint32_t bodyCrc;
} FirmwareHeader;

typedef struct {
    FirmwareHeader header;
    FILINFO fileinfo;
    FIL file;
} FoundFirmware;

FirmwareStatus FW_FindFirmware(FoundFirmware *found);

void FW_FlashFirmware(FoundFirmware *fw);
void FW_SaveHeader(FirmwareHeader *header);
void FW_PrintCurrentVersion(void);

#endif
