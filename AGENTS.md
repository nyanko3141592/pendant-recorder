# AGENTS.md — pendant-recorder

## 製品方針・v1の定義（最新）
完成デバイス販売を主軸にし、回路・筐体・ファーム・Mac同期アプリを公開する。独自成果物はMIT、第三者ライセンスは保持。アプリ課金/API代理販売は当面範囲外、寄付は任意・未設定。v1は業者実装基板の発注→コード実装→実機試験→改版の最初のサイクルで、販売完成版ではない。完成治具と付属電池で、手はんだ・リード加工・圧着なしに組立/書込み/測定できることを発注条件とする。docs/decisions/0001-product-and-v1.md、docs/development-flow.md、docs/validation/TEMPLATE.mdを参照し、各版と結果を記録する。

## 最新追加要件: 紛失保護・初期外観設計
登録Macの秘密鍵がないと録音を復号できない保存時暗号化をv1要件に追加。公開鍵のみ本体に恒久保存、秘密鍵はMac Keychain、平文保存フォールバック禁止を第一案とする（未実装）。MSCは暗号化ファイル、復号後にWAV。docs/decisions/0002-encryption-and-industrial-design.md参照。外観後回しを撤回し、動作試作と装着用外観を初期から並行設計。v1は樹脂3Dプリント、将来金属外装を見据えて内部保持/絶縁と外装を分離検討する。

## 最新追加: OS非依存の相互運用
macOS/Windows/Linuxを対象とし、USB・暗号化形式・鍵移行・CLI契約を公開する。docs/protocol/README.md参照（Draft 0、未実装）。CLI/共通ライブラリを先行しGUIは任意。Mac Keychainに形式を依存させずOSごとの鍵保管を分離。Homebrew導入を候補にするが、公開済みパッケージではない。

## 公式v1ホストツールの最小範囲（最新）
macOS/Windows/Linuxで本体から同期し、登録鍵で復号して通常WAVをPCへ保存するところまでを必須とする。文字起こし・要約・Notion連携は必須範囲外の任意後段。syncは復号済みWAVと機械可読な保存先/結果を返す。暗号文をコピーしただけで完了としない。PCへの平文WAV保存はこの明示的な同期操作で許可、本体の平文保存禁止と自動削除禁止は維持。

## ゴール
Omi（BasedHardware/omi）のペンダントを**できるだけ真似て**、ただし BLE送信・アプリ・クラウドを外し、
「本体のmicroSDに1日録音 → 帰宅後USB-CでMacにつなぐと充電＋USBドライブ（MSC）で吸い出し → Macでローカル文字起こし（kotoba-whisper/mlx-whisper）→ 要約してNotion」にする。

## 要件（2026-10-24 Naoki確定, docs/requirements.md）
1. 有線通信のみ（BLE/Wi-Fiは一切なし）
2. USB-C 1本で充電のみ／充電＋同期（USB MSC）。接続直後は充電のみ、録音状態を維持。同期は明示操作時のみ
3. 連続24時間録音を設計目標とする。平均2.0mA以下を目指し、既製DTP401525(PHR) 110mAhを第一候補にする（docs/battery-sourcing.md）（docs/runtime-target.md）。未実測
4. できるだけコンパクト（ペンダント）。カスタム基板OK
5. 電池残量・充電・録音・同期・異常の本体インジケーター必須。暫定は残量3点＋録音1点＋状態1点。短押しで状態確認、表示操作で録音/SD所有権を変更しない

