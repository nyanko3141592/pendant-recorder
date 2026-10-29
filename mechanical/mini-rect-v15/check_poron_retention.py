"""Screen a thicker pad; no CAD adoption or force extrapolation."""
from pathlib import Path
import json, itertools, hashlib
P=Path(__file__).resolve().parent
src=P/'retention-fit-review.json'
r=json.loads(src.read_text()); a=r['retention']
rows=[]
for thickness, gap in [(1.57,1.0),(2.36,1.5),(3.18,2.05)]:
 values=[]
 for pcb,post_error,ledge_error,pad_factor in itertools.product([.8,.93],[-.2,.2],[-.2,.2],[.9,1.1]):
  actual_gap=gap+.8-pcb+post_error-ledge_error
  values.append(1-actual_gap/(thickness*pad_factor))
 rows.append(dict(nominal_pad_mm=thickness,nominal_gap_mm=gap,post_tip_Z_mm=r['board_origin_case_mm'][2]+.8+gap,compression_min=min(values),compression_max=max(values),pad_thickness_tolerance_fraction=.1))
out=dict(status='THICKER_PORON_RETENTION_SENSITIVITY_NOT_ADOPTED',source_sha256=hashlib.sha256(src.read_bytes()).hexdigest(),material_family='Rogers PORON 4701-30-20, unsupported',source='https://rogerscorp.com/-/media/project/rogerscorp/documents/elastomeric-material-solutions/poron/english/data-sheets/17-006-poron-4701-30-very-soft.pdf',observed_date='2026-10-26',published_thickness_range_mm=[1.57,3.18],published_thickness_tolerance_fraction=.1,published_CFD_at_25_percent_kPa=[21,55],published_typical_CFD_at_25_percent_kPa=35,pad_area_each_mm2=4,pad_count=3,derived_force_at_25_percent_each_N=[.084,.22],derived_force_at_25_percent_total_N=[.252,.66],cases=rows,limitations=['Nominal pad thicknesses are screening choices within the family range, not verified stocked orderable SKUs.','Independent printed feature errors +/-0.2mm are sensitivity assumptions, not supplier feature guarantees.','No permitted compression range established; positive compression alone does not prove retention.','25% CFD data cannot bound force at other compression values; full force curve and small pad geometry validation needed.','Tall 2x2mm pad may buckle, bulge or shift; adhesive thickness and lateral keepout not included.','PCB lower thickness, lid seating, compression set, R37 clearance and tape retention unresolved.','No CAD regeneration or material adoption from this calculation.'],next_action='Source stocked thickness and force/deflection curve; validate lateral restraint and local keepout before regenerating a thicker-pad CAD candidate.',release_allowed=False)
assert .14 < rows[-1]['compression_min'] < .15
assert .56 < rows[-1]['compression_max'] < .57
(P/'poron-retention-review.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(rows,indent=2))
