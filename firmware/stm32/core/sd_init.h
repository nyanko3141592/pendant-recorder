#ifndef PENDANT_SD_INIT_H
#define PENDANT_SD_INIT_H
#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>
#define SD_TRANSFER_CHUNK 32U
/* Transport must accept 1..SD_TRANSFER_CHUNK bytes per exchange. */
typedef struct {
 bool (*exchange)(void *,const uint8_t *,uint8_t *,size_t);
 void (*select)(void *,bool);
 uint32_t (*milliseconds)(void *);
 void *ctx;
} sd_transport;
/* SDv2-capable SDSC/SDHC only. Rail settled, SPI<=400kHz, exclusive owner.
 * Each exchange must have its own finite timeout; clock must advance.
 * Read-only initialization: no erase, format or sector writes.
 * Output unchanged on failure; card deselected on exit. */
typedef struct { uint64_t capacity_bytes; bool block_addressed; } sd_card_info;
bool sd_initialize_card(const sd_transport *io,sd_card_info *info);
/* Compatibility capacity-only probe. IO callers must use full info above. */
bool sd_initialize(const sd_transport *io,uint64_t *capacity);
/* Initialized card with CMD59 CRC enabled; caller holds exclusive ownership.
 * ccs must come from OCR, never infer addressing mode from capacity.
 * CRC failure/timeout leaves output unchanged; local512byte staging buffer. */
bool sd_read_sector(const sd_transport *io,bool ccs,uint64_t capacity_bytes,
                    uint64_t lba,uint8_t out[512]);
/* Writes exactly one existing sector; no retry on ambiguous failure.
 * Caller must treat false as possible partial/committed write and recover FS.
 * Busy completion+CMD13 checked, but power-loss atomicity is not guaranteed. */
bool sd_write_sector(const sd_transport *io,bool ccs,uint64_t capacity_bytes,
                     uint64_t lba,const uint8_t data[512]);
#endif
