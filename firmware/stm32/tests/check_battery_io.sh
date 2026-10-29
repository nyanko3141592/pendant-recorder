#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
OUT=$(mktemp -d)
trap 'rm -rf "$OUT"' EXIT HUP INT TERM
for INTERVAL in 0 60000; do
cc -std=c11 -Wall -Wextra -Werror -fsanitize=address,undefined -DPENDANT_AUTOMATIC_BATTERY_INDICATOR_MS=$INTERVAL -I "$ROOT/tests/battery_io_mock" -I "$ROOT/board" -I "$ROOT/core" "$ROOT/tests/test_battery_io.c" "$ROOT/board/battery_io.c" -o "$OUT/test"
"$OUT/test"
done
echo 'PASS: real battery GPIO driver with mock IRQ/GPIO; init, mask preservation, timeout races, rearm, both PA15 profiles'
