"""Read-only STEP bounds; run with CadQuery/OCP Python from repository root."""
from pathlib import Path
import hashlib,json
import cadquery as cq
from OCP.Bnd import Bnd_Box
from OCP.BRepBndLib import BRepBndLib
base=Path(__file__).resolve().parent
rows=[]
for name,folder in [('case-a.step','cnc'),('case-b.step','cnc'),('wrapper.step','injection-molding')]:
 p=base/name;s=cq.importers.importStep(str(p)).val()
 box=Bnd_Box();BRepBndLib.AddOptimal_s(s.wrapped,box,False,False);v=box.Get()
 rows.append(dict(file=name,source=f'https://github.com/BasedHardware/omi/blob/main/omi/hardware/consumer/mechanical/parts/{folder}/{name}',sha256=hashlib.sha256(p.read_bytes()).hexdigest(),valid=s.isValid(),solids=len(s.Solids()),bounds_mm=list(v),xyz_extent_mm=[v[i+3]-v[i] for i in range(3)]))
r={'date':'2026-10-26','method':'CadQuery STEP import, OCP AddOptimal no triangulation/useShapeToleranceFalse; millimetres from STEP import','parts':rows,'interpretation':['Both covers have approximately25.5mm X/Z diameter; thickness axisY.','Wrapper bounds approximately28.6145X,11.030Y,35.550Z including projection. Wrapper is invalid in OCCT; bounds are diagnostic, not manufacturing verification.','Files share coordinates but full assembly/revision association and delivered product identity are not established. Do not label wrapper internal or claim completed Omi size from cover diameter.','Keep25.5mm-class compact target and<=15mm thickness; evaluate necklace attachment separately but include it in completed product bounds. Do not enlarge target based on this discrepancy.'],'production_design_changed':False}
(base/'dimension-review.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps(r,indent=2))
