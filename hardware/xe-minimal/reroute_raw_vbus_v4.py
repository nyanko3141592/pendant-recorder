#!/usr/bin/env python3
from pathlib import Path
import pcbnew as k, wx

p = Path(__file__).resolve().parent / 'pendant-xe-minimal.kicad_pcb'
app = wx.App(False)
b = k.LoadBoard(str(p))
n = b.FindNet('/VBUS')

# Remove the failed branch trial and known remnants left by deleted parts.
remove_points = {
    (13.9, 18.9), (14.0, 19.0),
    (1.765, 0.795), (17.7, 7.1),
}
for item in list(b.GetTracks()):
    if type(item).__name__ != 'PCB_TRACK':
        continue
    try:
        s, e = item.GetStart(), item.GetEnd()
    except TypeError:
        continue
    ends = [(s.x / 1e6, s.y / 1e6), (e.x / 1e6, e.y / 1e6)]
    if any(any(abs(px-x) < 1e-5 and abs(py-y) < 1e-5 for x, y in remove_points)
           for px, py in ends):
        b.Delete(item)

def point(x, y):
    return k.VECTOR2I(k.FromMM(x), k.FromMM(y))

def via(x, y):
    v = k.PCB_VIA(b)
    v.SetPosition(point(x, y))
    v.SetWidth(k.FromMM(0.6))
    v.SetDrill(k.FromMM(0.3))
    v.SetLayerPair(k.F_Cu, k.B_Cu)
    v.SetNet(n)
    b.Add(v)

def track(a, z, layer):
    t = k.PCB_TRACK(b)
    t.SetStart(point(*a))
    t.SetEnd(point(*z))
    t.SetLayer(layer)
    t.SetWidth(k.FromMM(0.25))
    t.SetNet(n)
    b.Add(t)

# Use ordinary through-vias outside the connector pads, then join on B.Cu.
via(9.289418, 17.655889)
via(14.4, 17.3)
track((9.289418, 17.655889), (10.0, 16.9), k.B_Cu)
track((10.0, 16.9), (13.525, 16.9), k.B_Cu)
track((13.525, 16.9), (13.525, 18.815), k.B_Cu)
track((14.4, 17.3), (13.525, 16.9), k.B_Cu)

k.ZONE_FILLER(b).Fill(b.Zones())
k.SaveBoard(str(p), b)
