#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
OUT=$(mktemp -d)
trap 'rm -rf "$OUT"' EXIT HUP INT TERM
cat > "$OUT/stm32u5xx_hal.h" <<'HEADER'
#include <stdint.h>
typedef int HAL_StatusTypeDef;
typedef struct {int State;} MDF_HandleTypeDef;
typedef struct {int unused;} MDF_FilterConfigTypeDef;
unsigned __get_IPSR(void);
unsigned __get_PRIMASK(void);
HEADER
cat > "$OUT/tusb.h" <<'HEADER'
#include <stdint.h>
#include <stdbool.h>
#define CFG_TUD_TASK_EVENTS_PER_RUN 1
#define TUSB_ROLE_DEVICE 1
#define TUSB_SPEED_FULL 1
typedef struct {int role,speed;} tusb_rhport_init_t;
bool tud_inited(void);
bool tud_mounted(void);
bool tud_suspended(void);bool tud_event_queue_overflowed(void);
bool tusb_rhport_init(uint8_t port,const tusb_rhport_init_t *cfg);
void tud_task_ext(uint32_t timeout,bool isr);
HEADER
FLAGS=
EXTRA=
if [ "${PENDANT_TEST_COOPERATIVE:-0}" = 1 ]; then
 FLAGS="-DPENDANT_COOPERATIVE_SAVE -DWAV_CHUNK_SAMPLES=160000U"
 EXTRA="$ROOT/core/cooperative_pipeline.c $ROOT/core/recording_pipeline.c $ROOT/core/audio_queue.c $ROOT/core/wav_chunk.c $ROOT/core/ima_adpcm.c"
fi
for CHARGING in 0 1; do
 cc $FLAGS $EXTRA -DPENDANT_FIXED_USB_LIMIT=1 -DPENDANT_EXPERIMENTAL_USB_CHARGING=$CHARGING -std=c11 -Wall -Wextra -Werror -fsanitize=address,undefined -I "$OUT" -I "$ROOT/vendor/fatfs" "$ROOT/board/recorder_runtime.c" "$ROOT/core/storage_owner.c" "$ROOT/usb/usb_session.c" "$ROOT/usb/usb_input_policy.c" "$ROOT/tests/usb_input_policy_runtime_stub.c" "$ROOT/tests/test_recorder_runtime.c" -o "$OUT/test-$CHARGING"
 "$OUT/test-$CHARGING"
done
echo 'PASS: runtime recording continues on unconfigured/power-only USB and fixed-100mA charging requests without enumeration; disconnect/eject/recovery and teardown failure covered'
