"""Measure horizontal mating lands; no adhesive strength or print certification."""
from pathlib import Path
import json,hashlib
import cadquery as cq
w=Path(__file__).resolve().parent/'captured-carrier-case'
sh={n:cq.importers.importStep(str(w/f'case-{n}.step')).val() for n in ['lower','upper']}
faces={n:[(i,f) for i,f in enumerate(s.Faces()) if f.BoundingBox().zlen<1e-5 and f.Area()>.1] for n,s in sh.items()}
rows=[]
for li,lf in faces['lower']:
 if lf.normalAt().z<.99:continue
 for ui,uf in faces['upper']:
  if uf.normalAt().z>-.99:continue
  gap=uf.Center().z-lf.Center().z
  if not -1e-6<=gap<=.15:continue
  projected=uf.translate((0,0,-gap));common=lf.intersect(projected);area=sum(f.Area() for f in common.Faces())
  if area>.001:rows.append({'lower_face':li,'upper_face':ui,'lower_z_mm':lf.Center().z,'nominal_gap_mm':gap,'projected_overlap_area_mm2':area})
r={'status':'JOINT_LANDS_MEASURED_ADHESIVE_UNQUALIFIED','source_sha256':{f'case-{n}.step':hashlib.sha256((w/f'case-{n}.step').read_bytes()).hexdigest() for n in sh},'horizontal_mating_lands':rows,'nominal_contact_area_mm2':sum(x['projected_overlap_area_mm2'] for x in rows if abs(x['nominal_gap_mm'])<1e-6),'limits':['Only horizontal face pairs with0..0.15mm gap; not vertical lap area or total glue wetting area','Nominal zero-gap contact does not reserve a finite adhesive film','Adhesive type, PETG preparation, curing, creep, bond strength and battery compatibility unqualified','Separating lid to add film changes case height and board-stop clearance; cannot treat existing fit checks as unchanged'],'geometry_changed':False,'physical_release_allowed':False}
(w/'joint-land-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r))
