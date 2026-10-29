#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
OUT=$(mktemp -d)
trap 'rm -rf "$OUT"' EXIT HUP INT TERM
cc -std=c11 -Wall -Wextra -Werror -fsanitize=address,undefined -I "$ROOT/tests/rng_mock" -I "$ROOT/vendor/fatfs" "$ROOT/board/recorder_boot.c" "$ROOT/core/storage_owner.c" "$ROOT/tests/test_recorder_boot.c" -o "$OUT/test"
"$OUT/test"
echo 'PASS: boot wiring and per-stage fault injection, zero-key/retry rejection, mounted cleanup (mock peripherals)'