## 制約
- 完成厚さはOmi相当を上限（暫定15.0mm、突出部込み）。目標12〜13mm、未検証。旧24×38×15.2mm構造モデルは不採用。docs/density-study.md末尾参照。
- 手元での手はんだゼロを優先。USB-C・ボタン・LED・電池コネクタまで業者実装。電池は付属コネクタのまま接続。NTCも手はんだ不要な構成を検証し、省略しない。SWDはポゴ治具等。docs/jlcpcb-assembly.md参照
- 専用スマホアプリ・クラウド・サブスク依存なし。Mac同期アプリはOSSで開発し、ローカル文字起こし/要約を基本とする。Notion等の外部送信は任意・初期値オフ。
- v1は個人製作可能性と基板密度を優先。JLCPCB Standard PCBAで両面の部品実装まで依頼する方針（docs/jlcpcb-assembly.md、全品番の受理は未確認）＋自分で最終組立を設計前提にし、シンプルな3Dプリントケース。外観は初期から並行設計（決定0002が優先）
- 装着用v1はOmi相当の小ささを目指し、円形には限定しない。既製パックの調達・完成寸法を起点に密度を上げる。24×24×14mm/21×21mm基板への固定を解除。DTP401525の最大15.5×27×4.2mmを基準に20×32×12mmを攻める配置枠とするが、配線・PHコネクタを含め未検証（docs/battery-sourcing.md）。30mm角は電気検証用のみ。12gは軽量化目標、サイズ成立は未検証
- 日本語の音質（16kHzモノラル以上）
- MSC中はファームがSDに触らない（FS破壊防止）

## 決定事項
- **回路原本は hardware/rev-a/README.md / design.json / pendant-rev-a.kicad_sch**。試作MCUはSTM32U535RCT6（LQFP64）。旧CBU6（48ピン）にはSDMMC端子がない。T5838は底面音孔・1.8V専用＋TXS0104E、SD NAND 4GB（SDMMC 4bit）、BQ25101（約21.8mA、6.19kΩ）＋USB負荷分離、MAX17048、3.0V本体電源＋3.3V USB電源、保護付きLiPo 100mAh級。22mm版のMCUパッケージは未確定。Rev A1は20×34mmの未配線配置ドラフトで発注不可。hardware/rev-a/layout-review.md参照。
- 第2候補は nRF52840 カスタム基板（Omiコード流用）。実測で差が小さければ切替
- XIAO nRF52840 Sense（Omi DK2クローン）と ESP32S3（`firmware/`）は動作確認用
- 保存はFAT/exFAT上の暗号化コンテナ（Omi Consumerの生セクタ形式は使わない）。復号後はIMA-ADPCM WAV、PCM WAV切替可。暗号化方式/実装は未完了
- 時刻はUSB接続時にMacが `TIME.TXT` を書く方式

## 情報の場所
- docs/jlcpcb-assembly.md — JLCPCBで実装まで依頼する条件、公開例、未確認項目
- docs/battery-sourcing.md — 最新の既製パック優先・調達比較・寸法予算。以前の固定外形より優先
- docs/density-study.md — 最新の非円形・高密度配置方針。旧円形制約より優先
- docs/runtime-target.md — 最新の連続24時間目標。旧16時間・48時間の目標より優先
- docs/two-day-runtime.md — 旧48時間の電池・サイズ比較（履歴）
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
4. 部品調達・小ロット実装可否、全フットプリントを確定→既製電池パックの実寸を起点に高密度配置・配線→Omi相当サイズの簡易筐体。30mm角は電気検証用のみ
5. host/ のマウント検知→コピー→文字起こしを仕上げる

## 注意
- 推定値・未確認値はそう書く。出典URLを残す
- データ（録音）を消す処理は初期値オフ（ユーザー方針：戻せない削除はしない）

## 発注準備の最新進捗
J3は標準TC2030-NL/CTX結線（1 VTref,2 SWDIO,3 NRST,4 SWCLK,5 GND,6 NC）へ更新。docs/solderless-programming.md参照。ERC0、DRC19、未接続221で発注不可。sourcing-review.jsonに品番照合を記録。音声はdocs/protocol/audio-profile.mdのIMA-ADPCM 1024byte/2041samplesを候補にし、通常sync出力は有効サンプル長に切り戻したPCM16 WAV。ホスト合成音の形式試験のみ完了。
