#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
OUT=$(mktemp -d)
trap 'rm -rf "$OUT"' EXIT HUP INT TERM
case "$(uname -s)" in Darwin) GC=-Wl,-dead_strip;; *) GC=-Wl,--gc-sections;; esac
cc -std=c11 -Wall -Wextra -Werror -ffunction-sections -fdata-sections -DSTM32U535xx -I "$ROOT/usb" -I "$ROOT/vendor/tinyusb/src" "$ROOT/tests/usb_event_queue_bridge.c" "$ROOT/tests/test_usb_event_queue.c" "$ROOT/vendor/tinyusb/src/common/tusb_fifo.c" "$GC" -o "$OUT/test"
"$OUT/test"
echo 'PASS actual TinyUSB queue: reset/unplug/suspend hook on full and available queue, ISR and task context'
