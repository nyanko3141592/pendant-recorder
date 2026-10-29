"""Sensitivity screen, not supplier feature tolerances or foam qualification."""
from pathlib import Path
import hashlib
import itertools
import json

P = Path(__file__).resolve().parent
source = P / 'retention-fit-review.json'
r = json.loads(source.read_text())
a = r['retention']
board_z = r['board_origin_case_mm'][2]
# General SLA model tolerance is only a sensitivity input: independent
# body ledge and lid post errors have not been specified by the supplier.
tol = .2
pad = a['pad_free_thickness_assumed_mm']
rows = []
for pcb, ledge_error, post_error in itertools.product(
    [a['nominal_PCB_thickness_mm'], a['max_PCB_thickness_mm']],
    [-tol, tol], [-tol, tol]
):
    gap = a['post_tip_case_Z_mm'] + post_error - (board_z + ledge_error + pcb)
    rows.append(dict(pcb_mm=pcb, ledge_error_mm=ledge_error,
                     post_error_mm=post_error, gap_mm=round(gap, 6),
                     signed_compression_fraction=round(1-gap/pad, 6),
                     contact=gap <= pad))
lo = min(x['gap_mm'] for x in rows)
hi = max(x['gap_mm'] for x in rows)
# Illustrative window only, not an actual material rating.
cmin, cmax = .2, .6
minimum_pad = hi / (1-cmin)
maximum_pad = lo / (1-cmax)
out = dict(
    status='FIXED_1MM_PAD_NOT_ROBUST_IN_TOLERANCE_SENSITIVITY',
    source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),
    guideline_source='https://jlc3dp.com/help/article/3d-printing-design-guideline',
    independent_feature_error_assumed_mm=tol,
    tolerance_is_supplier_feature_guarantee=False,
    cases=rows, gap_range_mm=[lo, hi],
    signed_compression_range=[min(x['signed_compression_fraction'] for x in rows),
                              max(x['signed_compression_fraction'] for x in rows)],
    hypothetical_compression_window=dict(min=cmin, max=cmax,
        material_rating=False, required_pad_min_mm=minimum_pad,
        required_pad_max_mm=maximum_pad, feasible=minimum_pad <= maximum_pad),
    limitations=[
        'Only nominal and maximum PCB thickness considered; lower PCB thickness limit is not established.',
        'General model tolerance does not specify independent internal feature heights or datum correlation.',
        'Pad thickness tolerance, lid seating, adhesive, warpage and compression set omitted.',
        'Negative signed compression means a gap, not tensile foam strain.',
        'Right ledge nominal R37 clearance 0.2mm has no verified relative feature tolerance.',
    ],
    next_required_action='Specify and measure assembled support-to-post gap at all three sites before selecting pad thickness and force curve; use measured fitted shims/pads for prototypes if required. Recheck R37 clearance and enclosure limits after adjustment.',
    adopted=False, release_allowed=False,
)
assert abs(lo-.27) < 1e-8 and abs(hi-1.2) < 1e-8
assert out['signed_compression_range'] == [-.2, .73]
assert not out['hypothetical_compression_window']['feasible']
(P/'retention-tolerance-review.json').write_text(json.dumps(out, indent=2)+'\n')
print(json.dumps({k:out[k] for k in ['status','gap_range_mm','signed_compression_range','hypothetical_compression_window']}, indent=2))
