"""Screen body-shoulder axial stops; maximum sensor envelope is not retention proof."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
files={'separator':'film-sensor-body-bridge-separator-trial.step','lower':'film-sensor-clearance-200um-lower-trial.step','board':'film-integration-integrated-board.step','battery':'offset-pack-assembly-trial.step','insulation':'film-sensor-insulation-transition.step'}
s={k:cq.importers.importStep(str(O/f)).val() for k,f in files.items()}
def pose(a):return a.rotate((0,0,0),(0,0,1),-28).translate((7.6,-25.5,0))
def box(x,y,z,dx,dy,dz):return cq.Workplane('XY').box(dx,dy,dz,centered=False).translate((x,y,z)).val()
rows=[]
for inner in (1.55,1.65,1.75):
 for bottom in (-2.32,-2.22):
  stops=pose(box(inner,22.2,bottom,.8,.8,-1.02-bottom).fuse(box(-inner-.8,22.2,bottom,.8,.8,-1.02-bottom)))
  assembled=s['separator'].fuse(stops).clean()
  checks={k:{'gap_mm':stops.distance(v),'overlap_mm3':stops.intersect(v).Volume()}for k,v in s.items()if k!='separator'}
  rows.append({'inner_x_mm':inner,'bottom_z_mm':bottom,'valid':assembled.isValid(),'solid_count':len(assembled.Solids()),'checks':checks,'nominal_max_body_shoulder_overlap_width_mm':2.05-inner})
r={'status':'AXIAL_SHOULDER_STOP_SPACE_SCREEN_NOT_ADOPTED','sources_sha256':{f:hashlib.sha256((O/f).read_bytes()).hexdigest() for f in files.values()},'candidates':rows,'limits':['4.1mm body width is maximum envelope; minimum sealed body width and shoulder profile not established.','Stops need a qualified non-sensitive contact region; sensor lead roots must not carry assembly load.','Opposite end stop, insertion path, tolerances, thermal contact and printed strength unresolved.']}
(O/'film-sensor-shoulder-stop-space-review.json').write_text(json.dumps(r,indent=2)+'\n')
for row in rows:print(row['inner_x_mm'],row['bottom_z_mm'],'solids',row['solid_count'],{k:round(v['overlap_mm3'],5)for k,v in row['checks'].items()})
