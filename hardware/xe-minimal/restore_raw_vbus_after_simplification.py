#!/usr/bin/env python3
"""Restore the original raw-VBUS routing lost while pruning obsolete branches."""
from pathlib import Path
import pcbnew as k
import wx
R=Path(__file__).resolve().parent
dst=R/'pendant-xe-minimal.kicad_pcb'
src=R/'pre-u10-paste-adoption'/'pendant-xe-minimal.kicad_pcb'
app=wx.App(False); b=k.LoadBoard(str(dst)); old=k.LoadBoard(str(src)); net=b.FindNet('/VBUS')
def key(t):
 if t.GetClass()=='PCB_VIA':
  p=t.GetPosition(); return ('PCB_VIA',p.x,p.y,t.TopLayer(),t.BottomLayer(),t.GetWidth(t.TopLayer()))
 return (type(t).__name__,t.GetStart().x,t.GetStart().y,t.GetEnd().x,t.GetEnd().y,t.GetLayer(),t.GetWidth())
have={key(t) for t in b.GetTracks() if t.GetNetname()=='/VBUS'}
for t in old.GetTracks():
 if t.GetNetname()!='/VBUS' or key(t) in have: continue
 if t.GetClass()=='PCB_VIA':
  n=k.PCB_VIA(b); n.SetPosition(t.GetPosition()); n.SetWidth(t.GetWidth(t.TopLayer())); n.SetDrill(t.GetDrillValue()); n.SetLayerPair(t.TopLayer(),t.BottomLayer())
 else:
  n=k.PCB_TRACK(b); n.SetStart(t.GetStart()); n.SetEnd(t.GetEnd()); n.SetLayer(t.GetLayer()); n.SetWidth(t.GetWidth())
 n.SetNet(net); b.Add(n)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst),b)
