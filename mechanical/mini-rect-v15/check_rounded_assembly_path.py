"""Sample rigid pack insertion before PCB; harness and tilt are not modeled."""
from pathlib import Path
import json,hashlib
import cadquery as cq
P=Path(__file__).resolve().parent
cad=Path('/Users/takahashinaoki/Downloads/Pendant-v15-XE-rounded-lanyard/body-NOT-MANUFACTURING.step')
body=cq.importers.importStep(str(cad)).val()
def pack(dx,dz):
 return cq.Workplane('XY').box(15.5,27,4.2).val().translate((1.3+7.75+dx,1.3+13.5,1.5+2.1+dz))
def check(name,states):
 hits=[]
 for dx,dz in states:
  v=pack(dx,dz).intersect(body).Volume()
  if v>1e-6:hits.append(dict(dx_mm=dx,dz_mm=dz,overlap_mm3=v))
 return dict(name=name,samples=len(states),collisions=hits)
vertical=[(0,n*.5) for n in range(29)]
# Final datum packZ1.5. Lift1.25 => bottom2.75/top6.95, between
# battery guide top2.7 and lower ledge underside7.0 (only0.05 each).
offset_descent=[(3.5,1.25+n*.25) for n in range(53)]
slide=[(n*.1,1.25) for n in range(36)]
seat=[(0,n*.05) for n in range(26)]
r=dict(status='TWO_SAMPLED_PACK_INSERTION_PATHS_REJECTED',body_step_sha256=hashlib.sha256(cad.read_bytes()).hexdigest(),pack_maximum_mm=[15.5,27,4.2],paths=[check('straight_vertical',vertical),check('offset_descent_then_slide_and_seat',offset_descent+slide+seat)],nominal_slide_bottom_clearance_mm=.05,nominal_slide_top_clearance_mm=.05,limitations=['Sampled positions, not continuous swept-volume proof.','Unwired rectangular pack only; wire exit, bend, plug and actual pack flexibility excluded.','PCB and thermal contact material must be absent during modeled pack insertion.','0.05mm nominal passage clearances are below assumed print errors; even zero sampled collisions is not a usable assembly clearance.'],next_action='Both sampled insertion paths collide. Redesign ledge access (including rear support) or establish a qualified tilted path; lowering the battery guide alone does not remove the descent collision. No current case adoption.',release_allowed=False)
(P/'rounded-assembly-path-review.json').write_text(json.dumps(r,indent=2)+'\n')
for row in r['paths']:print(row['name'],row['samples'],'positions',len(row['collisions']),'collisions')
