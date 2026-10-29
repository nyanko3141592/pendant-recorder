"""Capture-wall envelope screen around hypothetical insulated joints."""
from pathlib import Path
import cadquery as cq,json
O=Path(__file__).resolve().parent
board=cq.importers.importStep(str(O/'film-sensor-depopulated-board-study.step')).val()
battery=cq.importers.importStep(str(O/'offset-pack-assembly-trial.step')).val()
rows=[]
for height in [.55,.65,.8]:
 for wall in [.3,.4]:
  # Independent two cavities. Nominal joint width is height+.1 from earlier budget.
  holders=[]
  for x in [8.1,9.9]:
   width=height+.1; bottom=-2.32
   outer=cq.Workplane('XY').box(width+.2+2*wall,3.2+2*wall,height+.2+2*wall).translate((x,-2,bottom+height/2)).val()
   cavity=cq.Workplane('XY').box(width+.2,3.2,height+.2).translate((x,-2,bottom+height/2)).val()
   # Through passage for wire/sensor lead is intentionally not invented here.
   holders.append(outer.cut(cavity))
  shell=cq.Compound.makeCompound(holders)
  rows.append({'joint_height_mm':height,'wall_mm':wall,'board_overlap_mm3':shell.intersect(board).Volume(),'battery_overlap_mm3':shell.intersect(battery).Volume(),'holders_mutual_overlap_mm3':holders[0].intersect(holders[1]).Volume()})
r={'status':'CAPTURE_SHELL_SPACE_SCREEN_NOT_DESIGNED_RETENTION','rows':rows,'limits':['Closed shells are space budgets only; sensor/wire exit ports, split assembly and separator attachment absent.','Joint heights below0.8mm are unverified alternatives, not assumed achievable.','No interference-free result alone establishes force transfer or electrical insulation.'],'decision':'Existing loose common guide is not axial strain relief; investigate mechanical capture of a qualified joint or change architecture.'}
(O/'film-joint-capture-space-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(rows,indent=2))
