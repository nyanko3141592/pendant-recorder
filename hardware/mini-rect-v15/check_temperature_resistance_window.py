"""Translate existing circuit sensitivity into resistance-domain acceptance criteria.
No R(T) approximation is used here; comparator error allowances remain conditional.
"""
from pathlib import Path
import hashlib,json
P=Path(__file__).resolve().parent
src=P/'input-control-pa2-pb5/ncu-temperature-screen.json'
r=json.loads(src.read_text())
design=Path(r['source_design'])
assert hashlib.sha256(design.read_bytes()).hexdigest()==r['source_sha256']
cold_min,cold_max=r['corners']['cold']['resistance_ohms']
hot_min,hot_max=r['corners']['hot']['resistance_ohms']
assert 0<hot_min<hot_max<cold_min<cold_max
# Off below hot_min and above cold_max in every modeled circuit corner;
# permit strictly inside hot_max..cold_min. Equality is deliberately excluded.
r25=[9900,10100]
assert hot_max<r25[0]<=r25[1]<cold_min
out=dict(status='CONDITIONAL_RESISTANCE_WINDOW_NOT_THERMAL_QUALIFICATION',source_sha256={str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in [src,design,Path(__file__)]},charge_permission_in_all_modeled_corners_ohm=dict(lower_exclusive=hot_max,upper_exclusive=cold_min),charge_inhibited_in_all_modeled_corners_ohm=dict(below_exclusive=hot_min,above_exclusive=cold_max),transition_uncertainty_bands_ohm=[[hot_min,hot_max],[cold_min,cold_max]],candidate_25C_ohm=r25,candidate_25C_within_permission_window=True,manufacturer_data_needed=[dict(condition='Cold endpoint',temperature_C=0,required='Guaranteed minimum sensor resistance greater than cold inhibit boundary',boundary_ohm=cold_max,received=False),dict(condition='Hot endpoint',temperature_C=45,required='Guaranteed maximum sensor resistance less than hot inhibit boundary',boundary_ohm=hot_min,received=False)],limitations=['All boundaries inherit the original4.75..5.25V,1% resistor and33mV comparator-error assumptions. This is not a guarantee at actual common-mode, input bias or leakage.','Endpoint criteria apply to sensor temperature only and require monotonic NTC behavior over the applicable range. They do not establish cell temperature or thermal lag margin.','Equality and uncertainty bands must not be called pass; hysteresis direction and actual comparator behavior require validation.','Full R-T information remains useful to establish the actual charge window and thermal margin; endpoint criteria prioritize missing supplier evidence rather than waive qualification.','No component substitution, schematic change or charging enablement.'],release_allowed=False)
(P/'input-control-pa2-pb5/temperature-resistance-window.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({k:out[k] for k in ['charge_permission_in_all_modeled_corners_ohm','charge_inhibited_in_all_modeled_corners_ohm','candidate_25C_within_permission_window']},indent=2))
