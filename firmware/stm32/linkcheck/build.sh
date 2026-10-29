#!/bin/bash
# Canonical STM32U585CI production-candidate link. No flashing or release.
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
exec bash "$ROOT/build_u585_candidate.sh"
