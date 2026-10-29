"""Compare current geometry to recorded vendor target; no impedance certification."""
from pathlib import Path
import json,hashlib
O=Path(__file__).resolve().parent;R=O.parents[2];D=O/'material-dk-trial'
files=[D/'usb-geometry-review.json',D/'usb-continuous-reference-review.json',R/'hardware/mini-rect-v13/jlc-six-layer-usb-impedance.json',O/'current-stackup-source-review.json',D/'review.json']
g,coverage,calc,stack,meta=[json.loads(p.read_text())for p in files]
assert g['pcb_sha256']==meta['output_pcb_sha256']==coverage['source_sha256']['material-dk-trial']
assert calc['input']['stackup']==stack['interactive_selection']['stackup']
target=next(x for x in calc['results']if x['type']=='Differential Pair (Non coplanar)')
central=next(x for x in g['parallel_segment_pairs'] if x['dp_uuid']=='810dcba1-a2b0-4d03-b340-884fb9cb3fa0' and x['dm_uuid']=='730d0479-5ef7-44dd-bd9f-237343f09d6d')
assert all(abs(w-target['width_mm'])<1e-7 for w in central['widths_mm'])
assert abs(central['edge_gap_mm']-target['pair_gap_mm'])<.000002
assert all(x['empty_difference']for x in coverage['rows']if x['extra_margin_each_side_mm']<=.025)
r={'status':'CENTRAL_GEOMETRY_MATCHES_RECORDED_TARGET_NOT_ACTUAL_90OHM_PROOF','pcb_sha256':g['pcb_sha256'],'historical_calculator_observed_date':calc['observed_date'],'calculator_source':calc['source'],'stackup':calc['input']['stackup'],'target_ohm':90,'target_width_mm':target['width_mm'],'target_gap_mm':target['pair_gap_mm'],'current_central_pair':central,'reference_coverage':'Both central track rectangles plus25um each side lie over ground on In1/In3;50um expansion ofDP is not completely covered','outer_layer_lengths_mm':{net:sum(x['length_mm']for x in summary['length_by_layer_width']if x['layer']in ['F.Cu','B.Cu'])for net,summary in g['summary'].items()},'limits':['Recorded calculator assumes uniform pair and continuous broad reference planes; narrow projection coverage is not sufficient to establish its electromagnetic boundary conditions','Nearby same-layer copper, edges and reference voids alter impedance; use actual geometry field model or measurement','Outer-layer fanouts and four signal vias are not evaluated by inner-layer calculator result','Manufacturing etch and dielectric tolerance not evaluated; no90ohm label or fabrication approval','Segment sums may include branches; do not report sum difference as endpoint skew'],'source_sha256':{str(p.relative_to(R)):hashlib.sha256(p.read_bytes()).hexdigest()for p in files}}
(D/'usb-target-comparison.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
