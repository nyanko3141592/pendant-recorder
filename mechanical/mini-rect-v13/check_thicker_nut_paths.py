"""Discrete assembly paths, explicitly not continuous collision proof."""
from pathlib import Path
import json,hashlib,cadquery as cq
p=Path(__file__).resolve().parent/'captive-nut-thicker-trial';f=p/'ASSEMBLY-NOT-RELEASED.step'
s=cq.importers.importStep(str(f)).val().Solids();assert len(s)==86
body,lid=s[:2];rows=[]
for idx in [82,84]:
 nut=s[idx];assert abs(nut.BoundingBox().zlen-.8)<.001
 for dy in [0,-.1,-.25,-.5,-1,-1.5,-2,-2.5,-3,-4,-5]:
  moved=nut.translate((0,dy,0));c=body.intersect(moved)
  rows.append(dict(nut_index=idx,translation_y_mm=dy,body_overlap_mm3=c.Volume(),valid=c.isValid()))
lifts=[]
for dz in [0,.05,.1,.2,.4,.8,1.2,2,3,4]:
 c=body.intersect(lid.translate((0,0,dz)));lifts.append(dict(lift_mm=dz,overlap_mm3=c.Volume(),valid=c.isValid()))
r=dict(status='DISCRETE_ASSEMBLY_PATH_SCREEN',step_sha256=hashlib.sha256(f.read_bytes()).hexdigest(),nut_paths=rows,lid_lift=lifts,limitations=['Discrete samples only','Nut samples check body only, with lid removed; installed PCB and handling access not included','No supplier/print tolerances or retention strength'])
(p/'assembly-path-review.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps({'nut_collisions':[a for a in rows if a['body_overlap_mm3']>1e-6],'lid_collisions':[a for a in lifts if a['overlap_mm3']>1e-6]},indent=2))
