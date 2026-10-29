#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
OUT=$(mktemp -d)
trap 'rm -rf "$OUT"' EXIT HUP INT TERM
cat > "$OUT/stm32u5xx_hal.h" <<'EOF'
#include <stdbool.h>
#include <stdint.h>
#define PWR_WAKEUP_PIN1 1U
#define PWR_WAKEUP_PIN1_LOW_0 0x101U
#define PWR_WAKEUP_FLAG1 1U
unsigned __get_IPSR(void);unsigned __get_PRIMASK(void);
void HAL_PWR_DisableWakeUpPin(uint32_t);void HAL_PWR_EnableWakeUpPin(uint32_t);void HAL_PWR_EnterSTANDBYMode(void);
void mock_clear_flag(uint32_t);void mock_dsb(void);void mock_isb(void);
#define __HAL_PWR_CLEAR_FLAG(x) mock_clear_flag(x)
#define __DSB() mock_dsb()
#define __ISB() mock_isb()
EOF
cc -std=c11 -Wall -Wextra -Werror -fsanitize=address,undefined -I "$OUT" -I "$ROOT/board" \
 "$ROOT/board/low_battery_standby.c" "$ROOT/tests/test_low_battery_standby.c" -o "$OUT/test"
"$OUT/test"
echo 'PASS: low-battery terminal path revokes charge, turns LED off, closes VBUS race and enters PA0/WKUP1-low Standby; HAL mocked'
