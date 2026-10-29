#pragma once
// HISTORICAL / NON-PRODUCTION: initial XIAO ESP32S3 evaluation stub.
// The current product firmware authority is firmware/stm32/.
// TODO: XIAO ESP32S3 Sense のピンを回路図で確認
#define SAMPLE_RATE      16000
#define BITS_PER_SAMPLE  16
#define SEGMENT_SECONDS  300      // 5分ごとにファイル分割
#define PDM_CLK_PIN      42       // TODO: 要確認
#define PDM_DATA_PIN     41       // TODO: 要確認
#define SD_CS_PIN        21       // TODO: 要確認
#define VBAT_ADC_PIN     -1       // TODO: 分圧回路を決める
#define VBUS_SENSE_PIN   -1       // TODO: VBUS検知方法を決める
