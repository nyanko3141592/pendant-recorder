#ifndef PENDANT_SD_CAPACITY_H
#define PENDANT_SD_CAPACITY_H
#include <stdint.h>
#include <stdbool.h>
/* 16-byte CSD in wire order, bit127 first. Caller validates transport CRC.
 * OCR CCS must be checked after power-up ready. Capacity is RAW, not free FS.
 * Unsupported/inconsistent structures fail without changing output. */
bool sd_capacity_bytes(const uint8_t csd[16],bool ocr_ccs,uint64_t *bytes);
#endif
