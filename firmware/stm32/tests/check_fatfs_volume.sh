#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
OUT=$(mktemp -d)
trap 'rm -rf "$OUT"' EXIT HUP INT TERM
for TYPE in 0 1; do
cc -DTEST_FAT32="$TYPE" -std=c11 -Wall -Wextra -fsanitize=address,undefined -I "$ROOT/vendor/fatfs" "$ROOT/core/storage_owner.c" "$ROOT/crypto/fatfs_recording.c" "$ROOT/board/storage_diskio.c" "$ROOT/board/storage_handoff.c" "$ROOT/board/storage_mount.c" "$ROOT/vendor/fatfs/ff.c" "$ROOT/vendor/fatfs/ffunicode.c" "$ROOT/tests/test_fatfs_volume.c" -o "$OUT/test"
"$OUT/test"
done
echo 'PASS: real FatFs + diskio on synthetic RAM FAT16/FAT32: commit, exact AGE-range cleanup, TMP preservation, remount and free space'
