#include "storage_owner.h"
void owner_init(storage_owner *o, bool recording) {
    *o=(storage_owner){.state=OWN_DEVICE,.resume_recording=recording};
}
bool owner_prepare_export(storage_owner *o) {
    if(!o || o->state!=OWN_DEVICE || o->resume_recording || o->usb_connected ||
       o->fault_pending || o->stop_requested) return false;
    o->export_only=true;
    o->state=OWN_EXPORT_READY;
    return true;
}
bool owner_device_can_access(const storage_owner *o) { return o->state==OWN_DEVICE; }
bool owner_host_can_access(const storage_owner *o) { return o->state==OWN_HOST; }
bool owner_device_can_finalize(const storage_owner *o) {
    return o->state==OWN_DRAINING && !o->fault_pending;
}
bool owner_device_can_recover(const storage_owner *o) {
    return o->state==OWN_RECOVERING && o->recovery_started && !o->fault_pending;
}
unsigned owner_step(storage_owner *o, owner_event e) {
    if(e==USB_CONFIGURED) o->usb_connected=true;
    if(e==USB_DISCONNECTED) o->usb_connected=false;
    if(e==IO_FAILED) {
        o->fault_pending=true;
        if(o->state==OWN_HOST) {
            o->state=OWN_RECOVERING;
            return ACT_REVOKE_MSC|ACT_REPORT_FAULT;
        }
        o->state=OWN_FAULT;
        return ACT_REPORT_FAULT;
    }
    /* Controlled stop is accepted only while device owns or drains the FS.
     * Host/recovery callers must retry after ownership returns. No fake USB. */
    if(e==STOP_RECORDING && (o->state==OWN_DEVICE || o->state==OWN_DRAINING)) {
        o->stop_requested=true;
        o->resume_recording=false;
        if(o->state==OWN_DEVICE) { o->state=OWN_DRAINING; return ACT_STOP_AND_FLUSH; }
        return ACT_NONE;
    }
    switch(o->state) {
    case OWN_EXPORT_READY:
        /* No mounted filesystem or acquisition to flush in export-only boot. */
        if(e==USB_CONFIGURED) { o->state=OWN_HOST; return ACT_EXPOSE_MSC; }
        if(e==USB_DISCONNECTED || e==HOST_EJECTED || e==STOP_RECORDING)
            o->state=OWN_STOPPED;
        break;
    case OWN_DEVICE:
        if(e==USB_CONFIGURED) { o->state=OWN_DRAINING; return ACT_STOP_AND_FLUSH; }
        break;
    case OWN_DRAINING:
        /* DMA stop -> encrypt final segment -> close/sync -> unmount -> event.
         * Disconnect cannot skip this barrier. No host blocks before it. */
        if(e==DEVICE_RELEASED) {
            if(o->stop_requested) { o->state=OWN_STOPPED; return ACT_NONE; }
            if(o->usb_connected) { o->state=OWN_HOST; o->recovery_started=false; return ACT_EXPOSE_MSC; }
            o->state=OWN_RECOVERING;
            o->recovery_started=true;
            return ACT_RECOVER_FS;
        }
        break;
    case OWN_HOST:
        if(e==USB_DISCONNECTED || e==HOST_EJECTED) {
            o->state=OWN_RECOVERING;
            o->recovery_started=false;
            return ACT_REVOKE_MSC;
        }
        break;
    case OWN_RECOVERING:
        /* Driver must drain in-flight MSC callbacks before HOST_RELEASED.
         * A reconnect cannot interrupt FS recovery; the USB adapter must
         * re-issue configuration after recovery if a new session is pending. */
        if(e==HOST_RELEASED && !o->recovery_started) {
            if(o->fault_pending) { o->state=OWN_FAULT; return ACT_REPORT_FAULT; }
            /* The controller is drained first; export mode must not mount,
             * repair or resume writes after VBUS loss or host eject. Runtime
             * powers storage down after observing OWN_STOPPED. */
            if(o->export_only) { o->state=OWN_STOPPED; return ACT_NONE; }
            o->recovery_started=true;
            return ACT_RECOVER_FS;
        }
        if(e==RECOVERY_OK && o->recovery_started && !o->fault_pending) {
            o->state=OWN_DEVICE;
            /* Eject while still attached must not trigger a remount loop.
             * A fresh USB_CONFIGURED event starts the next import. */
            return o->resume_recording ? ACT_RESUME_RECORDING : ACT_NONE;
        }
        break;
    case OWN_STOPPED: break; /* Unmounted; explicit reset/recovery policy required. */
    case OWN_FAULT: break; /* Explicit diagnostic/reset required; never format. */
    }
    return ACT_NONE;
}
