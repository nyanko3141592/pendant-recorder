"""Compare two pack orientations without asserting a complete assembly fit."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent;f=O/'pcb-partial-with-body-envelopes.step';s=cq.importers.importStep(str(f)).val();assert s.isValid();bb=[x.BoundingBox() for x in s.Solids()];rows=[]
bounds=[min(x.xmin for x in bb),max(x.xmax for x in bb),min(x.ymin for x in bb),max(x.ymax for x in bb),min(x.zmin for x in bb),max(x.zmax for x in bb)]
for angle,w,h in [(0,15.5,27),(90,27,15.5)]:
 for ix in range(-6,19):
  x=ix*.5
  for iy in range(-6,24):
   y=-27+iy*.5
   hits=[b for b in bb if b.xmax>x and b.xmin<x+w and b.ymax>y and b.ymin<y+h]
   if not hits:continue
   for side in ['F','B']:
    z0=max(b.zmax for b in hits)+.2 if side=='F' else min(b.zmin for b in hits)-.2-4.2
    size=[max(bounds[1],x+w)-min(bounds[0],x),max(bounds[3],y+h)-min(bounds[2],y),max(bounds[5],z0+4.2)-min(bounds[4],z0)]
    rows.append(dict(angle_deg=angle,side=side,pack_min_mm=[x,y,z0],union_size_mm=size,volume_mm3=size[0]*size[1]*size[2]))
rows.sort(key=lambda r:r['volume_mm3']);best={str(a):[r for r in rows if r['angle_deg']==a][:8] for a in [0,90]}
r={'status':'ORIENTATION_SCREEN_NOT_CASE_FIT','source_sha256':hashlib.sha256(f.read_bytes()).hexdigest(),'candidate_count':len(rows),'grid_mm':.5,'best_by_volume_per_orientation':best,'limitations':['No case, leads, mating housing, insulation, retention, assembly access or swelling allowance.','0.2mm clearance and package envelopes are provisional.','Grid search is not proof of global minimum.','Battery exit direction and polarity accessibility not screened.']};(O/'pack-orientation-screen.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps({k:v[0] for k,v in best.items()},indent=2))
