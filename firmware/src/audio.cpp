#include "modules.h"
#include "config.h"
// TODO: ESP_I2S (PDM RX) で実装
bool audio_begin() { return false; }
size_t audio_read(int16_t* buf, size_t samples) { (void)buf; return samples; }
bool vad_is_voice(const int16_t* buf, size_t n) {
  // 簡易: 平均振幅で判定 TODO: ゼロ交差も使う
  long sum = 0; for (size_t i = 0; i < n; i++) sum += abs(buf[i]);
  return n && (sum / (long)n) > VAD_THRESHOLD;
}
