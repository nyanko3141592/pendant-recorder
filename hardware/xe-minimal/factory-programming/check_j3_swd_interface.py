"""Verify the factory SWD pads directly from the canonical PCB."""

import json
from pathlib import Path

import pcbnew as k
import wx


HERE = Path(__file__).resolve().parent
BOARD = HERE.parent / "pendant-xe-minimal.kicad_pcb"
app = wx.App(False)
board = k.LoadBoard(str(BOARD))
j3 = next(fp for fp in board.GetFootprints() if fp.GetReference() == "J3")
expected = {"1": "/V3V3", "2": "/SWDIO", "3": "/NRST", "4": "/SWCLK", "5": "/GND"}
pads = {pad.GetNumber(): pad for pad in j3.Pads()}
assert set(pads) == set(expected)
result = []
for number, net in expected.items():
    pad = pads[number]
    assert pad.GetNetname() == net
    assert pad.IsOnLayer(k.F_Cu)
    assert k.ToMM(pad.GetSize().x) >= 1.0 and k.ToMM(pad.GetSize().y) >= 1.0
    pos = pad.GetPosition()
    result.append({"pin": number, "net": net, "xy_mm": [k.ToMM(pos.x), k.ToMM(pos.y)], "size_mm": [k.ToMM(pad.GetSize().x), k.ToMM(pad.GetSize().y)]})
print(json.dumps({"status": "PASS_CANONICAL_J3_SWD_INTERFACE_CAD_ONLY", "side": board.GetLayerName(j3.GetLayer()), "rotation_deg": j3.GetOrientationDegrees(), "pads": result, "physical_pogo_contact": "NOT_RUN"}, ensure_ascii=False))
