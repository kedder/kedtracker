#ifndef __CRC32_H__
#define __CRC32_H__

#include <stdint.h>

void CRC_Calculate(const void *data, int n_bytes, uint32_t* crc);
#endif