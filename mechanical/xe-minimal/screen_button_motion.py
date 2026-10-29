"""Sample loose-plunger travel; switch compression is not represented in rigid STEP."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
button=cq.importers.importStep(str(O/'button-accessible-plunger-trial.step')).val()
case=cq.importers.importStep(str(O/'button-accessible-upper-case-trial.step')).val()
board=cq.importers.importStep(str(O/'tmux-candidate-integrated-board.step')).val()
x,y=15.725,-5.975
# Classify central actuator contact separately. Do not delete obstacles from the CAD.
zone=cq.Workplane('XY').circle(.9).extrude(2).translate((x,y,.8264)).val()
rows=[]
for i in range(16):
 travel=i*.05;moved=button.translate((0,0,-travel));hit=moved.intersect(board)
 rows.append({'travel_mm':round(travel,3),'case_intersection_mm3':moved.intersect(case).Volume(),'rigid_board_intersection_mm3':hit.Volume(),'intersection_outside_actuator_screen_mm3':(hit.cut(zone).Volume() if hit.Volume()>1e-10 else 0.0)})
r={'status':'SAMPLED_MOTION_SCREEN_NOT_FORCE_OR_OVERTRAVEL_QUALIFICATION','sources':{n:hashlib.sha256((O/n).read_bytes()).hexdigest() for n in ['button-accessible-plunger-trial.step','button-accessible-upper-case-trial.step','tmux-candidate-integrated-board.step']},'samples':rows,'actuator_screen':{'center_step_xy_mm':[x,y],'radius_mm':.9,'z_mm':[.8264,2.8264],'qualification':'Region of expected switch contact, not permission for rigid penetration'},'max_case_intersection_mm3':max(a['case_intersection_mm3'] for a in rows),'max_non_actuator_intersection_mm3':max(a['intersection_outside_actuator_screen_mm3'] for a in rows),'limitations':['Rigid switch model cannot simulate its travel, return force or allowable compression','Sampled positions are not a continuous swept-solid proof','No solder, case or plunger tolerance expansion','Return spring and hard stop remain undesigned','Do not infer safe0.75mm switch compression from total pusher travel']}
(O/'button-motion-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps({k:v for k,v in r.items() if k!='sources'},indent=2))
