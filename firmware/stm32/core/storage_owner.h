#ifndef PENDANT_STORAGE_OWNER_H
#define PENDANT_STORAGE_OWNER_H
#include <stdbool.h>
/* Single-threaded event reducer. ISR callbacks enqueue events to the main task.
 * No driver may access the medium without ownership granted here. */
typedef enum { OWN_DEVICE, OWN_DRAINING, OWN_HOST, OWN_RECOVERING, OWN_STOPPED, OWN_EXPORT_READY, OWN_FAULT } owner_state;
typedef enum { USB_CONFIGURED, USB_DISCONNECTED, HOST_EJECTED,
               DEVICE_RELEASED, HOST_RELEASED, RECOVERY_OK, STOP_RECORDING, IO_FAILED } owner_event;
typedef enum { ACT_NONE=0, ACT_STOP_AND_FLUSH=1, ACT_EXPOSE_MSC=2,
               ACT_REVOKE_MSC=4, ACT_RECOVER_FS=8, ACT_RESUME_RECORDING=16,
               ACT_REPORT_FAULT=32 } owner_action;
typedef struct {
    owner_state state;
    bool usb_connected;
    bool resume_recording;
    bool fault_pending;
    bool recovery_started;
    bool stop_requested;
    bool export_only;
} storage_owner;
void owner_init(storage_owner *o, bool recording);
/* Caller must have closed/unmounted any filesystem before this transition.
 * Intended after card probe with owner_init(o,false), before USB starts. */
bool owner_prepare_export(storage_owner *o);
unsigned owner_step(storage_owner *o, owner_event e);
bool owner_device_can_access(const storage_owner *o);
bool owner_host_can_access(const storage_owner *o);
/* Only the stop coordinator may finalize encrypted files/sync/unmount here.
 * Ordinary acquisition must use owner_device_can_access instead. */
bool owner_device_can_finalize(const storage_owner *o);
/* Recovery IO is allowed only after host callbacks have been drained. */
bool owner_device_can_recover(const storage_owner *o);
#endif
