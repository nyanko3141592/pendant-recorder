#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
OUT=$(mktemp -d)
trap 'rm -rf "$OUT"' EXIT HUP INT TERM
cc -std=c11 -Wall -Wextra -Werror -fsanitize=address,undefined -I "$ROOT/tests/rng_mock" "$ROOT/board/clock48.c" "$ROOT/tests/test_clock48.c" -o "$OUT/test"
for CASE in 0 1 2; do "$OUT/test" "$CASE"; done
echo 'PASS shared HSI48 lease ordering, duplicate/invalid/context rejection and sticky start/stop failure (mock)'
