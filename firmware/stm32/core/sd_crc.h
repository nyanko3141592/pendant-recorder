#ifndef PENDANT_SD_CRC_H
#define PENDANT_SD_CRC_H
#include <stdint.h>
#include <stddef.h>
/* SD CRC7 x^7+x^3+1, initial0, returns low7bits (no stopbit).
 * SD data CRC16 x^16+x^12+x^5+1, initial0, MSB first. */
uint8_t sd_crc7(const uint8_t *data,size_t size);
uint16_t sd_crc16(const uint8_t *data,size_t size);
/* Build6byte SPI command with CRC enabled, command index0..63.
 * Invalid index/output returns false and leaves output unchanged. */
#include <stdbool.h>
bool sd_command_packet(uint8_t index,uint32_t argument,uint8_t out[6]);
#endif
