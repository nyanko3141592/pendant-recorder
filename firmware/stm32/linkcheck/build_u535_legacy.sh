#!/bin/bash
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
SDK=${PENDANT_STM32_SDK:-/tmp/pendant-stm32-sdk}
OUT=${PENDANT_LINK_BUILD:-/tmp/pendant-linkcheck}
mkdir -p "$OUT"
rm -f "$OUT"/*.o
# Separate output; never overwrite order/model artifacts. No garbage collection:
# keep all candidate recording/crypto functions in the capacity estimate.
# Synthetic VID/PID only for this non-flashable link fixture; not allocated IDs.
TUSB="$ROOT/vendor/tinyusb/src"
ENTRY=${PENDANT_MAIN_SOURCE:-$ROOT/linkcheck/main.c}
CONFIG=${PENDANT_CONFIG_HEADER:-/dev/null}
USB_FLAGS=(-DPENDANT_USB_VID=0x1234 -DPENDANT_USB_PID=0x5678)
GUARD_FLAGS=(-DPENDANT_LINK_FIXTURE=1)
if [ "${PENDANT_CONFIGURED_APPLICATION:-0}" = 1 ]; then
 USB_FLAGS=(-DPENDANT_CONFIGURED_APPLICATION=1)
 GUARD_FLAGS=(-include "$ROOT/app/build_requirements.h")
fi
# Application builds may discard unreachable code; full-module fixture stays unpruned.
GC_COMPILE=
GC_LINK=
if [ "${PENDANT_GC_SECTIONS:-0}" = 1 ]; then
 GC_COMPILE="-ffunction-sections -fdata-sections"
 GC_LINK="-Wl,--gc-sections"
fi
for SRC in "$ROOT"/usb/*.c "$TUSB/tusb.c" "$TUSB/common/tusb_fifo.c" "$TUSB/device/usbd.c" "$TUSB/class/msc/msc_device.c" "$TUSB/portable/st/stm32_fsdev/dcd_stm32_fsdev.c" "$TUSB/portable/st/stm32_fsdev/fsdev_common.c" "$ROOT"/board/*.c "$ROOT"/core/*.c "$ROOT"/crypto/*.c "$ROOT"/vendor/agec/*.c "$ROOT"/vendor/agec/crypto/*.c "$ROOT"/vendor/fatfs/ff.c "$ROOT"/vendor/fatfs/ffunicode.c "$ENTRY" "$SDK"/device/Source/Templates/system_stm32u5xx.c "$SDK"/device/Source/Templates/gcc/startup_stm32u535xx.s "$SDK"/hal/Src/stm32u5xx_hal.c "$SDK"/hal/Src/stm32u5xx_hal_{adc,adc_ex,cortex,gpio,rcc,rcc_ex,pwr,pwr_ex,flash,flash_ex,icache,dma,dma_ex,mdf,rng,spi,spi_ex}.c; do
 NAME=$(basename "$(dirname "$SRC")")-$(basename "$SRC").o
 arm-none-eabi-gcc -MD -MF "$OUT/$NAME.d" $GC_COMPILE -include "$CONFIG" "${GUARD_FLAGS[@]}" -mcpu=cortex-m33 -mthumb -mfloat-abi=soft -DSTM32U535xx -DUSE_HAL_DRIVER "${USB_FLAGS[@]}" -std=gnu11 -Os -fstack-usage -I "$ROOT/usb" -I "$TUSB" -I "$ROOT/board" -I "$ROOT/core" -I "$ROOT/vendor/fatfs" -I "$SDK/hal/Inc" -I "$SDK/device/Include" -I "$SDK/cmsis/CMSIS/Core/Include" -iquote "$ROOT/vendor/agec" -c "$SRC" -o "$OUT/$NAME"
done
arm-none-eabi-gcc $GC_LINK -mcpu=cortex-m33 -mthumb -nostartfiles --specs=nosys.specs -T "$ROOT/linkcheck/STM32U535CE.ld" -Wl,-Map,"$OUT/candidate.map" "$OUT"/*.o -o "$OUT/candidate-NOT-FOR-FLASH.elf"
arm-none-eabi-size -A "$OUT/candidate-NOT-FOR-FLASH.elf"
