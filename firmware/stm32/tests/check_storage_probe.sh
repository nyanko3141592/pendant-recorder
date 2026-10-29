#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
OUT=$(mktemp -d)
trap 'rm -rf "$OUT"' EXIT HUP INT TERM
cc -std=c11 -Wall -Wextra -Werror -fsanitize=address,undefined -I "$ROOT/tests/storage_mock" "$ROOT/tests/test_storage_probe.c" "$ROOT/board/storage_probe.c" "$ROOT/core/storage_owner.c" -o "$OUT/test"
"$OUT/test"
echo 'PASS: device/host ownership gates and IO failure invalidation; SD protocol/HAL mocked'
