#!/usr/bin/env python3
from pathlib import Path
import pcbnew as k, wx

r = Path(__file__).resolve().parent
p = r / 'pendant-xe-minimal.kicad_pcb'
app = wx.App(False)
b = k.LoadBoard(str(p))

v4_points = {
    (9.289418, 17.655889), (14.4, 17.3), (10.0, 16.9),
    (13.525, 16.9), (13.525, 18.815),
}
for item in list(b.GetTracks()):
    if item.GetClass() == 'PCB_VIA':
        q = item.GetPosition()
        if any(abs(q.x/1e6-x) < 1e-5 and abs(q.y/1e6-y) < 1e-5 for x, y in v4_points):
            b.Delete(item)
        continue
    if type(item).__name__ != 'PCB_TRACK':
        continue
    try:
        s, e = item.GetStart(), item.GetEnd()
    except TypeError:
        continue
    ends = [(s.x/1e6, s.y/1e6), (e.x/1e6, e.y/1e6)]
    if item.GetNetname() == '/VBUS' and any(
        any(abs(px-x) < 1e-5 and abs(py-y) < 1e-5 for x, y in v4_points)
        for px, py in ends
    ):
        b.Delete(item)

k.SaveBoard(str(p), b)
