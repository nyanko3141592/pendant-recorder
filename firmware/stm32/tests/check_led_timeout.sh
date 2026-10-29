#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
OUT=$(mktemp -d)
trap 'rm -rf "$OUT"' EXIT HUP INT TERM
cc -std=c11 -Wall -Wextra -Werror -fsanitize=address,undefined -I "$ROOT/core" "$ROOT/tests/test_led_timeout.c" -o "$OUT/test"
"$OUT/test"
echo 'PASS: timeout after 650 delivered ticks; held-high cannot rearm; low resets'
