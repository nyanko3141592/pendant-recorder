#!/usr/bin/env python3
from pathlib import Path
import pcbnew as k, wx

p = Path(__file__).resolve().parent / 'pendant-xe-minimal.kicad_pcb'
app = wx.App(False)
b = k.LoadBoard(str(p))
pairs = [
    {(9.9425,2.025),(8.1925,2.025)},
    {(22.765,10.315),(22.2,9.8)},
    {(7.245,4.795),(9.9425,2.025)},
    {(3.925,21.175),(3.125,21.175)},
    {(7.625,21.675),(6.125,21.675)},
    {(10.5,3.1),(9.9425,2.025)},
    {(22.2,9.8),(21.4,8.8)},
    {(3.925,20.175),(3.925,21.175)},
    {(21.4,8.8),(19.2,8.8)},
    {(3.125,20.175),(3.925,20.175)},
    {(19.2,8.8),(18.9,8.3)},
    {(3.125,20.175),(6.125,19.675)},
    {(18.9,8.3),(17.7,7.1)},
    {(6.125,19.675),(5.4,19.7)},
    {(17.7,7.1),(16.7,7.1)},
    {(5.4,19.7),(5.3,20.0)},
    {(16.7,7.1),(16.7625,3.399999)},
    {(5.3,20.0),(5.3,21.5)},
    {(5.3,21.5),(5.4,21.6)},
    {(5.4,21.6),(7.625,21.675)},
]
for t in list(b.GetTracks()):
    if type(t).__name__ != 'PCB_TRACK':
        continue
    try:
        s, e = t.GetStart(), t.GetEnd()
    except TypeError:
        continue
    ends = [(s.x/1e6,s.y/1e6),(e.x/1e6,e.y/1e6)]
    def same_pair(pair):
        return all(any(abs(px-x)<1e-5 and abs(py-y)<1e-5 for px,py in ends) for x,y in pair)
    if t.GetNetname() == '/VBUS' and any(same_pair(pair) for pair in pairs):
        b.Delete(t)
k.ZONE_FILLER(b).Fill(b.Zones())
k.SaveBoard(str(p),b)
