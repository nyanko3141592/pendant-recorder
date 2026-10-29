#!/usr/bin/env python3
"""Add checked through-ground stitching near the USB corridor, preserving poses."""
import pcbnew as k,wx
from pathlib import Path
import math,json,subprocess,shutil
app=wx.App(False)
D=Path(__file__).resolve().parent/'costdown/HW-V1.4-EVT-4LAYER-27P5/route';P=D/'hw-v1.4-evt-4layer-27p5-routed-candidate.kicad_pcb';W=D/'manual-refinement'
b=k.LoadBoard(str(P));tracks=list(b.GetTracks());pads=[p for f in b.GetFootprints() for p in f.Pads()];gnd=next(p.GetNet() for p in pads if p.GetNetname()=='/GND')
def xy(v):return k.ToMM(v.x),k.ToMM(v.y)
def dist(q,a,z):
 dx=z[0]-a[0];dy=z[1]-a[1];f=max(0,min(1,((q[0]-a[0])*dx+(q[1]-a[1])*dy)/(dx*dx+dy*dy))) if dx or dy else 0
 return math.hypot(q[0]-a[0]-f*dx,q[1]-a[1]-f*dy)
def clear(q):
 pos=k.VECTOR2I(k.FromMM(q[0]),k.FromMM(q[1]))
 for t in tracks:
  if t.GetNetname()=='/GND':continue
  width=t.GetWidth(k.F_Cu) if isinstance(t,k.PCB_VIA) else t.GetWidth()
  if dist(q,xy(t.GetStart()),xy(t.GetEnd()))<.335+k.ToMM(width)/2:return False
 for p in pads:
  for layer in (k.F_Cu,k.B_Cu):
   if p.IsOnLayer(layer) and p.GetEffectiveShape(layer).Collide(pos,k.FromMM(.35)):return False
 return True
added=[]
for center in [(12,17),(14,16),(15.8,14.6),(17,12.4),(18.5,10.9),(20.5,8.2)]:
 candidates=sorted([(center[0]+i*.1,center[1]+j*.1) for i in range(-10,11) for j in range(-10,11)],key=lambda q:math.dist(q,center))
 for q in candidates:
  if clear(q) and all(math.dist(q,a)>.7 for a in added):
   v=k.PCB_VIA(b);v.SetPosition(k.VECTOR2I(k.FromMM(q[0]),k.FromMM(q[1])));v.SetWidth(k.FromMM(.45));v.SetDrill(k.FromMM(.2));v.SetLayerPair(k.F_Cu,k.B_Cu);v.SetViaType(k.VIATYPE_THROUGH);v.SetNet(gnd);b.Add(v);tracks.append(v);added.append(q);break
candidate=W/'ground-stitch.kicad_pcb';k.SaveBoard(str(candidate),b)
for ext in ('.kicad_pro','.kicad_dru'):shutil.copy2(P.with_suffix(ext),candidate.with_suffix(ext))
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc','--refill-zones','--save-board','--format','json','--severity-all','--output',str(W/'ground-stitch-drc.json'),str(candidate)],check=True,stdout=subprocess.DEVNULL)
drc=json.loads((W/'ground-stitch-drc.json').read_text());bad=[v for v in drc['violations'] if v['type']!='lib_footprint_issues'];accepted=not bad and not drc['unconnected_items']
report={'added_gnd_via_xy_mm':added,'accepted':accepted,'geometric_violations':bad,'unconnected':drc['unconnected_items']};(W/'ground-stitch-review.json').write_text(json.dumps(report,indent=2)+'\n')
if accepted:shutil.copy2(candidate,P)
print(json.dumps(report))
