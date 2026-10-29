#ifndef PENDANT_RECIPIENT_RECORD_H
#define PENDANT_RECIPIENT_RECORD_H
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

#define RECIPIENT_RECORD_BYTES 64U
#define RECIPIENT_RECORD_SLOTS 2U
#define RECIPIENT_COMMIT_OFFSET 48U
#define RECIPIENT_COMMIT_WORD 0xA55A3CC3UL

typedef enum {
 RECIPIENT_PLAN_WRITE_SLOT,
 RECIPIENT_PLAN_ALREADY_PROVISIONED,
 RECIPIENT_PLAN_NO_ERASED_SLOT,
 RECIPIENT_PLAN_INVALID_INPUT
} recipient_plan_result;

/* Slots are erased (all 0xff), partially programmed, or committed. A record is
 * accepted only when magic/version/CRC/commit all match and the key is nonzero. */
bool recipient_record_decode(const uint8_t slot[RECIPIENT_RECORD_BYTES],uint8_t recipient[32]);

/* Build the pre-commit image. The commit word remains erased and must be
 * programmed only after the rest of the slot has been written and verified. */
bool recipient_record_prepare(const uint8_t recipient[32],uint8_t image[RECIPIENT_RECORD_BYTES]);

/* Write-once selection. Any valid slot permanently blocks another key. A torn
 * slot is never accepted; provisioning may use the other fully erased slot. */
recipient_plan_result recipient_record_plan(
 const uint8_t slots[RECIPIENT_RECORD_SLOTS][RECIPIENT_RECORD_BYTES],
 const uint8_t recipient[32],size_t *slot_index);

#endif
