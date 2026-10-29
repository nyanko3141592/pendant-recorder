#!/usr/bin/env python3
"""Create a non-adopted four-layer routing baseline for cost-down work.

The first baseline deliberately preserves geometry and folds the two removed
inner layers onto the remaining inner layers.  DRC failures are expected and
quantify the rerouting work; this file must never be released as CAM.
"""
from pathlib import Path
import hashlib
import json
import shutil
import subprocess

import wx
import pcbnew as k

app = wx.App(False)
HERE = Path(__file__).resolve().parent
OUT = HERE / "costdown/HW-V1.1-EVT-COSTDOWN"
OUT.mkdir(parents=True, exist_ok=True)
source = HERE / "pendant-xe-minimal.kicad_pcb"
candidate = OUT / "hw-v1.1-evt-costdown-4layer-baseline.kicad_pcb"

b = k.LoadBoard(str(source))
mapping = {k.In3_Cu: k.In1_Cu, k.In4_Cu: k.In2_Cu}
for item in b.GetTracks():
    if item.GetLayer() in mapping:
        item.SetLayer(mapping[item.GetLayer()])
for zone in list(b.Zones()):
    if zone.GetLayer() == k.In3_Cu:
        b.RemoveNative(zone)
    elif zone.GetLayer() == k.In4_Cu:
        zone.SetLayer(k.In2_Cu)
b.SetCopperLayerCount(4)
k.SaveBoard(str(candidate), b)

for suffix in (".kicad_pro", ".kicad_dru"):
    shutil.copy2(HERE / ("pendant-xe-minimal" + suffix), candidate.with_suffix(suffix))

drc_path = OUT / "four-layer-baseline-drc.json"
cli = "/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli"
subprocess.run([cli, "pcb", "drc", "--format", "json", "--output", str(drc_path), str(candidate)], check=False)
drc = json.loads(drc_path.read_text())
report = {
    "version": "HW-V1.1-EVT-COSTDOWN",
    "status": "FOUR_LAYER_BASELINE_CREATED_REROUTE_REQUIRED_NOT_FOR_FABRICATION",
    "parent_version": "HW-V1.0",
    "parent_snapshot": "hardware/xe-minimal/snapshots/HW-V1.0-2026-10-28/snapshot-manifest.json",
    "functional_contract": "No circuit, safety, storage, battery, USB or firmware feature changes permitted",
    "costdown_order": [
        "four copper layers",
        "ordinary off-pad through vias only",
        "zero DRC and zero unconnected",
        "single-side assembly only if it fits without changing function or unsafe thermal density",
    ],
    "geometry_policy": "May grow by a few millimetres; canonical HW-V1.0 remains untouched",
    "baseline_transform": "In3 folded onto In1; In4 folded onto In2; duplicate GND zone removed",
    "drc_violations": len(drc.get("violations", [])),
    "unconnected_items": len(drc.get("unconnected_items", [])),
    "candidate_sha256": hashlib.sha256(candidate.read_bytes()).hexdigest(),
    "source_sha256": hashlib.sha256(source.read_bytes()).hexdigest(),
    "release_allowed": False,
    "orders_uploads_payments_contacts_performed": False,
}
(OUT / "baseline-review.json").write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n")
print(json.dumps(report, ensure_ascii=False))
