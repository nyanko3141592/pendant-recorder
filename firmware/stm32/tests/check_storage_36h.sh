#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
OUT=$(mktemp -d)
trap 'rm -rf "$OUT"' EXIT HUP INT TERM
TYPE=1
# Canonical product candidate: cooperative ten-second chunks, 30 hours.
FLAGS="-DPENDANT_COOPERATIVE_SAVE -DWAV_CHUNK_SAMPLES=160000U"
# Opt-in candidate capacity test. Does not change the selected hardware profile.
case "${PENDANT_STORAGE_CAPACITY_PROFILE:-current30}" in
 current30) ;;
 candidate36) FLAGS="$FLAGS -DTEST_FILES=12960U -DTEST_SECTORS=2929688U -DTEST_FAT_SECTORS=3000U" ;;
 *) echo "Unknown capacity profile" >&2; exit 2 ;;
esac
cc $FLAGS -DTEST_FAT32="$TYPE" -std=c11 -Wall -Wextra -fsanitize=address,undefined -I "$ROOT/vendor/fatfs" "$ROOT/core/storage_owner.c" "$ROOT/crypto/fatfs_recording.c" "$ROOT/board/storage_diskio.c" "$ROOT/board/storage_handoff.c" "$ROOT/board/storage_mount.c" "$ROOT/vendor/fatfs/ff.c" "$ROOT/vendor/fatfs/ffunicode.c" "$ROOT/tests/test_storage_36h.c" -o "$OUT/test"
"$OUT/test" "$@"
