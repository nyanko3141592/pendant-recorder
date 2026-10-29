#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
OUT=$(mktemp -d)
trap 'rm -rf "$OUT"' EXIT HUP INT TERM
cc -std=c11 -Wall -Wextra -Werror -fsanitize=address,undefined -I "$ROOT/tests/system_clock_mock" "$ROOT/board/system_clock.c" "$ROOT/tests/test_system_clock.c" -o "$OUT/test"
"$OUT/test"
