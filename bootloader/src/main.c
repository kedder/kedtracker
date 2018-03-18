#include <stdbool.h>

#include "stm32f10x.h"
#include "stm32f10x_flash.h"

#include "hal.h"
#include "ff.h"
#include "serial.h"
#include "crc32.h"
#include "firmware.h"

static FATFS       FatFs;                                         // FatFS object for the file system (FAT)

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

bool LedSet(bool on) {
  if (on) {
    HAL_LedOn();
  }
  else {
    HAL_LedOff();
  }
  return !on;
}


int main(void) {
  FRESULT ErrFile;

  HAL_SetupHardware();

  PrintLn("** Ked Tracker Bootloader **");
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

  // Print("Found firmware version ");
  // FW_PrintVersion(&found.header);
  // Print(" in ");
  // Print(found.fileinfo.fname);
  // PrintLn(": flashing");
  FW_FlashFirmware(&found);

  PrintLn("Storing flashed version");
  FW_SaveHeader(&found.header);

  RunApp();
	return 0;
}
