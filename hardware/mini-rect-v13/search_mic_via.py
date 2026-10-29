"""Stitch surface GND islands to In1 using normal0.45/0.20 vias; DRC follows."""
from pathlib import Path
import json,shutil,math
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent;b=k.LoadBoard(str(P/'ground-stitched.kicad_pcb'))
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

import subprocess
f=next(f for f in b.GetFootprints() if f.GetReference()=='U8');pad=next(p for p in f.Pads() if p.GetNumber()=='5');start=pad.GetPosition();sx,sy=k.ToMM(start.x),k.ToMM(start.y)
candidates=[]
for ix in range(-20,21):
 for iy in range(-20,21):
  if not(ix or iy):continue
  q=pt(sx+ix*.1,sy+iy*.1)
  if allowed(q):candidates.append((ix*ix+iy*iy,q))
print('Legal mic via candidates',len(candidates),flush=True)
accepted=None
for _,q in sorted(candidates,key=lambda a:a[0])[:20]:
 v=k.PCB_VIA(b);v.SetPosition(q);v.SetWidth(k.FromMM(.45));v.SetDrill(k.FromMM(.2));v.SetViaType(k.VIATYPE_THROUGH);v.SetLayerPair(k.F_Cu,k.B_Cu);v.SetNetCode(gnd);b.Add(v)
 t=k.PCB_TRACK(b);t.SetStart(start);t.SetEnd(q);t.SetWidth(k.FromMM(.1));t.SetLayer(k.F_Cu);t.SetNetCode(gnd);b.Add(t)
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(P/'mic-via-candidate.kicad_pcb'),b)
 shutil.copyfile(P/'ground-stitched.kicad_pro',P/'mic-via-candidate.kicad_pro')
 subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(P/'mic-via-candidate.kicad_pcb'),'--format','json','-o',str(P/'mic-via-drc.json')],stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL,check=True)
 d=json.loads((P/'mic-via-drc.json').read_text())
 bad=[x for x in d['violations'] if x['type']!='track_dangling']
 if not bad and len(d['unconnected_items'])<6:
  accepted=dict(x_mm=k.ToMM(q.x),y_mm=k.ToMM(q.y),unconnected=len(d['unconnected_items']),drc=len(d['violations']));break
 b.DeleteNative(t);b.DeleteNative(v)
print('ACCEPTED',accepted,flush=True)
(P/'mic-via-search.json').write_text(json.dumps(dict(status='CANDIDATE_NOT_RELEASED' if accepted else 'NO_ACCEPTED_CANDIDATE',accepted=accepted),indent=2)+'\n')
