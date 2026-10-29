#ifndef PENDANT_EXPORT_RUNTIME_H
#define PENDANT_EXPORT_RUNTIME_H
#include "storage_probe.h"
#include "../usb/usb_session.h"
typedef struct {
 storage_owner owner;
 board_storage disk;
 usb_session usb;
 bool attempted,initialized,powered,stopped,failed,disconnect_seen;
} export_runtime;
/* Cold boot only. Zero-initialized object, no other USB/storage owner.
 * Caller establishes system clocks including HSI and qualified USB supply.
 * Never mounts FatFs, initializes audio/RNG, or starts recording. */
bool export_runtime_start(export_runtime *r);
/* Caller must have received success from recorder_runtime_stop and never
 * invoke the old recorder runtime again. Hardware also requires clean off. */
bool export_runtime_start_after_stop(export_runtime *r,const storage_owner *previous);
bool export_runtime_poll(export_runtime *r);
#endif
