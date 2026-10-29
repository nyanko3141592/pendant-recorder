#!/usr/bin/env python3
from pathlib import Path
import pcbnew as k
import wx

P=Path(__file__).resolve().parent/'pendant-xe-minimal.kicad_pcb'
app=wx.App(False); b=k.LoadBoard(str(P)); vbus=b.FindNet('/VBUS'); chg=b.FindNet('/VBUS_CHARGER')
r=b.FindFootprintByReference('R51')
oldpads={(p.GetPosition().x,p.GetPosition().y) for p in r.Pads()}
for t in list(b.GetTracks()):
 ends={(t.GetStart().x,t.GetStart().y),(t.GetEnd().x,t.GetEnd().y)}
 if ends & oldpads: b.Delete(t)
b.Delete(r)

stale={
 (k.FromMM(21.4),k.FromMM(8.8)),(k.FromMM(11.3),k.FromMM(21.0)),
 (k.FromMM(13.752953),k.FromMM(21.229813)),(k.FromMM(9.8),k.FromMM(20.4)),
 (k.FromMM(19.265),k.FromMM(.795)),(k.FromMM(1.765),k.FromMM(.795)),
 (k.FromMM(17.7225),k.FromMM(2.2)),(k.FromMM(1.765),k.FromMM(9.795)),
 (k.FromMM(13.8375),k.FromMM(2.199999)),
 (k.FromMM(19.2),k.FromMM(8.8)),(k.FromMM(14.0),k.FromMM(19.7)),
 (k.FromMM(9.289418),k.FromMM(17.655889)),
}
for t in list(b.GetTracks()):
 ends={(t.GetStart().x,t.GetStart().y),(t.GetEnd().x,t.GetEnd().y)}
 if ends & stale: b.Delete(t)

lib='/Applications/KiCad/KiCad.app/Contents/SharedSupport/footprints/Resistor_SMD.pretty'
r=k.FootprintLoad(lib,'R_0402_1005Metric');r.SetReference('R51');r.SetValue('0R 1%')
r.SetFPID(k.LIB_ID('Resistor_SMD','R_0402_1005Metric'))
r.SetPosition(k.VECTOR2I(k.FromMM(13.5),k.FromMM(3.0)))
r.Reference().SetVisible(False); r.Value().SetVisible(False); b.Add(r)
r.FindPadByNumber('1').SetNet(chg);r.FindPadByNumber('2').SetNet(vbus)
a=k.VECTOR2I(k.FromMM(12.7375),k.FromMM(1.05));z=k.VECTOR2I(k.FromMM(15.0125),k.FromMM(2.0))
routes=[([a,k.VECTOR2I(k.FromMM(12.55),k.FromMM(2.55)),r.FindPadByNumber('1').GetPosition()],chg),
        ([z,r.FindPadByNumber('2').GetPosition()],vbus)]
for points,net in routes:
 for s,e in zip(points,points[1:]):
  t=k.PCB_TRACK(b);t.SetStart(s);t.SetEnd(e);t.SetLayer(k.F_Cu);t.SetWidth(k.FromMM(.2));t.SetNet(net);b.Add(t)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(P),b)
