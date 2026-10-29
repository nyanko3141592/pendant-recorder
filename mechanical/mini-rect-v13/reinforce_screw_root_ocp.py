"""Add sidewall roots to experimental closure; retain prior candidate unchanged."""
from pathlib import Path
import json,hashlib,cadquery as cq
P=Path(__file__).resolve().parent
src=P/'recessed-screw-cad-trial/ASSEMBLY-NOT-PRINT-RELEASE.step'
out=P/'recessed-screw-root-trial';out.mkdir(exist_ok=True)
s=cq.importers.importStep(str(src)).val().Solids()
def matches(a,zlo,zhi):
 b=a.BoundingBox();return abs(b.xlen-23)<.001 and abs(b.ylen-25)<.001 and abs(b.zmin-zlo)<.001 and abs(b.zmax-zhi)<.001
bi=[i for i,a in enumerate(s) if matches(a,0,12.5)];li=[i for i,a in enumerate(s) if matches(a,11.3,14.81)]
assert len(bi)==len(li)==1
body=s[bi[0]];lid=s[li[0]]
for x,axis in [(.8,1.4),(22.2,21.6)]:
 root=cq.Workplane('XY').box(1.2,2.4,1.1).edges('|Z').fillet(.1).val().translate((x,5,11.15))
 body=body.fuse(root).clean()
 pilot=cq.Solid.makeCylinder(.475,1.2,cq.Vector(axis,5,11.4))
 body=body.cut(pilot).clean()
assert body.isValid() and len(body.Solids())==1
rows=[]
for i,a in enumerate(s):
 if i in bi+li:continue
 b=a.BoundingBox()
 if abs(b.xlen-1.8)<.001 and abs(b.ylen-1.8)<.001 and abs(b.zmin-11.5)<.001:continue # intentional thread engagement excluded
 common=body.intersect(a)
 rows.append(dict(solid_index=i,overlap_mm3=common.Volume(),distance_mm=body.distance(a),valid=common.isValid()))
path=[]
for dz in [0,.05,.1,.2,.4,.8,1.2,2,3,4]:
 moved=lid.translate((0,0,dz));common=body.intersect(moved)
 path.append(dict(lift_mm=dz,overlap_mm3=common.Volume(),valid=common.isValid()))
s[bi[0]]=body
f=out/'ASSEMBLY-NOT-PRINT-RELEASE.step';cq.exporters.export(cq.Compound.makeCompound(s),str(f))
r=dict(status='EXPERIMENTAL_ROOT_GEOMETRY_NOT_RETENTION_APPROVAL',source_sha256=hashlib.sha256(src.read_bytes()).hexdigest(),output_sha256=hashlib.sha256(f.read_bytes()).hexdigest(),body_valid=body.isValid(),body_solids=len(body.Solids()),body_volume_mm3=body.Volume(),component_checks=rows,lid_lift_samples=path,limitations=['Discrete lift samples, not continuous swept-volume proof','No battery harness, manufacturing tolerance, thread or strength qualification','Thread engagement intentionally excluded from component interference','No claim of curved exterior containment'])
(out/'root-review.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps({'component_overlaps':[r for r in rows if r['overlap_mm3']>1e-6],'invalid_checks':[r for r in rows if not r['valid']],'lid_lift_samples':path},indent=2))
