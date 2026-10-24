# AGENTS.md — pendant-recorder

## ゴール
Omi（BasedHardware/omi）のペンダントを**できるだけ真似て**、ただし BLE送信・アプリ・クラウドを外し、
「本体のmicroSDに1日録音 → 帰宅後USB-CでMacにつなぐと充電＋USBドライブ（MSC）で吸い出し → Macでローカル文字起こし（kotoba-whisper/mlx-whisper）→ 要約してNotion」にする。

## 要件（2026-10-24 Naoki確定, docs/requirements.md）
1. 有線通信のみ（BLE/Wi-Fiは一切なし）
2. USB-C 1本で充電のみ／充電＋同期（USB MSC）。接続直後は充電のみ、録音状態を維持。同期は明示操作時のみ
3. 2日充電不要。連続48時間録音を設計目標とする。150mAh/平均2.0mA以下を本命、210mAh/28mm径を比較（docs/two-day-runtime.md）。未実測
4. できるだけコンパクト（ペンダント）。カスタム基板OK
5. 電池残量・充電・録音・同期・異常の本体インジケーター必須。暫定は残量3点＋録音1点＋状態1点。短押しで状態確認、表示操作で録音/SD所有権を変更しない

## 制約
- アプリ・クラウド・サブスクなし
- v1は個人製作可能性と基板密度を優先。小ロットPCBA＋自分で最終組立を設計前提にし、シンプルな3Dプリントケース。外観4案は保留（docs/v1-build.md）
- 装着用v1はOmi相当の小ささを目指し、円形には限定しない。密度優先で24×24×14mm角丸ケース・21×21mm両面基板を第一の検討枠とする（docs/density-study.md）。30mm角は電気検証用のみ。12gは軽量化目標、サイズ成立は未検証
- 日本語の音質（16kHzモノラル以上）
- MSC中はファームがSDに触らない（FS破壊防止）

## 決定事項
- **回路原本は hardware/rev-a/README.md / design.json / pendant-rev-a.kicad_sch**。試作MCUはSTM32U535RCT6（LQFP64）。旧CBU6（48ピン）にはSDMMC端子がない。T5838は底面音孔・1.8V専用＋TXS0104E、SD NAND 4GB（SDMMC 4bit）、BQ25101（50mA）＋USB負荷分離、MAX17048、3.0V本体電源＋3.3V USB電源、保護付きLiPo 100mAh級。22mm版のMCUパッケージは未確定。Rev A0は回路ドラフトで発注不可。
- 第2候補は nRF52840 カスタム基板（Omiコード流用）。実測で差が小さければ切替
- XIAO nRF52840 Sense（Omi DK2クローン）と ESP32S3（`firmware/`）は動作確認用
- 保存はFAT/exFATの通常ファイル（Omi Consumerの生セクタ形式は使わない）。本命は IMA-ADPCM WAV、PCM WAV切替可
- 時刻はUSB接続時にMacが `TIME.TXT` を書く方式

## 情報の場所
- docs/density-study.md — 最新の非円形・高密度配置方針。旧円形制約より優先
- docs/two-day-runtime.md — 最新の48時間目標、電池・サイズ比較。旧16時間/100mAh見積りより優先
- docs/v1-build.md — 最新のv1範囲、実装難度、製作・小型化方針
- docs/omi-reference.md — Omiの全調査（部品・ファイルパス・ファーム・出典URL）
- docs/requirements.md — 確定要件と導出仕様
- hardware/rev-a/ — 最新回路ドラフト、接続表、BOM、訂正と発注前の未検証項目
- mechanical/ — SolidCraftの26×12mm寸法検討モデル（製造用ではない）
- docs/custom-pcb.md — カスタム基板の比較・電力見積り・ブロック図・段階計画（最新の推奨）
- docs/design.md — 初期設計（§10はOmi-clone比較。custom-pcb.mdが優先）
- docs/bom.md / docs/open-questions.md
- reference/omi/ — Omiの参照ファイル（MIT、改変なし、ビルド対象外）
- firmware/ — ESP32S3用スタブ、host/ — Mac側スクリプトのスタブ

## 次の作業（docs/custom-pcb.md §7）
1. ST NUCLEO（U545等）＋T5838＋SD NAND/microSDで ADF→ADPCM→SDMMC→FAT の最小ファーム
2. VBUS検知は充電のみ。同期要求時に録音停止→USB MSC、切断後`TIME.TXT`でRTC設定して同期前の録音状態へ戻す
3. PPK2で平均電流を実測（XIAO nRF52840 試作とも比較）→ MCUと電池容量を確定
4. 部品調達・小ロット実装可否、全フットプリントを確定→装着用21×21mm角丸枠を出発点に高密度配置・配線→Omi相当サイズの簡易筐体。30mm角は電気検証用のみ
5. host/ のマウント検知→コピー→文字起こしを仕上げる

## 注意
- 推定値・未確認値はそう書く。出典URLを残す
- データ（録音）を消す処理は初期値オフ（ユーザー方針：戻せない削除はしない）
