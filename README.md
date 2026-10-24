# pendant-recorder

ペンダント型で2日間充電せず録音することを目指す、自作の音声ライフログ録音機です（連続48時間は未達成の設計目標）。

- Bluetooth・アプリ・クラウド・サブスクは使いません
- USB-Cを挿すとまず充電のみ。録音状態を維持します。Mac接続中に同期を選ぶと録音を止め、充電しながらUSBドライブからファイルをコピーできます（設計仕様、ファーム未実装）
- 文字起こしはMac上で行います（kotoba-whisper / mlx-whisper）。要約してNotionに保存する部分はまだスケッチ段階です

## 回路と筐体（2026-10-24）

[48時間録音に向けた電池・サイズ比較](docs/two-day-runtime.md): 本命25.5×15mm・150mAhと、比較28×15mm・210mAh。

**v1は個人製作と基板密度を優先**。小ロットの基板実装を外注して自分で組み立てる方針です。外観4案は保留し、Omi相当の直径約25.5mm・厚さ約15mmを目指すシンプルなケースにします（サイズ成立は未検証、30mm角基板は電気検証用）。[v1の製作方針と未確定事項](docs/v1-build.md)。

- [Rev A0 回路設計](hardware/rev-a/README.md): Omiの実回路を参照したKiCad回路図、92部品のBOM、全端子接続表。製造前のドラフトです。
- [SolidCraft寸法検討](mechanical/README.md): 26×12mmの編集可能モデルとSTEP。基板・電池のダミーを含みます。
- 公開リポジトリ: https://github.com/nyanko3141592/pendant-recorder

## 構成
- `docs/design.md` 設計書（構成、ボード比較、電力の見積もり、音声フォーマット、時刻、USB、省電力、ケース）
- `docs/bom.md` 部品表（価格は概算・要確認）
- `docs/open-questions.md` 未決事項
- `docs/omi-reference.md` Omiのハード／ファーム調査（出典つき）
- `reference/omi/` Omiの参照ファイル（MIT）
- `AGENTS.md` Cursorエージェント向けの要約
- `firmware/` PlatformIO の骨組み（XIAO ESP32S3 Sense 向け、スタブ）
- `host/` Mac側スクリプトのスタブ（マウント検出、コピー、ローカル文字起こし）

- 電池残量・充電・録音・同期・異常を本体で確認できるインジケーターは必須。回路追加済み、表示ファームと筐体への反映は未実装。

## 状態
設計のたたき台です。数値のうち「推定」「要検証」と書いたものは、まだ実測していません。
