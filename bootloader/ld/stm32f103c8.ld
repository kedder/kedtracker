/* memory layout for an STM32F103C8 */
MEMORY
{
    rom (rx)        : ORIGIN = 0x08000000, LENGTH = 64K
    rom_boot (rx)   : ORIGIN = ORIGIN(rom), LENGTH = 8K
    rom_bootexe (rx): ORIGIN = ORIGIN(rom_boot), LENGTH = 7K
    rom_bootvar (r) : ORIGIN = ORIGIN(rom_boot) + LENGTH(rom_bootexe), LENGTH = 1K
    rom_app (rx)    : ORIGIN = ORIGIN(rom) + LENGTH(rom_boot), LENGTH = LENGTH(rom) - LENGTH(rom_boot)
    rom_appexe (rx) : ORIGIN = ORIGIN(rom_app), LENGTH = LENGTH(rom_app) - 1K
    rom_appvar (r)  : ORIGIN = ORIGIN(rom) + LENGTH(rom_boot) + LENGTH(rom_appexe), LENGTH = 1K
    ram (xrw)       : ORIGIN = 0x20000000, LENGTH = 20K
}

INCLUDE stm32f1.ld
