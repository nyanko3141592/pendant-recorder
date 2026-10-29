#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
OUT=$(mktemp -d)
trap 'rm -rf "$OUT"' EXIT HUP INT TERM
# Synthetic VID/PID only for native, non-USB tests. Not allocated to this project.
cc -std=c11 -Wall -Wextra -Werror -fsanitize=address,undefined -DSTM32U535xx -DPENDANT_USB_VID=0x1234 -DPENDANT_USB_PID=0x5678 -I "$ROOT/usb" -I "$ROOT/vendor/tinyusb/src" "$ROOT/tests/test_usb_descriptors.c" "$ROOT/usb/usb_descriptors.c" -o "$OUT/test"
"$OUT/test"
echo 'PASS: composite MSC+vendor-HID descriptor layout, endpoints, report, UID serial and invalid indices; synthetic IDs, no USB device'
