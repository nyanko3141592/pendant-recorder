#!/bin/bash
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
SDK=${PENDANT_STM32_SDK:-/tmp/pendant-stm32-sdk}
OUT=${PENDANT_U585_LINK_BUILD:-${PENDANT_LINK_BUILD:-/tmp/pendant-u585-linkcheck}}
mkdir -p "$OUT"
rm -f "$OUT"/*.o
TUSB="$ROOT/vendor/tinyusb/src"
DWC2="$TUSB/portable/synopsys/dwc2"
ENTRY=${PENDANT_MAIN_SOURCE:-$ROOT/linkcheck/main.c}
CONFIG=${PENDANT_CONFIG_HEADER:-/dev/null}
USB_FLAGS=(-DPENDANT_USB_VID=0x1234 -DPENDANT_USB_PID=0x5678)
GUARD_FLAGS=(-DPENDANT_LINK_FIXTURE=1)
if [ "${PENDANT_CONFIGURED_APPLICATION:-0}" = 1 ]; then
 USB_FLAGS=(-DPENDANT_CONFIGURED_APPLICATION=1)
 GUARD_FLAGS=(-DPENDANT_COOPERATIVE_SAVE=1 -DWAV_CHUNK_SAMPLES=160000U -include "$ROOT/app/build_requirements.h")
fi
GC_COMPILE=
GC_LINK=
if [ "${PENDANT_GC_SECTIONS:-0}" = 1 ]; then
 GC_COMPILE="-ffunction-sections -fdata-sections"
 GC_LINK="-Wl,--gc-sections"
fi
SOURCES=(
 "$ROOT"/usb/*.c
 "$TUSB/tusb.c" "$TUSB/common/tusb_fifo.c" "$TUSB/device/usbd.c"
 "$TUSB/class/msc/msc_device.c"
 "$TUSB/class/hid/hid_device.c"
 "$DWC2/dcd_dwc2.c" "$DWC2/dwc2_common.c"
 "$ROOT"/board/*.c "$ROOT"/core/*.c "$ROOT"/crypto/*.c
 "$ROOT"/vendor/agec/*.c "$ROOT"/vendor/agec/crypto/*.c
 "$ROOT/vendor/fatfs/ff.c" "$ROOT/vendor/fatfs/ffunicode.c" "$ENTRY"
 "$SDK/device/Source/Templates/system_stm32u5xx.c"
 "$SDK/device/Source/Templates/gcc/startup_stm32u585xx.s"
 "$SDK"/hal/Src/stm32u5xx_hal.c
 "$SDK"/hal/Src/stm32u5xx_hal_{adc,adc_ex,cortex,gpio,rcc,rcc_ex,pwr,pwr_ex,flash,flash_ex,icache,dma,dma_ex,mdf,rng,spi,spi_ex}.c
)
for SRC in "${SOURCES[@]}"; do
 NAME=$(basename "$(dirname "$SRC")")-$(basename "$SRC").o
 arm-none-eabi-gcc -MD -MF "$OUT/$NAME.d" $GC_COMPILE -include "$CONFIG" "${GUARD_FLAGS[@]}" \
  -mcpu=cortex-m33 -mthumb -mfloat-abi=soft -DSTM32U585xx -DUSE_HAL_DRIVER "${USB_FLAGS[@]}" \
  -std=gnu11 -Os -fstack-usage -I "$ROOT/usb" -I "$TUSB" -I "$ROOT/board" -I "$ROOT/core" \
  -I "$ROOT/vendor/fatfs" -I "$SDK/hal/Inc" -I "$SDK/device/Include" \
  -I "$SDK/cmsis/CMSIS/Core/Include" -iquote "$ROOT/vendor/agec" -c "$SRC" -o "$OUT/$NAME"
done
arm-none-eabi-gcc $GC_LINK -mcpu=cortex-m33 -mthumb -nostartfiles --specs=nosys.specs \
 -T "$ROOT/linkcheck/STM32U585CI.ld" -Wl,-Map,"$OUT/candidate.map" "$OUT"/*.o \
 -o "$OUT/candidate-NOT-FOR-FLASH.elf"
arm-none-eabi-size -A "$OUT/candidate-NOT-FOR-FLASH.elf"
