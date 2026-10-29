#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
OUT=$(mktemp -d)
trap 'rm -rf "$OUT"' EXIT HUP INT TERM
cat > "$OUT/stm32u5xx_hal.h" <<'HEADER'
#include <stdint.h>
#include <stdbool.h>
typedef int HAL_StatusTypeDef;
#define HAL_OK 0
#define HAL_ERROR 1
#define GPIOB ((void *)1)
#define GPIO_PIN_5 (1u << 5)
#define GPIO_PIN_RESET 0
#define GPIO_PIN_SET 1
#define GPIO_MODE_OUTPUT_PP 1
#define GPIO_PULLDOWN 2
#define GPIO_SPEED_FREQ_LOW 3
typedef struct {unsigned Pin,Mode,Pull,Speed;} GPIO_InitTypeDef;
unsigned __get_IPSR(void);
unsigned __get_PRIMASK(void);
void test_clock(void);
#define __HAL_RCC_GPIOB_CLK_ENABLE() test_clock()
void HAL_GPIO_WritePin(void *,unsigned,unsigned);
void HAL_GPIO_Init(void *,GPIO_InitTypeDef *);
void HAL_Delay(uint32_t);
HEADER
cc -std=c11 -Wall -Wextra -Werror -fsanitize=address,undefined -I "$OUT" "$ROOT/board/storage_power.c" "$ROOT/tests/test_storage_power.c" -o "$OUT/test"
for CASE in 0 1 2 3; do "$OUT/test" "$CASE"; done
echo 'PASS: normal storage sequencing plus irreversible emergency SD_EN-low cutoff despite SPI release failure (mock HAL)'
