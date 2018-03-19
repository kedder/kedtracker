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

#include <stdbool.h>

#include "stm32f10x.h"
#include "stm32f10x_flash.h"

#include "hal.h"
#include "ff.h"
#include "serial.h"
#include "crc32.h"
#include "firmware.h"

static FATFS FatFs;  // FatFS object for the file system (FAT)

typedef  void (*pFunction)(void);

static uint32_t  JumpAddress;
static pFunction Jump;
static void RunApp() {
  PrintLn("Starting application...");
//	    HAL_RCC_DeInit();
//	    HAL_DeInit();

  SysTick->CTRL = 0;
  SysTick->LOAD = 0;
  SysTick->VAL  = 0;

  JumpAddress = *(__IO uint32_t*)(MAIN_PROGRAM_START_ADDRESS + 4);
  Jump = (pFunction)JumpAddress;
  SCB->VTOR = MAIN_PROGRAM_START_ADDRESS;
  __set_MSP(*(__IO uint32_t*)MAIN_PROGRAM_START_ADDRESS);
  Jump();
  while (1) continue;
}

int main(void) {
  FRESULT ErrFile;

  HAL_SetupHardware();

  Print("** ");
  Print(BOOTLOADER_NAME);
  Print(" version ");
  Print(BOOTLOADER_VERSION);
  PrintLn(" **");
  Print("Installed application version: ");
  FW_PrintCurrentVersion();
  PrintLn("");

  ErrFile=f_mount(&FatFs, "", 1);
  if (ErrFile) {
    RunApp();
    return 1;
  }

  static FoundFirmware found;
  FirmwareStatus fwstat = FW_FindFirmware(&found);
  if (fwstat != FW_FOUND) {
    RunApp();
    return 3;
  }

  FW_FlashFirmware(&found);

  PrintLn("Storing flashed version");
  FW_SaveHeader(&found.header);

  RunApp();
	return 0;
}
