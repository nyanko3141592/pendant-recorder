#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
OUT=$(mktemp -d)
trap 'rm -rf "$OUT"' EXIT HUP INT TERM
cc -std=c11 -Wall -Wextra -Werror -fsanitize=address,undefined -I "$ROOT/tests/rng_mock" "$ROOT/board/secure_random.c" "$ROOT/tests/test_secure_random.c" -o "$OUT/test"
"$OUT/test"
echo 'PASS: RNG adapter partial lengths, all word failure positions, clock/seed errors, wipe and sticky failure (mock HAL only)'
cc -std=c11 -Wall -Wextra -Werror -fsanitize=address,undefined -I "$ROOT/tests/rng_mock" "$ROOT/board/secure_random.c" "$ROOT/board/rng_board.c" "$ROOT/board/clock48.c" "$ROOT/tests/test_rng_board.c" -o "$OUT/startup"
for CASE in 0 1 2 3 4 5 6 7; do "$OUT/startup" "$CASE"; done
echo 'PASS: RNG startup success and oscillator/clock/frequency/init/generation failure (mock HAL)'
