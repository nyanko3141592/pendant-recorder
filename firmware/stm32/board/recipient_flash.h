#ifndef PENDANT_RECIPIENT_FLASH_H
#define PENDANT_RECIPIENT_FLASH_H
#include <stdbool.h>
#include <stdint.h>

/* One-time public-recipient store in a linker-reserved 8 KiB flash page. */
bool board_recipient_flash_load(void *context,uint8_t recipient[32]);
bool board_recipient_flash_commit(const uint8_t recipient[32]);

#endif
