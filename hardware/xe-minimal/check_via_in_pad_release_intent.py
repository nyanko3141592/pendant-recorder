"""Fail closed unless every current hole-over-pad via has the selected POFV intent."""

import json
import subprocess
from pathlib import Path

import pcbnew as k
import wx


HERE = Path(__file__).resolve().parent
BOARD = HERE / "pendant-xe-minimal.kicad_pcb"
AUDIT = HERE / "exact-via-pad-overlap-audit.json"

app = wx.App(False)
subprocess.run(
    [
        "/Applications/KiCad/KiCad.app/Contents/Frameworks/Python.framework/Versions/Current/bin/python3",
        str(HERE / "audit_exact_via_pad_overlap.py"),
    ],
    check=True,
    stdout=subprocess.DEVNULL,
)

audit = json.loads(AUDIT.read_text())
board = k.LoadBoard(str(BOARD))
vias = {
    item.m_Uuid.AsString(): item
    for item in board.GetTracks()
    if isinstance(item, k.PCB_VIA)
}

assert board.GetCopperLayerCount() == 6
assert audit["hole_over_pad_vias"] == 4
flagged = [item for item in audit["vias"] if any(hit["hole_overlaps_pad"] for hit in item["hits"])]
assert len(flagged) == 4

checked = []
for item in flagged:
    via = vias[item["uuid"]]
    drill_mm = k.ToMM(via.GetDrillValue())
    diameter_mm = k.ToMM(via.GetWidth(k.F_Cu))
    assert abs(drill_mm - 0.15) < 1e-6
    assert diameter_mm + 1e-6 >= drill_mm + 0.15
    assert via.GetFillingMode() == k.FILLING_MODE_FILLED
    assert via.GetCappingMode() == k.CAPPING_MODE_CAPPED
    checked.append({"uuid": item["uuid"], "net": via.GetNetname(), "xy_mm": item["xy_mm"], "drill_mm": drill_mm, "diameter_mm": diameter_mm, "filled": True, "capped": True})

print(json.dumps({"status": "PASS_PUBLISHED_JLC_POFV_GEOMETRY_INTENT", "copper_layers": board.GetCopperLayerCount(), "hole_over_pad_vias": len(checked), "vias": checked, "physical_acceptance": "NOT_MEASURED"}, ensure_ascii=False))
