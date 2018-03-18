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