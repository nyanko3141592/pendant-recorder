"""30.8 mm candidate; fixed internals, integral cord isolation, no release."""
from pathlib import Path
import json,hashlib
HERE=Path(__file__).resolve().parent
source=HERE/'build_actual_fit_case_v3.py'
s=source.read_text();s=s.replace('OUT = HERE / "actual-fit-case-v3"','OUT = HERE / "fixed-board-compact-v1"').replace('W = D = 31.4','W = D = 30.8').replace('PLAN_R, EDGE_R = 3.2, 1.2','PLAN_R, EDGE_R = 2.1, 1.2')
s=s.replace('lower = lower.cut(cord_tunnel).clean()','''# Integral sleeve keeps the cord bore isolated from the empty internal cavity.
cord_sleeve = cq.Workplane(cord_plane).circle(1.8).extrude(9.0).val().intersect(outer).intersect(lower_half)
lower = lower.fuse(cord_sleeve).cut(cord_tunnel).clean()
cord_barrier_added_mm3 = lower.Volume() - lower_before_cord.cut(cord_tunnel).Volume()
''')
s=s.replace('"cord_reinforcement_added_inside_cavity_mm3": 0.0,','"cord_barrier_added_inside_cavity_mm3": cord_barrier_added_mm3,\n    "cord_barrier_to_internals_mm3": cord_sleeve.intersect(internals).Volume(),')
s=s.replace('case-v3','case-compact-v1').replace('HW-V1.4-EVT-CASE-V3-WALL-TUNNEL','HW-V1.4-COMPACT-30P8-CORD-BARRIER-CANDIDATE').replace('"cavity_volume_consumed_by_reinforcement_mm3":0.0','"cavity_volume_consumed_by_reinforcement_mm3":cord_barrier_added_mm3,"nominal_isolation_wall_mm":.8')
ns={'__file__':str(source),'__name__':'compact_build'};exec(compile(s,str(source),'exec'),ns)
review=ns['OUT']/'review.json';d=json.loads(review.read_text());d['status']='COMPACT_CAD_CANDIDATE_NOT_RELEASED';d['physical_release_allowed']=False;d['baseline_replaced']=False;d['board_outline_mm']=[27.5,27.5];d['battery_impact_qualified']=False;d['remaining_gates']=['Slice and inspect integral cord sleeve and seam; qualify printed walls and cord isolation.','Define and verify battery retention, swelling clearance, insulation and impact protection without adding customer wiring or loose assembly parts.','Drop/cord fatigue/USB real cable/thermal/assembly physical checks.'];d['source_builder_sha256']=hashlib.sha256(source.read_bytes()).hexdigest();d['checks']['lower_net_material_added_mm3']=-d['checks'].pop('lower_material_removed_by_cord_tunnel_mm3');d['cord']['integral_isolation_sleeve']=True;d['checks']['cord_barrier_no_internal_interference']=abs(d['checks']['cord_barrier_to_internals_mm3'])<1e-8
assert d['checks']['cord_barrier_no_internal_interference']
assert abs(d['checks']['lower_to_internals_mm3'])<1e-8 and abs(d['checks']['upper_to_internals_mm3'])<1e-8
review.write_text(json.dumps(d,indent=2)+'\n')
