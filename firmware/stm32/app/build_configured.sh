#!/bin/bash
# Engineering application build only. No flashing or production release.
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
if [ "$#" -ne 2 ]; then echo 'Usage: build_configured.sh PUBLIC_CONFIG_DIRECTORY NEW_OUTPUT_DIRECTORY' >&2; exit 2; fi
CONFIG_DIR=$(cd -- "$1" && pwd)
python3 - "$CONFIG_DIR" <<'PY'
import sys,json,hashlib
from pathlib import Path
p=Path(sys.argv[1]);m=json.loads((p/'config-manifest.json').read_text())
assert m['status'] in ('ENGINEERING_CONFIG_ONLY_NOT_FLASH_OR_RELEASE','ENGINEERING_COMMON_CONFIG_ONLY_NOT_FLASH_OR_RELEASE')
assert m['private_key_included'] is False
assert hashlib.sha256((p/'device-config.h').read_bytes()).hexdigest()==m['header_sha256']
PY
mkdir -- "$2"
OUT=$(cd -- "$2" && pwd)
PENDANT_CONFIGURED_APPLICATION=1 PENDANT_CONFIG_HEADER="$CONFIG_DIR/device-config.h" PENDANT_MAIN_SOURCE="$ROOT/app/main.c" PENDANT_GC_SECTIONS=1 PENDANT_LINK_BUILD="$OUT" bash "$ROOT/linkcheck/build.sh"
cp "$CONFIG_DIR/config-manifest.json" "$OUT/public-config-manifest.json"
arm-none-eabi-objcopy -O binary "$OUT/candidate-NOT-FOR-FLASH.elf" "$OUT/application-UNQUALIFIED.bin"

python3 "$ROOT/app/record_build.py" "$OUT" "$ROOT" "$CONFIG_DIR"
