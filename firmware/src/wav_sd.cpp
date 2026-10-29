// HISTORICAL / NON-PRODUCTION: initial XIAO ESP32S3 evaluation stub.
// The current product firmware authority is firmware/stm32/.
#include "modules.h"
#include "config.h"
// TODO: SD + FAT32、PSRAMにためてまとめ書き、5分で分割、RIFFヘッダ更新
bool wav_begin() { return false; }
bool wav_open_new() { return false; }
bool wav_write(const int16_t*, size_t) { return false; }
void wav_close() {}
void clock_load_from_sd() {}  // TODO: TIME.TXT を読み RTC を設定
void clock_now_str(char* out, size_t n) { if (n) out[0] = 0; }
