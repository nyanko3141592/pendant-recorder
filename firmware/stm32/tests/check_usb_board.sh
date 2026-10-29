#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
OUT=$(mktemp -d)
trap 'rm -rf "$OUT"' EXIT HUP INT TERM
cc -std=c11 -Wall -Wextra -Werror -fsanitize=address,undefined -DSTM32U535xx -I "$ROOT/usb" -I "$ROOT/vendor/tinyusb/src" -I "$ROOT/tests/usb_board_mock" "$ROOT/board/usb_board.c" "$ROOT/board/clock48.c" "$ROOT/tests/test_usb_board.c" -o "$OUT/test"
for CASE in 0 1 2 3 4 5 6; do "$OUT/test" "$CASE"; done
echo 'PASS USB board real adapter + shared clock manager: lifecycle, partial startup, detach, deinit failures, shared owner and clock stop failure (mock HAL/TinyUSB)'
