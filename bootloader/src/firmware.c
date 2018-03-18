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

#include <string.h>

#include "stm32f10x_flash.h"

#include "hal.h"
#include "firmware.h"
#include "crc32.h"
#include "serial.h"

#define STORED_FIRMWARE_HEADER (FirmwareHeader *)BOOT_STORAGE_ADDRESS

static uint8_t buffer[512];
static uint32_t flashbuffer[128];

static bool iseq(const char *str1, const char *str2, int len) {
  for (int i = 0; i < len; i++) {
    if (str1[i] != str2[i]) return false;
  }
  return true;
}

static bool isFirmwareFile(char *filename) {
  for (int i=0; i<13; i++) {
    if (filename[i] == '.') {
      return iseq(&filename[i+1], "FW", 2);
    }
  }
  return false;
}

static inline bool isSupported(FirmwareHeader *header) {
  return iseq(header->marker, FW_MARKER, sizeof(FW_MARKER));
}

static void printVersion(FirmwareHeader *header) {
  if (!isSupported(header)) {
    Print("n/a");
    return;
  }
  Print(header->versionStr);
  if (header->variant[0] != 0) {
    Print(" (");
    Print(header->variant);
    Print(")");
  }
}

static bool isUpgradeable(FirmwareHeader *header) {
  if (!isSupported(header)) {
    return false;
  }

  FirmwareHeader *storedHeader = STORED_FIRMWARE_HEADER;
  if (!isSupported(storedHeader)) {
    // We didn't store header before, continue with upgrade
    Print("new deployment, ");
    return true;
  }

  // Make sure the version is higher
  int16_t fwversion = (header->versionMajor << 8) + header->versionMinor;
  int16_t storedVersion = (storedHeader->versionMajor << 8) + storedHeader->versionMinor;

  if (fwversion == 0) {
    Print("factory reset, ");
    return true;
  }

  // If variant is different, upgrade despite version is the same
  bool sameVariant = iseq(header->variant, storedHeader->variant, sizeof(header->variant));

  if (storedVersion == fwversion && !sameVariant) {
    Print("different variant, ");
    return true;
  }
  if (fwversion <= storedVersion) {
    Print("older version, ");
    return false;
  }
  Print("new version");
  return true;
}

static bool checkCRC(FirmwareHeader *firmware, FIL *file) {
  // We expect file pointer to be right after the header
  uint32_t bytesLeft = file->fsize - sizeof(FirmwareHeader);
  UINT read = 0;
  uint32_t actualCrc = 0;

  while (bytesLeft) {
    uint32_t toread = bytesLeft > sizeof(buffer) ? sizeof(buffer) : bytesLeft;
    f_read(file, buffer, toread, &read);
    CRC_Calculate(buffer, toread, &actualCrc);
    bytesLeft -= toread;
  }

  return firmware->bodyCrc == actualCrc;
}

static bool LedSet(bool on) {
  if (on) {
    HAL_LedOn();
  }
  else {
    HAL_LedOff();
  }
  return !on;
}

FirmwareStatus FW_FindFirmware(FoundFirmware *found) {
  static FRESULT err;
  static DIR dir;
  FirmwareStatus result = FW_NOT_FOUND;
  UINT read;

  err = f_opendir(&dir, "");
  if (err) return FW_NO_DRIVE;

  while (1) {
    err = f_readdir(&dir, &found->fileinfo);
    if (err) {
      result = FW_NOT_FOUND;
    }

    if (found->fileinfo.fname[0] == 0) {
      // No more files in directory not suitable firmware wasn't found
      break;
    }

    if (!isFirmwareFile(found->fileinfo.fname)) {
      continue;
    }

    // Looks like a firmware. Open a file and see what's inside
    err=f_open(&found->file, found->fileinfo.fname, FA_READ);
    if (err) {
      result = FW_CANNOT_OPEN;
      break;
    }

    // Read the header
    f_read(&found->file, &found->header, sizeof(FirmwareHeader), &read);
    if (!isSupported(&found->header)) {
      f_close(&found->file);
      continue;
    }

    Print("- Considering ");
    Print(found->fileinfo.fname);
    Print(": ");

    if (!isUpgradeable(&found->header)) {
      // Unknown format
      PrintLn("not upgradeable");
      f_close(&found->file);
      continue;
    }

    bool crcMatches = checkCRC(&found->header, &found->file);
    f_close(&found->file);
    // Make sure CRC matches
    if (!crcMatches) {
      // CRC mismatch! Bail out
      PrintLn("CRC mismatch");
      result = FW_CRC_MISMATCH;
      break;
    }

    // Looks like all checks passed: we found the firmware we can load
    // Reopen the file and seek to the beginning of the firware blob
    err=f_open(&found->file, found->fileinfo.fname, FA_READ);
    if (err) {
      PrintLn("cannot open");
      result = FW_CANNOT_OPEN;
      break;
    }
    f_read(&found->file, &found->header, sizeof(FirmwareHeader), &read);
    PrintLn("upgrading");
    result = FW_FOUND;
    break;
  }
  // Clean up
  f_closedir(&dir);
    return result;
}


void FW_FlashFirmware(FoundFirmware *fw) {
  uint32_t bytesLeft = fw->file.fsize - sizeof(FirmwareHeader);

  Print("Flashing firmware version ");
  printVersion(&fw->header);
  Print(" from ");
  PrintLn(fw->fileinfo.fname);
  // Erase the flash
  HAL_LedOn();
  FLASH_Unlock();
  uint8_t toErase = NUM_OF_PAGES - MAIN_PROGRAM_PAGE_NUMBER;
  for(uint8_t i = 0; i < toErase ; i++) {
    FLASH_ErasePage(MAIN_PROGRAM_START_ADDRESS + i * FLASH_PAGE_SIZE);
  }

  // Write the firmware
  UINT read = 0;
  uint32_t currentAddress = MAIN_PROGRAM_START_ADDRESS;
  while (bytesLeft) {
    uint32_t toread = bytesLeft > sizeof(flashbuffer) ? sizeof(flashbuffer) : bytesLeft;
    f_read(&fw->file, flashbuffer, toread, &read);
    for (uint32_t i = 0; i < 128; i++) {
      FLASH_ProgramWord(currentAddress, flashbuffer[i]);
      currentAddress += sizeof(uint32_t);
      LedSet(currentAddress & 0x1000);
    }
    bytesLeft -= toread;
  }

  FLASH_Lock();
  HAL_LedOff();

  f_close(&fw->file);
}

void FW_SaveHeader(FirmwareHeader *header) {
  FLASH_Unlock();
  FLASH_ErasePage(BOOT_STORAGE_ADDRESS);
  uint32_t *src = (uint32_t *)header;

  uint32_t curAddr = BOOT_STORAGE_ADDRESS;
  for (uint32_t i=0; i < sizeof(FirmwareHeader) / sizeof(int32_t); i++) {
    FLASH_ProgramWord(curAddr, src[i]);
    curAddr += sizeof(int32_t);
  }
  FLASH_Lock();
}

void FW_PrintCurrentVersion(void) {
  printVersion(STORED_FIRMWARE_HEADER);
}
