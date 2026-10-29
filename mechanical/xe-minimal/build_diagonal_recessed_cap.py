"""Recessed retention cap with explicit hypothetical glue thickness."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
files={'lower':'diagonal-tapered-tray-lower-trial.step','cap':'diagonal-joint-cap-trial.step','board':'film-sensor-depopulated-board-study.step'}
cap_review=json.loads((O/'diagonal-joint-cap-review.json').read_text())
assert cap_review['rows'][cap_review['selected_row']]['local_y_start_mm']==22.8, 'Recess must track selected cap location'
s={k:cq.importers.importStep(str(O/v)).val() for k,v in files.items()}
cut=cq.Workplane('XY').box(3.9,1.4,.3,centered=(True,False,False)).translate((0,22.7,-1.32)).val().rotate((0,0,0),(0,0,1),-28).translate((7.6,-25.5,0))
lower=s['lower'].cut(cut).clean();rows=[]
for glue in [0,.05,.1]:
 cap=s['cap'].translate((0,0,-.2+glue))
 rows.append({'glue_thickness_hypothesis_mm':glue,'cap_board_overlap_mm3':cap.intersect(s['board']).Volume(),'cap_board_gap_mm':cap.distance(s['board']),'cap_lower_overlap_mm3':cap.intersect(lower).Volume(),'cap_lower_gap_mm':cap.distance(lower),'nominal_joint_top_gap_mm':.2+glue})
cq.exporters.export(lower,str(O/'diagonal-recessed-cap-lower-trial.step'))
cq.exporters.export(s['cap'].translate((0,0,-.2)),str(O/'diagonal-recessed-joint-cap-trial.step'))
r={'status':'RECESSED_CAP_TRIAL_NOT_ADOPTED','source_sha256':{k:hashlib.sha256((O/v).read_bytes()).hexdigest() for k,v in files.items()},'lower_valid':lower.isValid(),'lower_solid_count':len(lower.Solids()),'recess_depth_mm':.2,'cut_local_y_range_mm':[22.7,24.1],'rows':rows,'limits':['Glue values are hypotheses; no adhesive or application process selected.','Cap is not axial strain relief.','Joint clearance calculated from nominal envelope, not an actual assembled joint.','Source cap must be the selected local-y22.8 candidate; full assembly and insertion still require recheck.','Retention load, print fit and tool access unqualified.']}
(O/'diagonal-recessed-cap-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
