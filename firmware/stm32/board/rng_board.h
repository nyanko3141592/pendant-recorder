#ifndef PENDANT_RNG_BOARD_H
#define PENDANT_RNG_BOARD_H
#include "secure_random.h"
/* Once per reset: health probe, then RNG and shared clock lease released.
 * Main task with active HAL tick; exclusive RNG ownership. */
bool board_rng_init(pendant_rng *state);
/* Initialize and health-check hardware on each nonempty request, then stop it.
 * Only the successfully initialized state is accepted. Failures are sticky,
 * wipe the output, and never fall back to software entropy. */
bool board_rng_bytes(void *ctx,uint8_t *out,size_t length);
#endif
