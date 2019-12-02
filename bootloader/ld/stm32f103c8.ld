/* memory layout for an STM32F103C8 */
MEMORY
{
    rom (rx)        : ORIGIN = 0x08000000, LENGTH = 64K
    rom_boot (rx)   : ORIGIN = 0x08000000, LENGTH = 8K
    rom_bootexe (rx): ORIGIN = 0x08000000, LENGTH = 7K
    rom_bootvar (r) : ORIGIN = 0x08000000 + 7K, LENGTH = 1K
    rom_app (rx)    : ORIGIN = 0x08000000 + 8K, LENGTH = 64K - 8K
    rom_appexe (rx) : ORIGIN = 0x08000000 + 8K, LENGTH = 64K - 8K - 1K
    rom_appvar (r)  : ORIGIN = 0x08000000 + 8K + 64K - 8K - 1K, LENGTH = 1K
    ram (xrw)       : ORIGIN = 0x20000000, LENGTH = 20K
}


/* Replace the above after binutils-arm-none-eabi-2.33 is available

See https://sourceware.org/bugzilla/show_bug.cgi?id=24289

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
*/

INCLUDE stm32f1.ld
