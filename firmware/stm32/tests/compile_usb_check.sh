#!/bin/sh
# Synthetic VID/PID for compile-only objects, never linked/flashed.
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
SDK=${PENDANT_STM32_SDK:-/tmp/pendant-stm32-sdk}
OUT=$(mktemp -d)
trap 'rm -rf "$OUT"' EXIT HUP INT TERM
TUSB="$ROOT/vendor/tinyusb/src"
for SRC in "$ROOT/usb/usb_session.c" "$ROOT/usb/usb_descriptors.c" "$ROOT/usb/msc_storage.c" "$TUSB/tusb.c" "$TUSB/common/tusb_fifo.c" "$TUSB/device/usbd.c" "$TUSB/class/msc/msc_device.c" "$TUSB/portable/synopsys/dwc2/dcd_dwc2.c" "$TUSB/portable/synopsys/dwc2/dwc2_common.c"; do
 arm-none-eabi-gcc -mcpu=cortex-m33 -mthumb -mfloat-abi=soft -DSTM32U585xx -DPENDANT_USB_VID=0x1234 -DPENDANT_USB_PID=0x5678 -std=gnu11 -Os -I "$ROOT/usb" -I "$TUSB" -I "$SDK/device/Include" -I "$SDK/cmsis/CMSIS/Core/Include" -c "$SRC" -o "$OUT/$(basename "$SRC").o"
done
echo 'PASS: TinyUSB device/MSC/STM32U585 DWC2 compilation only; MSC callbacks compiled; descriptors use synthetic IDs; no hardware USB runtime yet'
