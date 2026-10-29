"""Sensitivity analysis, not supplier tolerance qualification."""
from pathlib import Path
import json,itertools
O=Path(__file__).resolve().parent
source=json.loads((O/'recessed-screw-joint-review.json').read_text())
n=source['nominal_dimensions_mm'];rows=[]
# Independent errors are scenarios. They are NOT attributed to screw or printer.
for case_error,screw_error in [(0,0),(.05,.05),(.1,.1),(.15,.1),(.2,.15)]:
 results=[]
 for a,b,c in itertools.product([-1,1],repeat=3):
  seat=n['seat_z']+a*case_error;top=n['nut_top_z']+b*case_error
  length=n['screw_length']+c*screw_error;bottom=top-.8;tip=seat-length
  overlap=max(0,min(seat,top)-max(tip,bottom))
  results.append({'overlap':overlap,'tip_beyond_nut':bottom-tip})
 rows.append({'independent_seat_and_nut_position_error_mm':case_error,'screw_length_error_mm':screw_error,'minimum_geometric_overlap_mm':min(v['overlap']for v in results),'minimum_geometric_turns_at_pitch_025':min(v['overlap']for v in results)/.25,'maximum_tip_projection_mm':max(v['tip_beyond_nut']for v in results)})
r={'status':'SENSITIVITY_ONLY_NOT_TOLERANCE_APPROVAL','source':'recessed-screw-joint-review.json','scenarios':rows,'excluded':['Nut thickness tolerance','Thread chamfer/runout; geometric turns overestimate full-thread engagement','Screw head seating deformation','Thermal creep and tightening preload'],'necessary_condition_for_full_nominal_nut_thickness':'Sum of seat-to-nut position increase and screw length shortfall <=0.1mm nominal tip allowance','decision':'Do not release current joint from nominal overlap alone; specify real tolerances or increase engagement allowance and recheck clearance.'}
(O/'screw-tolerance-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
