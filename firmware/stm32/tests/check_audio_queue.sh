#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
OUT=$(mktemp -d)
trap 'rm -rf "$OUT"' EXIT HUP INT TERM
cc -std=c11 -Wall -Wextra -Werror -fsanitize=address,undefined "$ROOT/core/audio_queue.c" "$ROOT/tests/test_audio_queue.c" -o "$OUT/test"
"$OUT/test"
echo 'PASS audio queue and producer high-water telemetry (native ASAN/UBSAN)'
