"""Stitch surface GND islands to In1 using normal0.45/0.20 vias; DRC follows."""
from pathlib import Path
import json,shutil,math
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent;b=k.LoadBoard(str(P/'ground-repair.kicad_pcb'))
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
rows=[]
for z in list(b.Zones()):
 if z.GetLayer()==k.In1_Cu:continue
 poly=z.GetFilledPolysList(z.GetLayer())
 for i in range(poly.OutlineCount()):
  if any(isinstance(t,k.PCB_VIA) and t.GetNetCode()==gnd and poly.Contains(t.GetPosition(),i) and inner.HitTestFilledArea(k.In1_Cu,t.GetPosition()) for t in b.GetTracks()):continue
  best=None
  for iy in range(2,91):
   for ix in range(2,83):
    q=pt(ix*.25,iy*.25)
    if poly.Contains(q,i) and allowed(q):best=q;break
   if best is not None:break
  row=dict(layer=b.GetLayerName(z.GetLayer()),island=i)
  if best is None:row['result']='NO_LEGAL_SITE'
  else:
   v=k.PCB_VIA(b);v.SetPosition(best);v.SetWidth(k.FromMM(.45));v.SetDrill(k.FromMM(.2));v.SetViaType(k.VIATYPE_THROUGH);v.SetLayerPair(k.F_Cu,k.B_Cu);v.SetNetCode(gnd);b.Add(v)
   row.update(result='VIA_ADDED',x_mm=k.ToMM(best.x),y_mm=k.ToMM(best.y))
  rows.append(row)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(P/'ground-stitched.kicad_pcb'),b)
shutil.copyfile(P/'ground-repair.kicad_pro',P/'ground-stitched.kicad_pro')
(P/'ground-stitch-sites.json').write_text(json.dumps(dict(status='CANDIDATE_REQUIRES_DRC',rows=rows),indent=2)+'\n')
print(rows)
