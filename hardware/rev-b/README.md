# Rev B — Bluetooth対応MCUを使う有線v1の設計開始

**設計入力のみ。回路図・PCB・BOMはまだない。発注不可。**

ユーザー許可によりSTM32案からBluetooth対応MCUへ変更する。[最新決定](../../docs/decisions/0004-hardware-first-v1.md)が設計条件。nRF52840を第一候補に、PDM録音→標準圧縮→標準暗号化→SPI接続SD、USB MSCでPCへの音声取出しを設計する。

Rev AのSTM32端子割当・SDMMC・LDO等をそのまま転記しない。具体MCU品番、JLC調達、電源/クロック、必要端子、SPI速度とSD busy、デバッグ接点、マイク電圧、RAM/暗号バッファ、電池持ちを照合して回路を起こす。アンテナ内蔵Bluetoothモジュールをv1から業者実装する。ソフトv1は無線を停止してUSB同期、ソフトv2でBluetooth同期を目指す。詳細は[アンテナ決定](../../docs/decisions/0005-integrated-antenna.md)。後付けアンテナや手はんだを必要としない構成にする。

電池24h超、圧縮音声36h以上、厚さ15mm以下、電池/治具を含む手はんだゼロが合否条件。ここにファイルを追加しただけでこれらが成立したとは扱わない。
