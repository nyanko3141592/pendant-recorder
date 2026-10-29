#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
OUT=$(mktemp -d)
trap 'rm -rf "$OUT"' EXIT HUP INT TERM
cc -std=c11 -Wall -Wextra -Werror -fsanitize=address,undefined \
 -DPENDANT_COOPERATIVE_SAVE -DWAV_CHUNK_SAMPLES=160000U \
 -I "$ROOT/tests/storage_mock" "$ROOT/board/storage_probe.c" \
 "$ROOT/core/storage_owner.c" "$ROOT/core/recording_pipeline.c" \
 "$ROOT/core/cooperative_pipeline.c" "$ROOT/core/audio_queue.c" \
 "$ROOT/core/wav_chunk.c" "$ROOT/core/ima_adpcm.c" \
 "$ROOT/tests/test_cooperative_storage.c" -o "$OUT/test"
"$OUT/test"
