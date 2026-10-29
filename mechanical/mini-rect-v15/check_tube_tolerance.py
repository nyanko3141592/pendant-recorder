"""Reject an unlocated floating tube; do not assume supplier OD tolerances."""
from pathlib import Path
import json,math,hashlib
P=Path(__file__).resolve().parent
src=P.parents[1]/'hardware/mini-rect-v15/input-control-pa2-pb5/usb-reference-power.mechanical-handoff.json'
h=json.loads(src.read_text());mic=next(x for x in h['round_npth_holes'] if x['ref']=='U8')
ID_hole=1.8;hole_tolerance=.3;OD_tube=1.59;rows=[]
for p in h['parts']:
 if p['side']!='B' or p['height_mm']<=.4:continue
 dx=max(abs(mic['x_mm']-p['x_mm'])-p['w_mm']/2,0)
 dy=max(abs(mic['y_mm']-p['y_mm'])-p['d_mm']/2,0)
 distance=math.hypot(dx,dy)
 if distance>2.5:continue
 rows.append(dict(ref=p['ref'],center_to_part_envelope_mm=distance,nominal_centered_tube_clearance_mm=distance-OD_tube/2,nominal_hole_floating_tube_clearance_mm=distance-ID_hole/2,max_hole_floating_tube_clearance_mm=distance-(ID_hole+hole_tolerance)/2))
r=dict(status='UNLOCATED_TUBE_RETENTION_REJECTED',source_sha256=hashlib.sha256(src.read_bytes()).hexdigest(),guideline_source='https://jlc3dp.com/help/article/3d-printing-design-guideline',model='Tube remains straight and parallel but may translate to printed hole edge; tilted tube and PCB-to-case errors omitted, so this is an optimistic screen.',nominal_tube_OD_mm=OD_tube,tube_OD_tolerance=None,nominal_hole_diameter_mm=ID_hole,hole_diameter_tolerance_mm=hole_tolerance,min_hole_diameter_mm=ID_hole-hole_tolerance,max_hole_diameter_mm=ID_hole+hole_tolerance,min_hole_fits_nominal_tube=(ID_hole-hole_tolerance)>=OD_tube,nominal_radial_float_mm=(ID_hole-OD_tube)/2,max_hole_radial_float_mm=(ID_hole+hole_tolerance-OD_tube)/2,nearby_parts=rows,requirements=['Tube must be located against the PCB/microphone datum rather than relying on an oversized case hole.','Account for tube OD, hole location, PCB positioning, tube tilt and thermal/adhesive movement before specifying a nonzero keepout.','Repositioning R13 or Q3 needs rerouting and neighboring component checks; no footprint movement is authorized by this calculation alone.','Printed-hole fit can require postprocessing or a separate precision guide; neither is currently specified.'],release_allowed=False)
assert not r['min_hole_fits_nominal_tube']
assert {x['ref'] for x in rows if x['max_hole_floating_tube_clearance_mm']<0}=={'R13','Q3'}
(P/'tube-tolerance-review.json').write_text(json.dumps(r,indent=2)+'\n')
print('Minimum printed hole:',r['min_hole_diameter_mm'],'mm versus tube',OD_tube)
print('Largest-hole float can contact:',[x['ref'] for x in rows if x['max_hole_floating_tube_clearance_mm']<0])
