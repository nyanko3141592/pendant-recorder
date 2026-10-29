"""Dimensional feasibility screen of lap-solder plus independent tape wrap."""
from pathlib import Path
import json,hashlib
O=Path(__file__).resolve().parent
source=O.parent.parent/'docs/procurement/xe-film-sensor-joining-materials.json'
r=json.loads(source.read_text());rows=[]
# Tape nominal sensitivity only; none of these are certified maximum supplied thicknesses.
for tape in [.06985,.076,.08]:
 for lead in [.17,.5]:
  raw_width=.7;conductor=.15
  # Put seam on broad face: two layers across width, three across height.
  width=raw_width+2*tape;height=lead+conductor+3*tape
  rows.append({'tape_thickness_assumption_mm':tape,'lead_thickness_assumption_mm':lead,'lead_thickness_basis':'drawing reference only' if lead==.17 else 'existing conservative envelope, not certified lead thickness','bare_conductor_nominal_diameter_mm':conductor,'raw_lead_width_assumption_mm':raw_width,'wrapped_width_before_solder_mm':width,'wrapped_height_before_solder_mm':height,'remaining_width_to_0p9_mm':.9-width,'remaining_height_to_0p8_mm':.8-height,'maximum_lead_thickness_with_zero_solder_allowance_mm':.8-conductor-3*tape,'fits_before_solder_and_tolerance':width<=.9 and height<=.8})
out={'status':'LAP_WRAP_BUDGET_UNRESOLVED_NOT_QUALIFIED','source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'existing_finished_joint_budget_mm':[.9,3,.8],'rows':rows,'findings':['The .5 mm conservative lead envelope plus .15 mm conductor and tape exceeds .8 mm height even before solder.','The .17 mm reference lead thickness yields nominal room but cannot be used as a guaranteed maximum.','At .08 mm tape, width headroom is .04 mm total before solder, wrinkles and tolerances.','Current max joint box must not be treated as a realized insulated joint or as evidence of axial retention.'],'next_decision':['Derive controlled finished-joint acceptance dimensions and feasible process from actual supplied parts, or enlarge/reconfigure joint region.','Do not increase final case size or relax battery/runtime requirements without consultation.'],'limits':['No material maximum tolerances, solder fillet or insulation overlap adhesion qualified.','This is one lap-wrap construction, not proof that every insulation construction is impossible.']}
(O/'film-joint-wrap-budget-review.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out['findings'],indent=2))
