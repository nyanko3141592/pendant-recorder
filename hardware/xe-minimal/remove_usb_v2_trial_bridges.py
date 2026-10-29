#!/usr/bin/env python3
"""Remove rejected direct-copper bridge trials; leaves the VBUS reroute explicitly open."""
from pathlib import Path
import pcbnew as k
import wx

p = Path(__file__).resolve().parent / "pendant-xe-minimal.kicad_pcb"
app = wx.App(False)
b = k.LoadBoard(str(p))
trial_points = {
    (k.FromMM(11.5375), k.FromMM(1.249999)),
    (k.FromMM(16.7625), k.FromMM(3.399999)),
    (k.FromMM(11.5), k.FromMM(0.22)),
    (k.FromMM(17.15), k.FromMM(0.22)),
}
for t in list(b.GetTracks()):
    endpoints = {(t.GetStart().x, t.GetStart().y), (t.GetEnd().x, t.GetEnd().y)}
    if t.GetNetname() == "/VBUS" and len(endpoints & trial_points) == 2:
        b.Delete(t)
k.SaveBoard(str(p), b)
