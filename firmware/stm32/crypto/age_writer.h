#ifndef PENDANT_AGE_WRITER_H
#define PENDANT_AGE_WRITER_H
#include <stdbool.h>
#include <stdint.h>
#include <stddef.h>
/* RNG must provide cryptographically secure fresh bytes or fail. No fallback.
 * Writer must consume every byte or fail, and must not retain the pointer.
 * Return success means ciphertext produced; caller must close/flush/commit it.
 * Failed output is incomplete and must never be advertised as a valid file.
 * Not callable from an ISR. MCU input contains only the recipient public key. */
typedef bool (*age_rng_fn)(void *,uint8_t *,size_t);
typedef bool (*age_write_fn)(void *,const uint8_t *,size_t);
bool age_write_recording(const uint8_t recipient[32],const uint8_t *plain,size_t length,
                         age_rng_fn rng,age_write_fn writer,void *ctx);
#endif
