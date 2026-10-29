"""Locate exact nominal intersections without guessing component identity."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
sensorpath=O/'vendor/ntcaflex/NTCAFLEX05103HH.STEP'
sensor=cq.importers.importStep(str(sensorpath)).val().rotate((0,0,0),(1,0,0),90).rotate((0,0,0),(0,0,1),180).translate((5,-15,-2.32))
def bounds(q):
 b=q.BoundingBox();return [b.xmin,b.ymin,b.zmin,b.xmax,b.ymax,b.zmax]
inv=json.loads((O/'film-integration-board-inventory.json').read_text())
rows=[]
for kind,filename in [('board','film-integration-integrated-board.step'),('lower','film-sensor-clearance-200um-lower-trial.step')]:
 p=O/filename;s=cq.importers.importStep(str(p)).val()
 for i,solid in enumerate(s.Solids()):
  common=sensor.intersect(solid)
  if common.Volume()<1e-8:continue
  for hit in common.Solids():
   center=hit.Center();near=sorted(inv['parts'],key=lambda q:(q['position_mm'][0]-center.x)**2+(-q['position_mm'][1]-center.y)**2)[:3] if kind=='board' else []
   rows.append({'part':kind,'source_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'solid_index':i,'solid_bounds_mm':bounds(solid),'overlap_bounds_mm':bounds(hit),'overlap_mm3':hit.Volume(),'nearby_refs_not_identity':[q['ref'] for q in near]})
r={'status':'NOMINAL_INTERFERENCE_LOCALIZATION','sensor_sha256':hashlib.sha256(sensorpath.read_bytes()).hexdigest(),'head_xy_mm':[5,-15],'regions':rows,'limits':['Nearest footprint is not proof of solid identity.','No source geometry changed; candidate remains rejected.','Related HH model and generic component envelopes are not maximum GL assembly.']}
(O/'ntcaflex-interference-localization.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(rows,indent=2))
