#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
OUT=$(mktemp -d)
trap 'rm -rf "$OUT"' EXIT HUP INT TERM
for NAME in init read write; do
 cc -std=c11 -Wall -Wextra -Werror -Wno-misleading-indentation -fsanitize=address,undefined "$ROOT/core/sd_init.c" "$ROOT/core/sd_crc.c" "$ROOT/core/sd_capacity.c" "$ROOT/tests/test_sd_$NAME.c" -o "$OUT/$NAME"
 "$OUT/$NAME"
done
echo 'PASS chunked SD init/read/write CRC, every exchange failure, busy/status and payload integrity (mock transport)'
