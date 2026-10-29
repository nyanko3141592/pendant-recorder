"""Continuous conservative box sweep for a straight-wire loading stage."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
files={'closed_holes':'film-axial-stop-relieved-separator-trial.step','bottom_slots':'film-bottom-slot-separator-trial.step'}
shapes={k:cq.importers.importStep(str(O/v)).val()for k,v in files.items()}
wrpath=O/'film-lap-lowered-terminals-review.json';wr=json.loads(wrpath.read_text())
def pose(q):return q.rotate((0,0,0),(0,0,1),-28).translate((7.6,-25.5,0))
rows=[];assembly=cq.Assembly(name='straight_wire_loading_stage')
assembly.add(shapes['bottom_slots'],name='separator')
for i,row in enumerate(wr['rows']):
 # Existing final centerline lengths provide enough wire; straight temporary extension is outside case.
 from wire_geometry import rounded
 _,il=rounded(row['insulated_centerline_mm'],row['insulated_corner_radii_mm'])
 _,bl=rounded(row['bare_centerline_mm'],row['bare_corner_radius_mm'],wire_radius=.075)
 x=[-.9,.9][i];length=il+bl
 sweep=pose(cq.Workplane('XY').box(.31,length,8+.31,centered=(True,False,False)).translate((x,25.5,-1.92-.155-8)).val())
 straight=pose(cq.Solid.makeCylinder(.155,length,cq.Vector(x,25.5,-1.92),cq.Vector(0,1,0)))
 assembly.add(straight,name=f'wire_{i}_straight')
 rows.append({'wire_index':i,'straight_length_mm':length,'checks':{k:{'overlap_mm3':sweep.intersect(s).Volume(),'gap_mm':sweep.distance(s)}for k,s in shapes.items()}})
assembly.export(str(O/'film-straight-wire-stage.step'))
r={'status':'STRAIGHT_WIRE_LOADING_SCREEN_NOT_ASSEMBLY_QUALIFICATION','sources_sha256':{k:hashlib.sha256((O/v).read_bytes()).hexdigest()for k,v in files.items()},'wire_source_sha256':hashlib.sha256(wrpath.read_bytes()).hexdigest(),'rows':rows,'limits':['Conservative .31 mm square contains nominal round wire; no OD tolerance.','Continuous translation from 8 mm below, seller stage without case or PCB.','Wire length includes final stripped PCB segment but is modeled fully insulated at this stage.','Does not establish subsequent forming into final route, gripper access, bend damage or joint strength.','Sensor-side actual insulation remains undefined.']}
(O/'film-straight-wire-stage-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
