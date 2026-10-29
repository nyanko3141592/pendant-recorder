#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
OUT=$(mktemp -d)
trap 'rm -rf "$OUT"' EXIT HUP INT TERM
cat > "$OUT/stm32u5xx_hal.h" <<'EOF'
#include <stdbool.h>
unsigned __get_IPSR(void);unsigned __get_PRIMASK(void);
EOF
cc -std=c11 -Wall -Wextra -Werror -fsanitize=address,undefined -I "$OUT" -I "$ROOT/board" \
 "$ROOT/board/terminal_fault.c" "$ROOT/tests/test_terminal_fault.c" -o "$OUT/test"
"$OUT/test"
echo 'PASS: terminal fault always attempts charge, LED, USB and storage quiescence before VBUS/Standby policy; failures mocked'
