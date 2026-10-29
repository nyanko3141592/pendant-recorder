#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
OUT=$(mktemp -d)
trap 'rm -rf "$OUT"' EXIT HUP INT TERM
cc -std=c11 -Wall -Wextra -Werror -fsanitize=address,undefined -I "$ROOT/tests/battery_mock" -I "$ROOT/core" "$ROOT/board/battery_adc.c" "$ROOT/core/battery_voltage.c" "$ROOT/tests/test_battery_adc.c" -o "$OUT/test"
"$OUT/test"
echo 'PASS: ADC adapter mock success and every HAL failure; output preservation and clock cleanup'
