"""Refresh hashes already declared by the canonical XE active-design manifest."""
from __future__ import annotations

import hashlib
import json
from pathlib import Path


HERE = Path(__file__).resolve().parent
PATH = HERE / "active-design.json"
manifest = json.loads(PATH.read_text())
for relative in manifest["sha256"]:
    source = (HERE / relative).resolve()
    if not source.exists():
        raise FileNotFoundError(relative)
    manifest["sha256"][relative] = hashlib.sha256(source.read_bytes()).hexdigest()
PATH.write_text(json.dumps(manifest, indent=2, ensure_ascii=False) + "\n")
print(f"refreshed {len(manifest['sha256'])} declared active-design hashes")
