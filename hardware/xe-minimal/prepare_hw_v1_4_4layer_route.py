#!/usr/bin/env python3
"""Prepare the fixed-outline HW-V1.4 four-layer autorouter input.

The canonical six-layer board and the folded baseline remain untouched.  All
old copper is removed because folding two inner layers creates false shorts;
component placement, outline, footprints, nets and design rules are retained.
"""
from pathlib import Path
import hashlib
import json
import shutil

import wx
import pcbnew as k

app = wx.App(False)
HERE = Path(__file__).resolve().parent
OUT = HERE / "costdown/HW-V1.4-EVT-4LAYER-27P5/route"
OUT.mkdir(parents=True, exist_ok=True)
source = HERE / "costdown/HW-V1.4-EVT-4LAYER-27P5/hw-v1.4-evt-4layer-27p5-baseline.kicad_pcb"
board_path = OUT / "hw-v1.4-evt-4layer-27p5-unrouted.kicad_pcb"
dsn_path = board_path.with_suffix(".dsn")
b = k.LoadBoard(str(source))

for item in list(b.GetTracks()):
    b.RemoveNative(item)
for zone in list(b.Zones()):
    b.RemoveNative(zone)

b.SetCopperLayerCount(4)
settings = b.GetDesignSettings()
settings.m_TrackMinWidth = k.FromMM(0.10)
settings.m_ViasMinSize = k.FromMM(0.45)
settings.m_MinThroughDrill = k.FromMM(0.20)

k.SaveBoard(str(board_path), b)
for suffix in (".kicad_pro", ".kicad_dru"):
    shutil.copy2(source.with_suffix(suffix), board_path.with_suffix(suffix))
assert k.ExportSpecctraDSN(b, str(dsn_path))

report = {
    "version": "HW-V1.4-EVT-4LAYER-27P5",
    "status": "UNROUTED_AUTOROUTER_INPUT",
    "board_outline_mm": [27.5, 27.5],
    "copper_layers": 4,
    "assembly_sides": 2,
    "placement_changes": 0,
    "functional_changes": 0,
    "routes_removed": True,
    "zones_removed": True,
    "minimum_track_mm": 0.10,
    "ordinary_via_mm": {"diameter": 0.45, "drill": 0.20},
    "footprints": len(b.GetFootprints()),
    "nets": len(list(b.GetNetInfo().NetsByNetcode().values())),
    "board_sha256": hashlib.sha256(board_path.read_bytes()).hexdigest(),
    "dsn_sha256": hashlib.sha256(dsn_path.read_bytes()).hexdigest(),
    "release_allowed": False,
    "next_gate": "Import routed session, restore planes, then require DRC=0 and unconnected=0 plus manual USB/power/POFV review",
}
(OUT / "route-input-review.json").write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n")
print(json.dumps(report, ensure_ascii=False))
