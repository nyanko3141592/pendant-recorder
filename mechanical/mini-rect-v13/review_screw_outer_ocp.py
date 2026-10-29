"""Verify nominal rounded outer containment; no tolerance or strength claim."""
from pathlib import Path
import hashlib,json,cadquery as cq
p=Path(__file__).resolve().parent/'recessed-screw-root-trial';f=p/'ASSEMBLY-NOT-PRINT-RELEASE.step'
s=cq.importers.importStep(str(f)).val().Solids()
outer=cq.Workplane('XY').box(23,25,14.81).edges('|Z').fillet(3.5).edges('#Z').fillet(2).val().translate((11.5,12.5,7.405))
rows=[]
for i,a in enumerate(s):
 b=a.BoundingBox()
 if b.xlen>22.9 or (abs(b.xlen-1.8)<.001 and abs(b.zmin-11.5)<.001):
  diff=a.cut(outer);rows.append(dict(index=i,outside_volume_mm3=diff.Volume(),valid=diff.isValid()))
assert len(rows)==4
r=dict(status='NOMINAL_OUTER_CONTAINMENT_ONLY',step_sha256=hashlib.sha256(f.read_bytes()).hexdigest(),outer_mm=[23,25,14.81],plan_corner_radius_mm=3.5,top_bottom_edge_radius_mm=2,outer_valid=outer.isValid(),rows=rows,limitation='Independent analytic outer shape; excludes manufacturing tolerances')
(p/'exterior-review.json').write_text(json.dumps(r,indent=2)+'\n')
