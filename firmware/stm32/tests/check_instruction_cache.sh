#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
OUT=$(mktemp -d)
trap 'rm -rf "$OUT"' EXIT HUP INT TERM
cc -std=c11 -Wall -Wextra -Werror -fsanitize=address,undefined \
 -I "$ROOT/tests/icache_mock" "$ROOT/board/instruction_cache.c" \
 "$ROOT/tests/test_instruction_cache.c" -o "$OUT/test"
"$OUT/test"
