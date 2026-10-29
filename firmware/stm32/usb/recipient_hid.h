#ifndef PENDANT_RECIPIENT_HID_H
#define PENDANT_RECIPIENT_HID_H
#include <stdbool.h>
#include <stdint.h>

#define RECIPIENT_HID_REPORT_ID 1U
#define RECIPIENT_HID_REPORT_BYTES 64U

typedef enum {
 RECIPIENT_HID_UNAVAILABLE=0,
 RECIPIENT_HID_UNPROVISIONED=1,
 RECIPIENT_HID_PENDING=2,
 RECIPIENT_HID_PROVISIONED=3,
 RECIPIENT_HID_FAILED=4,
 RECIPIENT_HID_CONFIRM_REQUIRED=5
} recipient_hid_status;

typedef bool (*recipient_hid_load_fn)(void *context,uint8_t recipient[32]);

/* Initialize before USB. load() reads only a fully committed flash record. */
void recipient_hid_init(recipient_hid_load_fn load,void *context);
/* Main-loop only: take one validated public-key request for persistent commit. */
bool recipient_hid_take_pending(uint8_t recipient[32]);
/* Main-loop only: report verified persistent commit or failure. */
void recipient_hid_complete(bool committed,const uint8_t recipient[32]);
recipient_hid_status recipient_hid_current_status(void);
/* Initial write-once provisioning physical-presence gate. Default deny.
 * Authorization is consumed by one accepted recipient request. */
void recipient_hid_set_provision_authorized(bool authorized);
/* Main-loop physical-presence gate. Default and every initialization are deny.
 * A successful cleanup request consumes this authorization. */
void recipient_hid_set_cleanup_authorized(bool authorized);
bool recipient_hid_take_cleanup(uint32_t *first,uint32_t *last);
void recipient_hid_cleanup_complete(bool applied);

#endif
