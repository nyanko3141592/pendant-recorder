#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
OUT=$(mktemp -d)
trap 'rm -rf "$OUT"' EXIT HUP INT TERM
cat > "$OUT/stm32u5xx_hal.h" <<'HEADER'
#ifndef TEST_HAL_H
#define TEST_HAL_H
#include <stdint.h>
typedef int HAL_StatusTypeDef;
typedef struct { int State; } MDF_HandleTypeDef;
typedef struct { int unused; } MDF_FilterConfigTypeDef;
#define HAL_MDF_STATE_READY 1
#define HAL_MDF_STATE_ACQUISITION 2
#define HAL_OK 0
#define HAL_ERROR 1
#define LPDMA1_Channel0_IRQn 0
unsigned __get_IPSR(void);
unsigned __get_PRIMASK(void);
uint32_t HAL_GetTick(void);
void __WFI(void);
void HAL_NVIC_DisableIRQ(int irq);
void HAL_NVIC_ClearPendingIRQ(int irq);
#endif
HEADER
cc -DPENDANT_AUDIO_CALLBACK_HOST_TEST -std=c11 -Wall -Wextra -Werror -fsanitize=address,undefined -I "$OUT" "$ROOT/board/audio_callbacks.c" "$ROOT/core/audio_queue.c" "$ROOT/tests/test_audio_callbacks.c" -o "$OUT/test"
"$OUT/test"
cc -DPENDANT_AUDIO_CALLBACK_HOST_TEST -std=c11 -Wall -Wextra -Werror -fsanitize=address,undefined -I "$OUT" "$ROOT/board/audio_callbacks.c" "$ROOT/board/audio_stop.c" "$ROOT/core/audio_queue.c" "$ROOT/tests/test_audio_stop.c" -o "$OUT/stop"
"$OUT/stop"
cc -DPENDANT_AUDIO_CALLBACK_HOST_TEST -std=c11 -Wall -Wextra -Werror -fsanitize=address,undefined -I "$OUT" -I "$ROOT/vendor/fatfs" "$ROOT/board/audio_callbacks.c" "$ROOT/board/recording_capture.c" "$ROOT/core/audio_queue.c" "$ROOT/core/storage_owner.c" "$ROOT/tests/test_recording_capture.c" -o "$OUT/capture"
"$OUT/capture"
echo 'PASS: audio callback order/boundary/overflow and stop coordinator success/timeout/HAL failure/ISR rejection/tick wrap (mock HAL)'
