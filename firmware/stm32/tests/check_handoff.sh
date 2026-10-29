#!/bin/sh
set -eu
PROJECT_ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/../../.." && pwd)
TEST_DIR=$(mktemp -d)
trap 'rm -rf "$TEST_DIR"' EXIT HUP INT TERM
CORE="$PROJECT_ROOT/firmware/stm32/core"
FLAGS="-DPENDANT_LINK_FIXTURE=1"
if [ "${PENDANT_TEST_COOPERATIVE:-0}" = 1 ]; then FLAGS="$FLAGS -DPENDANT_COOPERATIVE_SAVE -DWAV_CHUNK_SAMPLES=160000U"; fi
cc $FLAGS -std=c11 -Wall -Wextra -Werror -fsanitize=address,undefined \
 "$CORE/storage_owner.c" "$CORE/audio_queue.c" "$CORE/ima_adpcm.c" \
 "$CORE/cooperative_pipeline.c" "$CORE/wav_chunk.c" "$CORE/recording_pipeline.c" "$CORE/recording_handoff.c" \
 "$PROJECT_ROOT/firmware/stm32/tests/test_recording_handoff.c" -o "$TEST_DIR/handoff"
"$TEST_DIR/handoff" "$TEST_DIR/PENDANT.JSON"
PYTHONPATH="$PROJECT_ROOT/host" python3 -c 'from device_discovery import discover;from pathlib import Path;import sys;p=Path(sys.argv[1]);assert discover([p])==[p]' "$TEST_DIR"
arm-none-eabi-gcc $FLAGS -mcpu=cortex-m33 -mthumb -std=c11 -Wall -Wextra -Werror \
 -c "$CORE/recording_handoff.c" -o "$TEST_DIR/handoff.o"
echo 'PASS: stop/tail/commit/identity/unmount/owner sequencing and host marker recognition; native hooks only, no USB hardware'
