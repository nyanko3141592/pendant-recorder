#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
OUT=$(mktemp -d)
trap 'rm -rf "$OUT"' EXIT HUP INT TERM
cat > "$OUT/stm32u5xx_hal.h" <<'HEADER'
#include <stdint.h>
#include <stdbool.h>
typedef int HAL_StatusTypeDef;
typedef struct {void *Instance;unsigned State;} MDF_HandleTypeDef;
typedef struct {int unused;} MDF_FilterConfigTypeDef;
typedef struct {unsigned Pin,Mode,Pull,Speed;} GPIO_InitTypeDef;
#define HAL_OK 0
#define HAL_MDF_STATE_READY 1
#define ADF1_Filter0 ((void *)1)
#define GPIOB ((void *)2)
#define GPIO_PIN_3 8
#define GPIO_PIN_4 16
#define GPIO_PIN_RESET 0
#define GPIO_MODE_OUTPUT_PP 1
#define GPIO_MODE_ANALOG 2
#define GPIO_NOPULL 0
#define GPIO_SPEED_FREQ_LOW 0
unsigned __get_IPSR(void);
unsigned __get_PRIMASK(void);
HAL_StatusTypeDef HAL_MDF_DeInit(MDF_HandleTypeDef *);
void HAL_GPIO_WritePin(void *,unsigned,unsigned);
void HAL_GPIO_Init(void *,GPIO_InitTypeDef *);
void test_gpio_clock(void);
void test_adf_clock_off(void);
#define __HAL_RCC_GPIOB_CLK_ENABLE() test_gpio_clock()
#define __HAL_RCC_ADF1_CLK_DISABLE() test_adf_clock_off()
HEADER
cc -std=c11 -Wall -Wextra -Werror -fsanitize=address,undefined -I "$OUT" "$ROOT/board/audio_shutdown.c" "$ROOT/tests/test_audio_shutdown.c" -o "$OUT/test"
"$OUT/test"
echo 'PASS: terminal microphone shutdown gating, pin ordering and HAL failure; mocked electrical behavior'
