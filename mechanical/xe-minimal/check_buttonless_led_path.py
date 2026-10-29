"""Probe optical paths in current study geometry; not a photometric qualification."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
inv=json.loads((O/'buttonless-candidate-board-inventory.json').read_text())
led=next(p for p in inv['parts'] if p['ref']=='D6')
x,y=led['position_mm'];y=-y
assert led['side']=='B'
files={'separator':'battery-separator-study.step','battery':'dtp401525-xe-pack-max.step','lower_case':'closure-acoustic-slim-lower-case-trial.step','upper_case':'clearance-hook-upper-trial.step','board':'buttonless-candidate-integrated-board.step'}
shapes={k:cq.importers.importStep(str(O/v)).val() for k,v in files.items()}
# Same pack pose as current assembly studies; assert source extent convention.
pack=shapes['battery'];assert abs(pack.BoundingBox().zmin)<1e-6
shapes['battery']=pack.translate((8.25,-13.5,-6.62))
beam=cq.Workplane('XY').center(x,y).circle(.25).extrude(-9).val()
checks={k:beam.intersect(shapes[k]).Volume() for k in ['separator','battery','lower_case']}
# Opening the case alone cannot expose an LED facing the battery.
assert checks['battery']>0 and checks['separator']>0
out={'status':'BOTTOM_LED_DIRECT_VIEW_BLOCKED','pcb_sha256':inv['pcb_sha256'],'led_ref':'D6','led_side':led['side'],'led_center_step_mm':[x,y,0],'battery_translation_mm':[8.25,-13.5,-6.62],'probe_diameter_mm':.5,'probe_z_mm':[-9,0],'intersection_mm3':checks,'sources':{f:hashlib.sha256((O/f).read_bytes()).hexdigest() for f in files.values()},'required_action':'Relocate LED to top side or design and qualify a light guide; a lower-case viewing hole alone is insufficient.','limitations':['Probe represents a direct optical corridor, not the LED angular emission or brightness.','Battery pose follows current study; original leads and plug remain absent.','No PCB/case change or part selection made by this check.']}
(O/'buttonless-led-path-review.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out,indent=2))
