// HISTORICAL / NON-PRODUCTION: initial XIAO ESP32S3 evaluation stub.
// The current product firmware authority is firmware/stm32/.
#include "modules.h"
// TODO: ESP_I2S (PDM RX) で実装
bool audio_begin() { return false; }
size_t audio_read(int16_t* buf, size_t samples) { (void)buf; return samples; }
