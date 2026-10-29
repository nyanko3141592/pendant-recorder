#!/usr/bin/env python3
"""Create the immutable local return point before the EVT cost-down branch."""
from pathlib import Path
import hashlib
import json
import shutil

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
OUT = HERE / "snapshots/HW-V1.0-2026-10-28"
FILES = [
    "pendant-xe-minimal.kicad_pcb",
    "pendant-xe-minimal.kicad_sch",
    "pendant-xe-minimal.kicad_pro",
    "pendant-xe-minimal.kicad_dru",
    "Pendant.kicad_sym",
    "bom.csv",
    "connections.csv",
    "design.json",
    "active-design.json",
    "prototype-architecture-v1.json",
    "exact-via-pad-overlap-audit.json",
    "current-drc.json",
    "current-erc.json",
]

OUT.mkdir(parents=True, exist_ok=True)
manifest = {
    "version": "HW-V1.0",
    "date": "2026-10-28",
    "purpose": "Return point before HW-V1.1-EVT-COSTDOWN four-layer/ordinary-via exploration",
    "canonical_status": "FROZEN_LOCAL_SNAPSHOT_NOT_ORDER_AUTHORIZATION",
    "files": {},
}
for rel in FILES:
    src = HERE / rel
    dst = OUT / rel
    shutil.copy2(src, dst)
    manifest["files"][rel] = hashlib.sha256(dst.read_bytes()).hexdigest()
(OUT / "snapshot-manifest.json").write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + "\n")
print(OUT)
