"""Vertical endpoint access screen, not bend or solder-process qualification."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
files={'board':'film-sensor-depopulated-board-study.step','separator':'film-wide-bridge-separator-trial.step','lower':'wider-right-support-lower-trial.step','upper':'tab-clearance-upper-trial.step'}
s={k:cq.importers.importStep(str(O/v)).val() for k,v in files.items()};rows=[]
for x,net in [(14.48,'GND'),(16.13,'BAT_TS')]:
 corridor=cq.Solid.makeCylinder(.155,1.25,cq.Vector(x,-1.055,-1.45))
 rows.append({'pad_center_mm':[x,-1.055],'net':net,'insulated_corridor_z_mm':[-1.45,-.2],'overlap_mm3':{k:corridor.intersect(v).Volume() for k,v in s.items()},'board_clearance_mm':corridor.distance(s['board'])})
r={'status':'VERTICAL_ACCESS_SCREEN_NOT_CONNECTED_ROUTE','sources_sha256':{k:hashlib.sha256((O/v).read_bytes()).hexdigest() for k,v in files.items()},'rows':rows,'limits':['Vertical cylinders omit bend transition from horizontal wire; do not combine as completed wire.','Last0.2mm to copper and solder joint not modeled.','Pad net mapping from existing TH1; independent PCB verification needed before electrical change.']}
(O/'film-pad-approach-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(rows,indent=2))
