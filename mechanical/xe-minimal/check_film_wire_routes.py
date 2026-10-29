"""Nominal wire corridors; sharp centerline corners are NOT bend-qualified routes."""
from pathlib import Path
import json, hashlib, math
import cadquery as cq
O=Path(__file__).resolve().parent
files={'board':'ncu-candidate-integrated-board.step','separator':'film-wide-bridge-separator-trial.step','lower':'wider-right-support-lower-trial.step','upper':'tab-clearance-upper-trial.step','battery':'offset-pack-assembly-trial.step'}
s={k:cq.importers.importStep(str(O/v)).val() for k,v in files.items()}
def tube(points,r):
 solids=[]
 for a,b in zip(points,points[1:]):
  v=cq.Vector(*b)-cq.Vector(*a)
  if v.Length>1e-8: solids.append(cq.Solid.makeCylinder(r,v.Length,cq.Vector(*a),v.normalized()))
 for p in points: solids.append(cq.Solid.makeSphere(r,cq.Vector(*p),angleDegrees1=-90))
 out=solids[0]
 for v in solids[1:]: out=out.fuse(v)
 return out
rows=[];models=[]
# Stop before the solder approach: current TH1 is still present and has not been removed.
for z in [-1.65,-1.4,-1.15]:
 for y in [-.15,-.6,-1.05]:
  paths=[[(8.1,-.5,-1.92),(8.1,y-.7,z),(14.48,y-.7,z),(14.48,-1.055,z)],[(9.9,-.5,-1.92),(9.9,y,z),(16.13,y,z),(16.13,-1.055,z)]]
  wires=[tube(p,.155) for p in paths]; shape=cq.Compound.makeCompound(wires)
  overlaps={k:shape.intersect(v).Volume() for k,v in s.items()}
  row={'horizontal_z_mm':z,'lane_y_mm':y,'paths_mm':paths,'lengths_mm':[sum(math.dist(a,b) for a,b in zip(p,p[1:])) for p in paths],'overlap_mm3':overlaps,'wire_to_wire_overlap_mm3':wires[0].intersect(wires[1]).Volume()}
  rows.append(row);models.append(shape)
rank=min(range(len(rows)),key=lambda i:sum(rows[i]['overlap_mm3'].values())+rows[i]['wire_to_wire_overlap_mm3'])
a=cq.Assembly(name='film_wire_corridor_screen');a.add(s['board'],name='existing_board',color=cq.Color('#328866'));a.add(s['separator'],name='separator',color=cq.Color('#ddbb55'));a.add(models[rank],name='wire_corridors',color=cq.Color('#bb44aa'));a.export(str(O/'film-wire-route-study.step'))
r={'status':'PARTIAL_WIRE_CORRIDOR_SCREEN_NOT_ASSEMBLY_READY','diameter_mm':.31,'sources_sha256':{k:hashlib.sha256((O/v).read_bytes()).hexdigest() for k,v in files.items()},'rows':rows,'displayed_row':rank,'limits':['Only nominal straight corridors and spherical corner envelopes; real bend radius not qualified.','Endpoints stop below pads; vertical solder approach and NCU removal not designed.','No strain relief, wire tolerance, placement tolerance, insulation wrap or service slack.','Starting points assumed within the previous joint budget.','Zero overlap alone does not prove assembly or clearance.']}
(O/'film-wire-route-review.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps({'displayed_row':rank,'rows':[{k:v for k,v in row.items() if k!='paths_mm'} for row in rows]},indent=2))
