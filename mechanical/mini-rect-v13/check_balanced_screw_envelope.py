"""Nominal fastener-to-exterior and component separation, not a tolerance stack."""
from pathlib import Path
import cadquery as cq,json,hashlib
p=Path(__file__).resolve().parent/'captive-nut-balanced-trial';f=p/'ASSEMBLY-NOT-RELEASED.step'
s=cq.importers.importStep(str(f)).val().Solids();assert len(s)==86
outer=cq.Workplane('XY').box(23,25,14.81).edges('|Z').fillet(3.5).edges('#Z').fillet(2).val().translate((11.5,12.5,7.405))
rows=[]
for idx in [83,85]:
 screw=s[idx];nearest=min((screw.distance(part),i+2) for i,part in enumerate(s[2:82]))
 rows.append(dict(screw_index=idx,minimum_to_outer_surface_mm=screw.distance(outer.Shells()[0]),nearest_component_index=nearest[1],minimum_component_distance_mm=nearest[0],outside_volume_mm3=screw.cut(outer).Volume()))
r=dict(status='NOMINAL_GEOMETRY_ONLY',step_sha256=hashlib.sha256(f.read_bytes()).hexdigest(),rows=rows,limitations=['Simplified fastener envelope, nominal dimensions','No accumulated print, PCB placement, component or screw tolerances','Distance to exterior is not lid wall thickness or strength'])
(p/'screw-clearance-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
