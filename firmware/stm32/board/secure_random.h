#ifndef PENDANT_SECURE_RANDOM_H
#define PENDANT_SECURE_RANDOM_H
#include "stm32u5xx_hal.h"
#include <stdbool.h>
#include <stddef.h>
typedef struct { RNG_HandleTypeDef *handle; bool failed; } pendant_rng;
/* Caller initializes RNG with clock error detection, validated clock frequency,
 * and active HAL tick. Main task only; no concurrent HAL RNG consumers.
 * Compatible with age_rng_fn when ctx points to this state (or via wrapper).
 * A failure is sticky for the session; no software entropy fallback. */
bool pendant_random_bytes(void *ctx,uint8_t *out,size_t length);
#endif
