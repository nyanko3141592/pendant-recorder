#!/usr/bin/env python3
"""Content-address the current firmware sources and local build tools without building or flashing."""
from pathlib import Path
import hashlib
import json
import shutil
import subprocess

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
REGRESSION = ROOT / "firmware/stm32/tests/prototype-v1-regression.json"
SDK_PROVENANCE = ROOT / "firmware/stm32/sdk-sources.json"

def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

regression = json.loads(REGRESSION.read_text())
sources = regression["source_sha256"]
for relative, expected in sources.items():
    path = ROOT / relative
    if not path.is_file() or sha(path) != expected:
        raise RuntimeError(f"stale regression source manifest: {relative}")
canonical = json.dumps(sources, sort_keys=True, separators=(",", ":")).encode()
tools = {}
for name in ("arm-none-eabi-gcc", "arm-none-eabi-objcopy", "arm-none-eabi-ld", "python3"):
    executable = Path(shutil.which(name)).resolve()
    tools[name] = {
        "path": str(executable),
        "sha256": sha(executable),
        "version": subprocess.check_output([name, "--version"], text=True).splitlines()[0],
    }
git_head = subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip()
dirty_count = len(subprocess.check_output(["git", "status", "--porcelain=v1"], cwd=ROOT, text=True).splitlines())
record = {
    "status": "PREBUILD_SOURCE_AND_TOOLCHAIN_CONTENT_LOCKED_NOT_FLASHABLE",
    "target_mpn": "STM32U585CIU6",
    "source_tree_sha256": hashlib.sha256(canonical).hexdigest(),
    "source_file_count": len(sources),
    "source_files_sha256": sources,
    "sdk_provenance": json.loads(SDK_PROVENANCE.read_text()),
    "sdk_provenance_sha256": sha(SDK_PROVENANCE),
    "tools": tools,
    "git_head_context_only": git_head,
    "git_worktree_dirty": dirty_count != 0,
    "git_dirty_entry_count": dirty_count,
    "limitations": [
        "The content digest, not git_head_context_only, identifies this uncommitted source tree.",
        "The eventual configured build manifest must hash compiler dependency files and output artifacts again.",
        "No production USB IDs, product image, hardware test, flash, upload or order is created here.",
    ],
    "orders_payments_uploads_vendor_contacts_performed": False,
}
OUT = HERE / "source-toolchain-lock.json"
OUT.write_text(json.dumps(record, ensure_ascii=False, indent=2) + "\n")
print(json.dumps({"status": record["status"], "sources": len(sources), "dirty": record["git_worktree_dirty"]}))
