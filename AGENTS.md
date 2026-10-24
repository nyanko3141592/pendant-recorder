# AGENTS.md — pendant-recorder

## ゴール
Omi（BasedHardware/omi）のペンダントを**できるだけ真似て**、ただし BLE送信・アプリ・クラウドを外し、
「本体のmicroSDに1日録音 → 帰宅後USB-CでMacにつなぐと充電＋USBドライブ（MSC）で吸い出し → Macでローカル文字起こし（kotoba-whisper/mlx-whisper）→ 要約してNotion」にする。

## 要件（2026-10-24 Naoki確定, docs/requirements.md）
1. 有線通信のみ（BLE/Wi-Fiは一切なし）
2. USB-C 1本で充電＋同期（USB MSC）
3. 1日使える（16時間録音）
4. できるだけコンパクト（ペンダント）。カスタム基板OK

## 制約
- アプリ・クラウド・サブスクなし
- 目標 直径≦26mm・厚さ≦12mm・重さ≦12g
- 日本語の音質（16kHzモノラル以上）
- MSC中はファームがSDに触らない（FS破壊防止）

## 決定事項
- 本番は **カスタム基板: STM32U535CBU6 + T5838 + SD NAND 4GB(CSNP32GCR01, SDMMC 4bit) + BQ25101 + MAX17048 + LDO 3.0V + LiPo 100mAh級**。理由は docs/custom-pcb.md
- 第2候補は nRF52840 カスタム基板（Omiコード流用）。実測で差が小さければ切替
- XIAO nRF52840 Sense（Omi DK2クローン）と ESP32S3（`firmware/`）は動作確認用
- 保存はFAT/exFATの通常ファイル（Omi Consumerの生セクタ形式は使わない）。本命は IMA-ADPCM WAV、PCM WAV切替可
- 時刻はUSB接続時にMacが `TIME.TXT` を書く方式

## 情報の場所
- docs/omi-reference.md — Omiの全調査（部品・ファイルパス・ファーム・出典URL）
- docs/requirements.md — 確定要件と導出仕様
- docs/custom-pcb.md — カスタム基板の比較・電力見積り・ブロック図・段階計画（最新の推奨）
- docs/design.md — 初期設計（§10はOmi-clone比較。custom-pcb.mdが優先）
- docs/bom.md / docs/open-questions.md
- reference/omi/ — Omiの参照ファイル（MIT、改変なし、ビルド対象外）
- firmware/ — ESP32S3用スタブ、host/ — Mac側スクリプトのスタブ

## 次の作業（docs/custom-pcb.md §7）
1. ST NUCLEO（U545等）＋T5838＋SD NAND/microSDで ADF→ADPCM→SDMMC→FAT の最小ファーム
2. VBUS検知で録音停止→USB MSC、`TIME.TXT`でRTC設定
3. PPK2で平均電流を実測（XIAO nRF52840 試作とも比較）→ MCUと電池容量を確定
4. 1次カスタム基板（30mm角、テストパッド多め）→ 円形22mm基板＋筐体
5. host/ のマウント検知→コピー→文字起こしを仕上げる

## 注意
- 推定値・未確認値はそう書く。出典URLを残す
- データ（録音）を消す処理は初期値オフ（ユーザー方針：戻せない削除はしない）
