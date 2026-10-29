"""Classify battery overlap and test rigid lift; related HH model only."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
files={'sensor':'vendor/ntcaflex/NTCAFLEX05103HH.STEP','battery':'offset-pack-assembly-trial.step','board':'film-integration-integrated-board.step'}
s={k:cq.importers.importStep(str(O/f)).val()for k,f in files.items()}
def bounds(q):
 b=q.BoundingBox();return [b.xmin,b.ymin,b.zmin,b.xmax,b.ymax,b.zmax]
base=s['sensor'].rotate((0,0,0),(1,0,0),90).rotate((0,0,0),(0,0,1),90).translate((12.5,-5,s['battery'].BoundingBox().zmax+.1))
common=base.intersect(s['battery'])
regions=[{'volume_mm3':q.Volume(),'bounds_mm':bounds(q)}for q in common.Solids()]
rows=[]
for dz in (.1,.15,.2,.3):
 q=base.translate((0,0,dz));rows.append({'lift_mm':dz,'head_nominal_gap_to_battery_mm':dz,'battery_overlap_mm3':q.intersect(s['battery']).Volume(),'board_overlap_mm3':q.intersect(s['board']).Volume(),'board_distance_mm':q.distance(s['board'])})
r={'status':'RIGID_LIFT_SCREEN_NOT_ADOPTED','sources_sha256':{f:hashlib.sha256((O/f).read_bytes()).hexdigest()for f in files.values()},'head_center_xy_mm':[12.5,-5],'original_overlap_regions':regions,'cases':rows,'limits':['Related HH nominal STEP only, not maximum GL envelope.','Head gap requires designed thermal interface; air gap is not accepted thermal coupling.','No tolerances, foam load, fastening, tail solder, separator, harness or assembly motion.','Zero distance is contact, not adequate clearance.']}
(O/'ntcaflex-rigid-lift-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
