#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
OUT=$(mktemp -d)
trap 'rm -rf "$OUT"' EXIT HUP INT TERM
cat > "$OUT/tusb.h" <<'HEADER'
#include <stdint.h>
#include <stdbool.h>
#define CFG_TUD_TASK_EVENTS_PER_RUN 1
bool tud_mounted(void);
bool tud_suspended(void);bool tud_event_queue_overflowed(void);
void tud_task_ext(uint32_t timeout,bool isr);
HEADER
cc -std=c11 -Wall -Wextra -Werror -fsanitize=address,undefined -I "$OUT" "$ROOT/usb/usb_session.c" "$ROOT/usb/usb_input_policy.c" "$ROOT/core/storage_owner.c" "$ROOT/tests/usb_input_policy_runtime_stub.c" "$ROOT/tests/test_usb_session.c" -o "$OUT/test"
"$OUT/test"
echo 'PASS: reset/deconfiguration ownership, deferred recovery, eject, drain, and sticky input-power fault propagation'
