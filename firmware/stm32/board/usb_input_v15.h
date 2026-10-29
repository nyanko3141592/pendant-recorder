#ifndef PENDANT_USB_INPUT_V15_H
#define PENDANT_USB_INPUT_V15_H
#include <stdbool.h>
#include <stdint.h>
/* Canonical XE fixed input-limit policy: 100mA USB descriptor with an
 * independent TPS2552DBVR-1 guaranteed 50..100mA latch-off limit. The
 * historical function name is retained for API compatibility. Fixed
 * hardware only controls CHG_ALLOW; legacy budget GPIOs are not configured. */
void board_usb_input_v15_init(void);
void board_usb_input_v15_revoke(void);
/* Nonblocking GPIO-only revocation; safe in ISR/masked context after init.
 * Does not clock the retained OFF latch; suspend still needs its own path. */
void board_usb_input_v15_revoke_from_isr(void);
/* Capture BEFORE checking host configuration; never refresh a stale grant. */
uint32_t board_usb_input_v15_epoch(void);
bool board_usb_input_v15_configured(unsigned granted_ma,uint32_t expected_epoch);
/* Electrical request only: caller must qualify battery/thermal conditions.
 * A new grant must settle for 10ms before the request can assert. This is
 * an engineering delay, not proof of comparator readiness. Not called by the default policy. A later revoke clears this request.
 * Renewing the same valid grant preserves the charging request. */
bool board_usb_input_v15_charge_request(uint32_t expected_epoch);
bool board_usb_input_v15_suspend(void);
bool board_usb_input_v15_resume(void);
#endif
