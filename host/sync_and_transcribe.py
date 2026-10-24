#!/usr/bin/env python3
"""ペンダント録音機のSDを検知してコピーし、ローカルで文字起こしする（スタブ）。"""
import argparse, hashlib, shutil, time
from datetime import datetime
from pathlib import Path

VOLUME = Path("/Volumes/PENDANT")
DEST = Path.home() / "Lifelog"

def sha1(p):
    h = hashlib.sha1()
    with open(p, "rb") as f:
        for c in iter(lambda: f.read(1 << 20), b""): h.update(c)
    return h.hexdigest()

def copy_new():
    out = []
    for src in sorted(VOLUME.glob("*.wav")):
        dst = DEST / "raw" / src.name[:8] / src.name
        if dst.exists() and dst.stat().st_size == src.stat().st_size: continue
        dst.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(src, dst)
        assert sha1(src) == sha1(dst), f"hash mismatch: {src}"
        out.append(dst)
    return out  # SD側は消さない

def write_time():
    (VOLUME / "TIME.TXT").write_text(datetime.now().strftime("%Y-%m-%dT%H:%M:%S\n"))

def transcribe(files, model):
    try:
        import mlx_whisper
    except ImportError:
        print("mlx-whisper未インストール"); return
    for f in files:
        r = mlx_whisper.transcribe(str(f), path_or_hf_repo=model, language="ja")
        f.with_suffix(".txt").write_text(r["text"])
    # TODO: 日ごとに要約してNotionへ

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--once", action="store_true")
    ap.add_argument("--model", default="mlx-community/whisper-large-v3-turbo")  # TODO: kotoba-whisper MLX版
    a = ap.parse_args()
    while True:
        if VOLUME.exists():
            files = copy_new(); write_time(); print(f"copied {len(files)}")
            transcribe(files, a.model)
            if a.once: return
            while VOLUME.exists(): time.sleep(5)
        elif a.once:
            print("not mounted"); return
        time.sleep(5)

if __name__ == "__main__":
    main()
