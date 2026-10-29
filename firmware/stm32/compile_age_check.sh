#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
OUT=${PENDANT_AGE_BUILD:-/tmp/pendant-age-arm}
mkdir -p "$OUT"
for SRC in "$ROOT"/vendor/agec/*.c "$ROOT"/vendor/agec/crypto/*.c "$ROOT"/crypto/age_writer.c; do
 NAME=$(basename "$(dirname "$SRC")")-$(basename "$SRC" .c)
 arm-none-eabi-gcc -mcpu=cortex-m33 -mthumb -std=c11 -Os -ffunction-sections -fdata-sections -fstack-usage -Wall -Wextra -iquote "$ROOT/vendor/agec" -c "$SRC" -o "$OUT/$NAME.o"
done
# Compilation only. No firmware link or hardware RNG/storage qualification.
