#!/usr/bin/env python3
"""Adopt stocked Murata C33 without changing the proven 0402 placement."""
from pathlib import Path
import pcbnew as k
import wx

HERE = Path(__file__).resolve().parent
BOARD = HERE / "pendant-xe-minimal.kicad_pcb"
app = wx.App(False)
b = k.LoadBoard(str(BOARD))
old = b.FindFootprintByReference("C33")
assert old is not None

lib = "/Applications/KiCad/KiCad.app/Contents/SharedSupport/footprints/Capacitor_SMD.pretty"
new = k.FootprintLoad(lib, "C_0402_1005Metric")
new.SetFPID(k.LIB_ID("Capacitor_SMD", "C_0402_1005Metric"))
new.SetReference("C33")
new.SetValue("1u 35V X5R")
new.SetPosition(old.GetPosition())
new.SetOrientation(old.GetOrientation())
new.Reference().SetVisible(False)
for pad in new.Pads():
    pad.SetNet(b.FindNet("/VBUS") if pad.GetNumber() == "1" else b.FindNet("/GND"))
b.Remove(old)
b.Add(new)
k.SaveBoard(str(BOARD), b)
print("MIGRATED_C33_TO_MURATA_GRT155R6YA105KE13D_C6628588_0402_35V")
