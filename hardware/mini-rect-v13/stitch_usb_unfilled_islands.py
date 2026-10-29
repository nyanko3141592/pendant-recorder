"""Stitch surface GND islands to In1 using normal0.45/0.20 vias; DRC follows."""
from pathlib import Path
import json,shutil,math
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent;b=k.LoadBoard(str(P/'power-width-candidate.kicad_pcb'))
def pt(x,y):return k.VECTOR2I(k.FromMM(x),k.FromMM(y))
gnd=b.FindNet('/GND').GetNetCode();inner=next(z for z in b.Zones() if z.GetLayer()==k.In1_Cu)
pads=[p for f in b.GetFootprints() for p in f.Pads()]
rules=[z for f in b.GetFootprints() for z in f.Zones() if z.GetIsRuleArea() and z.GetDoNotAllowVias()]
def allowed(q):
 if not inner.HitTestFilledArea(k.In1_Cu,q):return False
 x,y=k.ToMM(q.x),k.ToMM(q.y);cx=min(max(x,2.5),18.5);cy=min(max(y,2.5),20.5)
 if (x-cx)**2+(y-cy)**2>1.95**2:return False
 for p in pads:
  if p.GetDrillSize().x:
   radius=max(k.ToMM(p.GetDrillSize().x),k.ToMM(p.GetDrillSize().y))/2+.35
   if math.hypot(k.ToMM(q.x-p.GetPosition().x),k.ToMM(q.y-p.GetPosition().y))<radius:return False
  margin=.326 if p.GetNetCode()!=gnd else .15
  if p.GetAttribute()==k.PAD_ATTRIB_NPTH:margin=.326
  if p.HitTest(q,k.FromMM(margin)):return False
 for t in b.GetTracks():
  if isinstance(t,k.PCB_VIA):
   if math.hypot(k.ToMM(q.x-t.GetPosition().x),k.ToMM(q.y-t.GetPosition().y))<.451:return False
  if t.GetNetCode()!=gnd and t.HitTest(q,k.FromMM(.326)):return False
 for z in rules:
  r=z.GetBoundingBox();r.Inflate(k.FromMM(.225))
  if r.Contains(q):return False
 return True

# Search unfilled L3 regions; requiring an existing L3 fill would exclude islands
# that need a via to survive the zone filler in the first place.
inner2=next(z for z in b.Zones() if z.GetLayer()==k.In2_Cu)
rows=[]
for x,y in [(15.8,9.155),(10.4,16.0)]:
 candidates=sorted([(dx*dx+dy*dy,x+dx*.05,y+dy*.05) for dx in range(-30,31) for dy in range(-30,31) if 0<dx*dx+dy*dy<=900])
 for _,xx,yy in candidates:
  q=pt(xx,yy)
  if not inner2.HitTestFilledArea(k.In2_Cu,q) and allowed(q):
   v=k.PCB_VIA(b);v.SetPosition(q);v.SetWidth(k.FromMM(.45));v.SetDrill(k.FromMM(.2));v.SetViaType(k.VIATYPE_THROUGH);v.SetLayerPair(k.F_Cu,k.B_Cu);v.SetNetCode(gnd);b.Add(v)
   rows.append(dict(target=[x,y],via=[xx,yy]));break
 else:rows.append(dict(target=[x,y],result='NO_SITE'))
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(P/'usb-island-stitch-candidate.kicad_pcb'),b)
shutil.copy2(P/'power-width-candidate.kicad_pro',P/'usb-island-stitch-candidate.kicad_pro')
(P/'usb-island-stitch-sites.json').write_text(json.dumps(rows,indent=2)+'\n');print(rows)
