#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
OUT=$(mktemp -d)
trap 'rm -rf "$OUT"' EXIT HUP INT TERM
cc -std=c11 -Wall -Wextra -Werror -fsanitize=address,undefined "$ROOT/core/storage_owner.c" "$ROOT/crypto/recording_store.c" "$ROOT/tests/test_recording_store.c" -o "$OUT/test"
"$OUT/test"
echo 'PASS: recording store transaction ordering and failures; mocked crypto/filesystem'
