#!/usr/bin/env python3
"""Add the TPS22950 local input/output bypass capacitors to the canonical PCB."""
from pathlib import Path

import pcbnew as k
import wx


HERE = Path(__file__).resolve().parent
BOARD = HERE / "pendant-xe-minimal.kicad_pcb"

app = wx.App(False)
board = k.LoadBoard(str(BOARD))

assert board.FindFootprintByReference("C31") is None
assert board.FindFootprintByReference("C32") is None

u13 = board.FindFootprintByReference("U13")
assert u13 is not None
vbus = board.FindNet("/VBUS")
vout = board.FindNet("/VBUS_CHARGER")
gnd = board.FindNet("/GND")


def add_cap(ref, x, y, rotation, signal, template_ref):
    # Duplicate a footprint already placed on the required side. SetLayer on a
    # loaded footprint does not mirror its child items and is therefore unsafe.
    template = board.FindFootprintByReference(template_ref)
    assert template is not None
    cap = k.Cast_to_FOOTPRINT(template.Duplicate(False))
    cap.SetReference(ref)
    cap.SetValue("1u 10V X5R")
    symbol_uuid = {
        "C31": "c0310000-0000-4000-8000-000000000005",
        "C32": "c0320000-0000-4000-8000-000000000005",
    }[ref]
    cap.SetPath(k.KIID_PATH(f"/afab3f0e-e2bb-5ea9-9f68-cfd4ab17cf9a/{symbol_uuid}"))
    cap.SetPosition(k.VECTOR2I(k.FromMM(x), k.FromMM(y)))
    cap.SetOrientationDegrees(rotation)
    cap.Reference().SetVisible(False)
    for pad in cap.Pads():
        pad.SetNet(signal if pad.GetNumber() == "1" else gnd)
    board.Add(cap)
    return cap


def track(net, start, end, width=0.25, layer=k.F_Cu):
    item = k.PCB_TRACK(board)
    item.SetNet(net)
    item.SetLayer(layer)
    item.SetWidth(k.FromMM(width))
    item.SetStart(k.VECTOR2I(k.FromMM(start[0]), k.FromMM(start[1])))
    item.SetEnd(k.VECTOR2I(k.FromMM(end[0]), k.FromMM(end[1])))
    board.Add(item)


# Both capacitors sit on the same side as U13. Their signal pads are less than
# 1.2 mm from the relevant switch pins; their ground pads connect directly to
# the existing front ground pour.
add_cap("C31", 15.50, 0.95, 0, vbus, "C16")
add_cap("C32", 10.80, 1.80, 180, vout, "C13")
track(vbus, (13.6375, 0.95), (14.99, 0.95))
track(gnd, (15.98, 0.95), (17.3025, 1.029999), 0.20)
# The output capacitor is directly beneath U13 on B.Cu. Its signal pad joins
# the filled/capped VOUT via; its ground pad lands in the bottom ground pour.
track(vout, (11.5375, 1.249999), (11.28, 1.80), 0.25, k.B_Cu)
track(gnd, (10.32, 1.80), (10.4175, 1.075), 0.20, k.B_Cu)

board.BuildConnectivity()
k.SaveBoard(str(BOARD), board)
print(BOARD)
