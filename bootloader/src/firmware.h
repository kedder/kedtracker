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
