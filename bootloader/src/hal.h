#ifndef __HAL_H__
#define __HAL_H__

#include <stdint.h>
#include "stm32f10x_gpio.h"

/* Memory map from .ld scripts */
extern uint32_t _start_rom;
extern uint32_t _start_rom_app;
extern uint32_t _start_rom_bootvar;
extern uint32_t _length_rom;
extern uint32_t _length_rom_app;

#define MAIN_PROGRAM_START_ADDRESS (uint32_t)&_start_rom_app 
#define BOOT_STORAGE_ADDRESS (uint32_t)&_start_rom_bootvar 
#define FLASH_PAGE_SIZE 1024
#define NUM_OF_PAGES (uint32_t)&_length_rom / FLASH_PAGE_SIZE
#define MAIN_PROGRAM_PAGE_NUMBER ((uint32_t)&_start_rom_app - (uint32_t)&_start_rom) / FLASH_PAGE_SIZE  

void HAL_SetupHardware(void);

void HAL_LedOn(void);
void HAL_LedOff(void);

void HAL_ConsoleWrite(char ch);

uint8_t HAL_SDTransferByte(uint8_t Byte);
void HAL_SDFast(void);
void HAL_SDSlow(void);
#define HAL_SDSelect() GPIOB->BRR  = GPIO_Pin_12;
#define HAL_SDDeselect() GPIOB->BSRR = GPIO_Pin_12;

#endif