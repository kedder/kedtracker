#include "serial.h"
#include "hal.h"

#define CRNL "\r\n"

void Print(char *str) {
	while (*str) {
		HAL_ConsoleWrite(*(str++));
	};
}

void PrintLn(char *str) {
    Print(str);
    Print(CRNL);
}
