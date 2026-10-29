#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd);OUT=$(mktemp -d)
trap 'rm -rf "$OUT"' EXIT HUP INT TERM
cat > "$OUT/stm32u5xx_hal.h" <<'EOF'
#include <stdbool.h>
#include <stdint.h>
unsigned __get_IPSR(void);unsigned __get_PRIMASK(void);uint32_t HAL_GetTick(void);void __WFI(void);void NVIC_SystemReset(void);
EOF
cat > "$OUT/tusb.h" <<'EOF'
#include <stdbool.h>
#include <stdint.h>
#define TUSB_ROLE_DEVICE 1
#define TUSB_SPEED_FULL 1
typedef struct {int role,speed;} tusb_rhport_init_t;
bool tusb_rhport_init(uint8_t,const tusb_rhport_init_t *);void tud_task_ext(uint32_t,bool);
bool tud_mounted(void);bool tud_suspended(void);bool tud_event_queue_overflowed(void);
EOF
for CHARGING in 0 1; do
 cc -DPENDANT_FIXED_USB_LIMIT=1 -DPENDANT_EXPERIMENTAL_USB_CHARGING=$CHARGING -std=c11 -Wall -Wextra -Werror -fsanitize=address,undefined -I "$OUT" -I "$ROOT/usb" \
  "$ROOT/tests/test_recipient_provisioning.c" "$ROOT/board/recipient_provisioning.c" "$ROOT/usb/usb_input_policy.c" "$ROOT/tests/usb_input_policy_runtime_stub.c" -o "$OUT/test-$CHARGING"
 "$OUT/test-$CHARGING"
done
echo 'PASS: unprovisioned USB-only path requires continuous 2s button confirmation, commits/readbacks recipient, waits for unplug, stops USB and resets; hardware mocked'
