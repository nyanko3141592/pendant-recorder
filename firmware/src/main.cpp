// HISTORICAL / NON-PRODUCTION: initial XIAO ESP32S3 evaluation stub.
// The current product firmware authority is firmware/stm32/.
#include <Arduino.h>
#include "config.h"
#include "modules.h"

static int16_t buf[1024];
static bool inMsc = false;

void setup() {
  Serial.begin(115200);
  setCpuFrequencyMhz(80);  // TODO: 電力を実測して調整
  wav_begin();
  clock_load_from_sd();
  audio_begin();
}

void loop() {
  // TODO: Legacy stub, not the current product behavior. VBUS alone must
  // preserve recording state (charge-only). Enter MSC only on explicit sync
  // request, after DMA stop, file sync and FAT unmount. See requirements.md.
  if (usb_vbus_present()) {
    if (!inMsc) { wav_close(); usb_msc_enter(); inMsc = true; }
    delay(200);
    return;
  }
  if (inMsc) { usb_msc_exit(); inMsc = false; }

  size_t n = audio_read(buf, 1024);
  // Product requirement: preserve continuous audio, including silence.
  // Never use VAD to suppress samples or extend the apparent runtime.
  if (n) wav_write(buf, n);
  // TODO: 電池残量低下時はファイルを確定して安全停止する。
}
