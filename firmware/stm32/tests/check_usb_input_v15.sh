#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
python3 "$ROOT/tests/check_usb_input_pinmap.py"
OUT=$(mktemp -d)
trap 'rm -rf "$OUT"' EXIT HUP INT TERM
for FIXED in 0 1; do
cc -DPENDANT_FIXED_USB_LIMIT=$FIXED -std=c11 -Wall -Wextra -Werror -fsanitize=address,undefined -I "$ROOT/tests/usb_input_mock" "$ROOT/board/usb_input_v15.c" "$ROOT/tests/test_usb_input_v15.c" -o "$OUT/test"
"$OUT/test"
done
echo 'PASS candidate input driver: retained OFF at boot, inhibit/order, budget revocation, suspend/resume, detach, IRQ/masked rejection; mock HAL only'
