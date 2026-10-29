"""Screen raised diagonal ribs with two supported feet, nominal CAD only."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
files={'separator':'diagonal-film-separator-trial.step','board':'film-sensor-depopulated-board-study.step','lower':'diagonal-film-lower-trial.step','upper':'tab-clearance-upper-trial.step','battery':'offset-pack-assembly-trial.step'}
s={k:cq.importers.importStep(str(O/v)).val() for k,v in files.items()}
def box(x,y,z,dx,dy,dz):return cq.Workplane('XY').box(dx,dy,dz,centered=(False,False,False)).translate((x,y,z)).val()
def pose(q):return q.rotate((0,0,0),(0,0,1),-28).translate((7.6,-25.5,0))
film=pose(box(-2.05,0,-2.32,4.1,22,.5))
rows=[];ribs={}
for y in range(2,21,2):
 feet=[pose(box(x,y-1.2,-2.22,.6,2.4,.8)) for x in [-2.95,2.35]]
 roof=pose(box(-2.95,y-1.2,-1.52,5.9,2.4,.4))
 rib=roof.fuse(*feet).clean();ribs[y]=rib
 overlaps={k:rib.intersect(v).Volume() for k,v in s.items() if k!='separator'}
 bearing=[f.intersect(s['separator']).Volume() for f in feet]
 rows.append({'local_y_mm':y,'overlap_mm3':overlaps,'film_overlap_mm3':rib.intersect(film).Volume(),'foot_join_volume_mm3':bearing,'accepted_for_trial':max(overlaps.values())<1e-8 and rib.intersect(film).Volume()<1e-8 and min(bearing)>.1})
safe=[r['local_y_mm'] for r in rows if r['accepted_for_trial']]
selected=([safe[0],safe[-1]] if len(safe)>1 else safe)
new=s['separator']
for y in selected:new=new.fuse(ribs[y])
new=new.clean()
assert new.isValid() and len(new.Solids())==1
cq.exporters.export(new,str(O/'diagonal-bridge-separator-trial.step'))
cq.exporters.export(new,str(O/'diagonal-bridge-separator-trial.stl'),tolerance=.01,angularTolerance=.1)
r={'status':'DIAGONAL_BRIDGE_TRIAL_NOT_ADOPTED','source_sha256':{k:hashlib.sha256((O/v).read_bytes()).hexdigest() for k,v in files.items()},'rows':rows,'selected_local_y_mm':selected,'solid_count':len(new.Solids()),'added_volume_mm3':new.Volume()-s['separator'].Volume(),'bridge_span_mm':4.7,'roof_thickness_mm':.4,'roof_width_mm':2.4,'sensor_roof_gap_mm':.3,'limits':['Foot intersection is geometric attachment, not load qualification.','No slice or print verification yet.','Sensor body envelope only; terminals and wiring must be checked in integrated model.','No clamping or pressing of sensor approved.','Assembly path and PLA stiffness/creep remain unverified.']}
(O/'diagonal-bridge-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
