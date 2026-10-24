#pragma once
#include <stdint.h>
#include <stddef.h>
// 録音: PDMマイク -> PCM
bool audio_begin();
size_t audio_read(int16_t* buf, size_t samples);
// VAD
bool vad_is_voice(const int16_t* buf, size_t samples);
// WAV -> SD
bool wav_begin();
bool wav_open_new();          // YYYYMMDD_HHMMSS.wav
bool wav_write(const int16_t* buf, size_t samples);
void wav_close();             // RIFFヘッダのサイズを確定
// USB MSC
bool usb_vbus_present();
void usb_msc_enter();         // SDをMacに公開（録音停止後）
void usb_msc_exit();
// 電池
float battery_voltage();
// 時刻
void clock_load_from_sd();    // TIME.TXT
void clock_now_str(char* out, size_t n);
