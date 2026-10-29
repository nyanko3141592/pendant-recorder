"""Independent OpenCascade check of experimental STEP closure geometry."""
from pathlib import Path
import json, hashlib, cadquery as cq
p=Path(__file__).resolve().parent/'recessed-screw-cad-trial'
f=p/'ASSEMBLY-NOT-PRINT-RELEASE.step'
solids=cq.importers.importStep(str(f)).val().Solids()
def bbox(s):
 b=s.BoundingBox();return [b.xmin,b.ymin,b.zmin,b.xmax,b.ymax,b.zmax]
def choose(zmin,zmax):
 found=[s for s in solids if abs(s.BoundingBox().xlen-23)<.001 and abs(s.BoundingBox().ylen-25)<.001 and abs(s.BoundingBox().zmin-zmin)<.001 and abs(s.BoundingBox().zmax-zmax)<.001]
 if len(found)!=1:raise ValueError('Ambiguous case identification: '+str(len(found)))
 return found[0]
body=choose(0,12.5);lid=choose(11.3,14.81)
common=body.intersect(lid)
r=dict(status='INDEPENDENT_STEP_GEOMETRY_ONLY',step_sha256=hashlib.sha256(f.read_bytes()).hexdigest(),cadquery_version=cq.__version__,solid_count=len(solids),body=dict(valid=body.isValid(),bounds_mm=bbox(body),volume_mm3=body.Volume()),lid=dict(valid=lid.isValid(),bounds_mm=bbox(lid),volume_mm3=lid.Volume()),intersection=dict(valid=common.isValid(),volume_mm3=common.Volume(),solids=len(common.Solids())),limitations=['No print tolerances or strength qualification','Solid identification by unique dimensional signatures, not STEP labels','Does not prove curved outer surface containment or insertion trajectory','Thread pilot does not implement female thread'])
(p/'independent-step-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
