#!/usr/bin/env python3
from pathlib import Path
import pcbnew as k, wx
p=Path(__file__).resolve().parent/'pendant-xe-minimal.kicad_pcb';app=wx.App(False);b=k.LoadBoard(str(p));n=b.FindNet('/VBUS')
for a,z,layer in [((13.525,18.815),(13.9,18.9),k.B_Cu),((9.289418,17.655889),(13.752953,21.229813),k.In4_Cu)]:
 t=k.PCB_TRACK(b);t.SetStart(k.VECTOR2I(k.FromMM(a[0]),k.FromMM(a[1])));t.SetEnd(k.VECTOR2I(k.FromMM(z[0]),k.FromMM(z[1])));t.SetLayer(layer);t.SetWidth(k.FromMM(.25));t.SetNet(n);b.Add(t)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(p),b)
