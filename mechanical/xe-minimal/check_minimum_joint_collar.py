"""Rigid minimum-collar size screen against slot stop; no strength assertion."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
p=O/'film-roomier-joint-separator-trial.step';s=cq.importers.importStep(str(p)).val()
def pose(q):return q.rotate((0,0,0),(0,0,1),-28).translate((7.6,-25.5,0))
rows=[]
# The outgoing side of a 0.6 mm-long local collar is at Y26.0, stop begins Y26.1.
for width,height in [(.3,.3),(.4,.4),(.5,.5),(.6,.5),(.7,.6),(.75,.65),(.8,.7)]:
 for x in [-.9,.9]:
  for dz in [0,-.1,.1]:
   for yaw in [0,-15,15]:
    q=cq.Workplane('XY').box(width,.6,height).val().rotate((0,0,0),(0,0,1),yaw).translate((x,25.7,-1.92+dz))
    collisions=[]
    for dy in [0,.1,.2,.3,.4]:
     collisions.append(pose(q.translate((0,dy,0))).intersect(s).Volume())
    rows.append({'width_mm':width,'height_mm':height,'x_mm':x,'z_offset_mm':dz,'yaw_deg':yaw,'overlap_at_y_displacements_0_01_02_03_04_mm3':collisions})
r={'status':'MINIMUM_COLLAR_SCREEN_NOT_RETENTION_QUALIFICATION','source_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'collar_axial_length_mm':.6,'rows':rows,'limits':['Proposed minimum solid rectangular collar dimensions, not actual tape/solder geometry.','Only specified rigid translations and yaw samples; no complete escape path proof.','Tape compressibility, peeling, PLA deflection, friction and load not modeled.','Lower pocket not included; this isolates slot-stop interception.']}
summary=[]
for wh in sorted(set((r['width_mm'],r['height_mm'])for r in rows)):
 group=[r for r in rows if (r['width_mm'],r['height_mm'])==wh]
 summary.append({'size_mm':wh,'cases':len(group),'cases_without_contact_by_04_mm':sum(max(r['overlap_at_y_displacements_0_01_02_03_04_mm3'])<1e-8 for r in group),'initial_interference_cases':sum(r['overlap_at_y_displacements_0_01_02_03_04_mm3'][0]>1e-8 for r in group)})
r['summary']=summary
(O/'film-minimum-collar-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(summary,indent=2))
