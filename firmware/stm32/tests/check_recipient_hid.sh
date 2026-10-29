#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
OUT=$(mktemp -d)
trap 'rm -rf "$OUT"' EXIT HUP INT TERM
cc -std=c11 -Wall -Wextra -Werror -fsanitize=address,undefined -DSTM32U535xx \
 -DCFG_TUD_HID=1 -DCFG_TUD_HID_EP_BUFSIZE=65 -I "$ROOT/usb" -I "$ROOT/vendor/tinyusb/src" \
 "$ROOT/tests/test_recipient_hid.c" "$ROOT/usb/recipient_hid.c" -o "$OUT/test"
"$OUT/test"
echo 'PASS: HID recipient framing, CRC rejection, default-deny physical provisioning gate, deferred commit, readback, failure and write-once behavior'
