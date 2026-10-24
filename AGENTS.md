# AGENTS.md — pendant-recorder

## ゴール
Omi（BasedHardware/omi）のペンダントを**できるだけ真似て**、ただし BLE送信・アプリ・クラウドを外し、
「本体のmicroSDに1日録音 → 帰宅後USB-CでMacにつなぐと充電＋USBドライブ（MSC）で吸い出し → Macでローカル文字起こし（kotoba-whisper/mlx-whisper）→ 要約してNotion」にする。

## 制約
- Bluetooth・Wi-Fi・アプリ・クラウド・サブスクなし。同期は有線のみ
- ペンダント型、16時間以上の録音、軽量（目標30g以下）
- 日本語の音質（16kHzモノラル以上）
- MSC中はファームがSDに触らない（FS破壊防止）

## 決定事項
- 本命は **Bパス = Omi DevKit2クローン**（XIAO nRF52840 Sense + SPI microSD + Zephyr/nRF Connect SDK）。理由は docs/design.md §10
- ESP32S3（`firmware/`, PlatformIO）は動作確認用のサブ
- 保存はFAT/exFATの通常ファイル（Omi Consumerの生セクタ形式は使わない）。初期はWAV、後でOpus検討
- 時刻はUSB接続時にMacが `TIME.TXT` を書く方式

## 情報の場所
- docs/omi-reference.md — Omiの全調査（部品・ファイルパス・ファーム・出典URL）
- docs/design.md — 設計（§10がOmi-clone比較と推奨）
- docs/bom.md / docs/open-questions.md
- reference/omi/ — Omiの参照ファイル（MIT、改変なし、ビルド対象外）
- firmware/ — ESP32S3用スタブ、host/ — Mac側スクリプトのスタブ

## 次の作業
1. `firmware-zephyr/` を作り、Omi `firmware/devkit` の DK2 overlay/conf（reference/omi/firmware/devkit/）を元に、BLE・Opus送信・OTAを除いた最小アプリ（PDM→WAV→SD）
2. Zephyr USB MSCでSDを公開、VBUS検知で録音⇔MSCを切り替え
3. PPK2等で平均電流を実測 → 電池容量決定
4. Omi DK2のSTLを改造してUSB-C口付きケース
5. host/ のマウント検知→コピー→文字起こしを仕上げる

## 注意
- 推定値・未確認値はそう書く。出典URLを残す
- データ（録音）を消す処理は初期値オフ（ユーザー方針：戻せない削除はしない）
