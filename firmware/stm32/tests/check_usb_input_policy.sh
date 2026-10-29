#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
OUT=$(mktemp -d)
trap 'rm -rf "$OUT"' EXIT HUP INT TERM
printf '#include <stdbool.h>\nbool tud_mounted(void);\nbool tud_suspended(void);bool tud_event_queue_overflowed(void);bool tud_task_event_ready(void);bool tud_configuration_acknowledged(void);\n' > "$OUT/tusb.h"
for CONFIG in 0:100:0 0:500:0 0:500:1 1:100:0 1:100:1; do
FIXED=${CONFIG%%:*}
CONFIG=${CONFIG#*:}
BUDGET=${CONFIG%:*}
CHARGING=${CONFIG#*:}
cc -DPENDANT_FIXED_USB_LIMIT=$FIXED -DPENDANT_EXPERIMENTAL_USB_CHARGING=$CHARGING -DPENDANT_USB_MAX_POWER_MA=$BUDGET -std=c11 -Wall -Wextra -Werror -fsanitize=address,undefined -I "$OUT" "$ROOT/usb/usb_input_policy.c" "$ROOT/tests/test_usb_input_policy.c" -o "$OUT/test"
"$OUT/test"
done
if cc -DPENDANT_FIXED_USB_LIMIT=0 -DPENDANT_USB_MAX_POWER_MA=100 -DPENDANT_EXPERIMENTAL_USB_CHARGING=1 -std=c11 -I "$OUT" -c "$ROOT/usb/usb_input_policy.c" -o "$OUT/invalid.o" 2>"$OUT/error"; then
 echo 'FAIL: charging accepted with 100mA' >&2
 exit 1
fi
grep -q 'Non-fixed charging requires the 500mA configuration' "$OUT/error"
if cc -DPENDANT_FIXED_USB_LIMIT=1 -DPENDANT_USB_MAX_POWER_MA=500 -std=c11 -I "$OUT" -c "$ROOT/usb/usb_input_policy.c" -o "$OUT/invalid-fixed.o" 2>"$OUT/error-fixed"; then
 echo 'FAIL: fixed board accepted 500mA descriptor' >&2
 exit 1
fi
grep -q 'Fixed limit board requires the 100mA descriptor' "$OUT/error-fixed"
echo 'PASS: fixed-100mA preconfiguration/power-only charge, non-fixed ACK gate, suspend, detach, event races and sticky hardware faults; mocked driver'
