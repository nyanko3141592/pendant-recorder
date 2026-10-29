#!/usr/bin/env python3
from pathlib import Path
import pcbnew as k,wx
p=Path(__file__).resolve().parent/'pendant-xe-minimal.kicad_pcb';app=wx.App(False);b=k.LoadBoard(str(p));n=b.FindNet('/VBUS')
bad={(k.FromMM(9.289418),k.FromMM(17.655889)),(k.FromMM(13.752953),k.FromMM(21.229813))}
for t in list(b.GetTracks()):
 if type(t).__name__!='PCB_TRACK': continue
 try:
  ends={(t.GetStart().x,t.GetStart().y),(t.GetEnd().x,t.GetEnd().y)}
 except TypeError:
  continue
 if t.GetNetname()=='/VBUS' and t.GetLayer()==k.In4_Cu and ends==bad:b.Delete(t)
 # Exact dangling remnants of removed components.
 if any(abs(next(iter(ends))[0]-k.FromMM(x))<5 and abs(next(iter(ends))[1]-k.FromMM(y))<5 for x,y in [(19.265,.794999),(1.765,.794999),(17.7225,2.199999),(18.9,8.3)]): b.Delete(t)
j=b.FindFootprintByReference('J1');u=b.FindFootprintByReference('U2')
a4=j.FindPadByNumber('A4').GetPosition();a9=j.FindPadByNumber('A9').GetPosition();u5=u.FindPadByNumber('5').GetPosition()
via_a4=k.VECTOR2I(k.FromMM(9.289418),k.FromMM(17.655889));branch=k.VECTOR2I(k.FromMM(13.9),k.FromMM(18.9))
for s,e,layer in [(a4,via_a4,k.F_Cu),(a9,branch,k.F_Cu),(u5,branch,k.B_Cu)]:
 t=k.PCB_TRACK(b);t.SetStart(s);t.SetEnd(e);t.SetLayer(layer);t.SetWidth(k.FromMM(.25));t.SetNet(n);b.Add(t)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(p),b)
