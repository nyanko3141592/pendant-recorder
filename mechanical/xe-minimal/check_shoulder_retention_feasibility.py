"""Necessary width conditions for symmetric body-shoulder retention."""
from pathlib import Path
from decimal import Decimal as D
import json,hashlib
O=Path(__file__).resolve().parent
files=['film-sensor-minimum-width-retention-review.json','build_sensor_clearance_trial.py','explore_sensor_body_bridge.py']
width=json.loads((O/files[0]).read_text())['published_width_mm']
body_half=D(str(width['minimum']))/2
lead_outer=D('.95')+D('.43')
opening=D('4.5');float_max=(opening-D(str(width['minimum'])))/2
rows=[]
for gap in map(D,('.1','.15','.2')):
 inner_min=lead_outer+gap
 rows.append({'insulation_clearance_mm':float(gap),'stop_inner_minimum_mm':float(inner_min),'centered_max_possible_engagement_mm':float(body_half-inner_min),'bilateral_engagement_at_full_bridge_float_mm':float(body_half-float_max-inner_min),'positive_centered_engagement_possible':body_half>inner_min})
r={'status':'CURRENT_200UM_SHOULDER_SCHEME_INFEASIBLE','source_sha256':{f:hashlib.sha256((O/f).read_bytes()).hexdigest() for f in files},'body_minimum_width_mm':float(body_half*2),'provisional_insulated_lead_outer_x_mm':float(lead_outer),'bridge_inner_opening_mm':float(opening),'minimum_body_lateral_float_mm':float(float_max),'cases':rows,'decision':'At current 0.2mm clearance, stop must start at X>=1.58 while minimum body edge is X=1.55 even when centered. Stop resizing or lower-case relief alone cannot solve this configuration.','next_direction':'Separate wire strain relief from sensor-body capture; review a seller-installed carrier or alternate surface-sensor package rather than shrinking insulation clearance to force this stop to pass.','limits':['Necessary planar conditions only, not full mechanical feasibility.','0.1/0.15 scenarios illustrate tradeoff only; neither is adopted or printer-qualified.','Negative bilateral engagement at full lateral float does not prove single-sided escape; it shows both shoulders cannot be guaranteed engaged.','Published minimum width does not establish minimum shoulder length or safe contact force.','No battery or recording requirement changed.']}
(O/'film-sensor-shoulder-feasibility.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps(rows,indent=2))
