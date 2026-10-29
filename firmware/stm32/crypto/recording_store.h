#ifndef PENDANT_RECORDING_STORE_H
#define PENDANT_RECORDING_STORE_H
#include "age_writer.h"
#include "../core/storage_owner.h"
typedef struct {
 storage_owner *owner;
 uint8_t recipient[32];
 bool recipient_provisioned;
 bool failed;
 bool active;
 age_rng_fn rng;
 void *rng_ctx;
 /* begin creates a unique incomplete file. Never overwrite an existing file.
  * write receives ciphertext only. commit closes/syncs, publishes the
  * final .age name and syncs metadata. FAT rename powerfail atomicity is not
  * guaranteed; interrupted metadata needs explicit recovery validation. abort closes incomplete file, which must
  * stay excluded from host imports. All hooks are serialized on main task. */
 bool (*begin)(void *ctx);
 age_write_fn write;
 bool (*commit)(void *ctx);
 void (*abort)(void *ctx);
 void *io_ctx;
} recording_store;
/* recording_sink adapter; supports DEVICE and stop coordinator DRAINING only.
 * RNG ctx may be pendant_rng; no plaintext ever passes to storage hooks.
 * Must not recursively call; callbacks may report disconnect, not transfer MSC. */
bool recording_store_save(void *ctx,const uint8_t *wav,size_t bytes,uint32_t samples);
#endif
