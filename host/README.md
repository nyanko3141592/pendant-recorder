# Mac側スクリプト（スタブ）
`sync_and_transcribe.py`: `/Volumes/PENDANT` を検知 → `~/Lifelog/raw/` にコピー → SDに `TIME.TXT` を書く → mlx-whisperで文字起こし。

```
pip install mlx-whisper
python3 sync_and_transcribe.py --once
```
モデルは `--model` で指定（kotoba-whisperのMLX版など。名前は要確認）。
要約とNotionへの保存は未実装（TODO）。SD上のファイルは消しません。
