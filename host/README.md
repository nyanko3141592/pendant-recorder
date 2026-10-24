# Mac側スクリプト（スタブ）

> 最新: macOS・Windows・Linux向けに[相互運用仕様とCLI契約](../docs/protocol/README.md)を設計。CLIを先行、GUIは任意。仕様はDraft 0で未実装、既存Macスタブとは区別します。

> 最新追加: [保存時暗号化と初期外観設計](../docs/decisions/0002-encryption-and-industrial-design.md)を優先。登録PCの鍵で復号する暗号化保存をv1要件に追加（未実装）。従来の平文WAV直読・外観後回しの記述は旧仕様。樹脂3Dプリントから始め、金属外装への移行を考慮する。
`sync_and_transcribe.py`: `/Volumes/PENDANT` を検知 → `~/Lifelog/raw/` にコピー → SDに `TIME.TXT` を書く → mlx-whisperで文字起こし。

```
pip install mlx-whisper
python3 sync_and_transcribe.py --once
```
モデルは `--model` で指定（kotoba-whisperのMLX版など。名前は要確認）。
要約とNotionへの保存は未実装（TODO）。SD上のファイルは消しません。
