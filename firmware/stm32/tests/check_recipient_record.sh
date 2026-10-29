#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
OUT=$(mktemp -d)
trap 'rm -rf "$OUT"' EXIT HUP INT TERM
cc -std=c11 -Wall -Wextra -Werror -fsanitize=address,undefined -I "$ROOT/core" \
 "$ROOT/tests/test_recipient_record.c" "$ROOT/core/recipient_record.c" -o "$OUT/test"
"$OUT/test"
echo 'PASS: recipient record CRC/commit validation, torn-write recovery, two-slot selection and write-once rejection'
