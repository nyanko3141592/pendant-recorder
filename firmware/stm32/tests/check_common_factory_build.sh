#!/bin/sh
set -eu
REPO=$(CDPATH= cd -- "$(dirname -- "$0")/../../.." && pwd);TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT HUP INT TERM
python3 "$REPO/host/prepare_factory_config.py" --directory "$TMP/config" \
 --vid 0x1209 --pid 0x0001 --cutoff-mv 3300 --usb-profile fixed-100 >/dev/null
sh "$REPO/firmware/stm32/app/build_configured.sh" "$TMP/config" "$TMP/build" >/dev/null
python3 - "$TMP/config/config-manifest.json" "$TMP/build/build-manifest.json" "$TMP/build/application-UNQUALIFIED.bin" <<'PY'
import json,sys
from pathlib import Path
config=json.load(open(sys.argv[1]));build=json.load(open(sys.argv[2]));binary=Path(sys.argv[3]).read_bytes()
assert config['profile']=='FIRST_USE_HID_RECIPIENT' and not config['buyer_public_key_included']
assert config['recipient'] is None and config['recipient_key_sha256'] is None
assert build['status']=='ENGINEERING_BUILD_UNQUALIFIED_NOT_FOR_FLASH'
for field in ('hardware_revision','firmware_version','source_revision'):
    assert build[field] == config[field]
assert build['configuration_profile'] == config['profile']
assert b'age1qqqq' not in binary and b'AGE-SECRET-KEY-' not in binary
PY
echo 'PASS: common U585 factory image links without buyer recipient/private key; synthetic IDs and unqualified cutoff, never flash'
