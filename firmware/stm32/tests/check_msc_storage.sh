#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
OUT=$(mktemp -d)
trap 'rm -rf "$OUT"' EXIT HUP INT TERM
cc -std=c11 -Wall -Wextra -Werror -fsanitize=address,undefined -DSTM32U535xx -I "$ROOT/usb" -I "$ROOT/vendor/tinyusb/src" "$ROOT/tests/test_msc_storage.c" "$ROOT/usb/msc_storage.c" "$ROOT/core/storage_owner.c" -o "$OUT/test"
"$OUT/test"
echo 'PASS: read-only MSC, ownership/range/size gates, write protection, sense, eject and deferred fault actions; block backend mocked'
