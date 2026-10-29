"""Exact translational box envelopes for cap insertion in selected directions."""
from pathlib import Path
import cadquery as cq,json,hashlib
from wire_geometry import rounded
O=Path(__file__).resolve().parent
files={'lower':'diagonal-recessed-cap-lower-trial.step','board':'film-sensor-depopulated-board-study.step','separator':'diagonal-bridge-separator-trial.step','battery':'offset-pack-assembly-trial.step'}
s={k:cq.importers.importStep(str(O/v)).val() for k,v in files.items()}
def box(x,y,z,dx,dy,dz):return cq.Workplane('XY').box(dx,dy,dz,centered=(False,False,False)).translate((x,y,z)).val()
def pose(q):return q.rotate((0,0,0),(0,0,1),-28).translate((7.6,-25.5,0))
rpath=O/'diagonal-wire-offset-overpass-review.json';r=json.loads(rpath.read_text());v=r['rows'][r['selected_row']]
s['wires']=cq.Compound.makeCompound([rounded(p,rad)[0] for p,rad in zip(v['paths_mm'],v['radii_mm'])])
s['sensor']=pose(box(-2.05,0,-2.32,4.1,22,.5))
s['joints']=cq.Compound.makeCompound([pose(box(x-.45,23,-2.32,.9,3,.8)) for x in [-.9,.9]])
# Cap bottom -1.27 includes hypothetical glue thickness 0.05 above recess floor.
envelopes={'above_8mm':box(-1.85,22.8,-1.27,3.7,1.2,8.4),'local_positive_y_8mm':box(-1.85,22.8,-1.27,3.7,9.2,.4),'local_negative_y_8mm':box(-1.85,14.8,-1.27,3.7,9.2,.4),'local_positive_x_8mm':box(-1.85,22.8,-1.27,11.7,1.2,.4),'local_negative_x_8mm':box(-9.85,22.8,-1.27,11.7,1.2,.4)}
rows=[]
for name,local in envelopes.items():
 q=pose(local);checks={k:q.intersect(o).Volume() for k,o in s.items()}
 rows.append({'direction':name,'swept_overlap_mm3':checks,'nominal_clear':max(checks.values())<1e-8})
out={'status':'CAP_INSERTION_DIRECTION_SCREEN_NOT_ADOPTED','sources_sha256':{k:hashlib.sha256((O/v).read_bytes()).hexdigest() for k,v in files.items()},'route_sha256':hashlib.sha256(rpath.read_bytes()).hexdigest(),'rows':rows,'limits':['Only five straight translations checked, not arbitrary rotations or deforming paths.','No gripping tool or adhesive dispensing access included.','A collision rejects that insertion direction only.','Upper lid excluded, board/other parts fixed in final position.']}
(O/'diagonal-cap-insertion-review.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(rows,indent=2))
