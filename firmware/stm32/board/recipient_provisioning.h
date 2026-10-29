#ifndef PENDANT_RECIPIENT_PROVISIONING_H
#define PENDANT_RECIPIENT_PROVISIONING_H
#include <stdbool.h>

/* Unprovisioned boot path. Never starts audio/storage. Runs USB HID until a
 * public recipient is committed and read back, then waits for unplug/reset. */
bool board_recipient_provisioning_run(void);

#endif
