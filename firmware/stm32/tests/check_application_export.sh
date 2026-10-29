#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
OUT=$(mktemp -d)
trap 'rm -rf "$OUT"' EXIT HUP INT TERM
for INTERVAL in 0 60000; do
cc -DPENDANT_AUTOMATIC_BATTERY_INDICATOR_MS=$INTERVAL -std=c11 -Wall -Wextra -Werror -fsanitize=address,undefined -DPENDANT_BATTERY_STOP_MV=3600 '-DPENDANT_AGE_RECIPIENT="TEST-PUBLIC-RECIPIENT"' -I "$ROOT/tests/rng_mock" -I "$ROOT/board" -I "$ROOT/core" -I "$ROOT/vendor/fatfs" -I "$ROOT/vendor/agec" "$ROOT/tests/test_application_export.c" "$ROOT/core/storage_owner.c" "$ROOT/core/battery_stop.c" "$ROOT/core/battery_monitor.c" "$ROOT/core/battery_indicator.c" -o "$OUT/test"
for CASE in 0 1 2 3 4 5 6 7; do "$OUT/test" "$CASE"; done
done
echo 'PASS: real main low-voltage export plus startup/runtime ADC failure and acquisition-starvation fail-closed gating; lifecycle/hardware mocked'
