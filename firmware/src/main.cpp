#include <Arduino.h>
#include "config.h"
#include "modules.h"

static int16_t buf[1024];
static bool inMsc = false;
static uint32_t lastVoiceMs = 0;

void setup() {
  Serial.begin(115200);
  setCpuFrequencyMhz(80);  // TODO: 電力を実測して調整
  wav_begin();
  clock_load_from_sd();
  audio_begin();
}

void loop() {
  if (usb_vbus_present()) {
    if (!inMsc) { wav_close(); usb_msc_enter(); inMsc = true; }
    delay(200);
    return;
  }
  if (inMsc) { usb_msc_exit(); inMsc = false; }

  size_t n = audio_read(buf, 1024);
  if (vad_is_voice(buf, n)) lastVoiceMs = millis();
  if (millis() - lastVoiceMs < VAD_HANGOVER_MS) {
    wav_write(buf, n);  // TODO: プリロール用リングバッファ
  }
  // TODO: 電池残量の低下でファイルを閉じて deep sleep
}
