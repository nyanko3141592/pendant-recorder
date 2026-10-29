"""Small exact-solid placement grid, with AABB broad-phase rejection."""
from pathlib import Path
import cadquery as cq,json,hashlib,itertools
O=Path(__file__).resolve().parent
files={'sensor':'vendor/ntcaflex/NTCAFLEX05103HH.STEP','board':'film-integration-integrated-board.step','battery':'offset-pack-assembly-trial.step','lower':'film-sensor-clearance-200um-lower-trial.step','upper':'tab-clearance-upper-trial.step'}
s={k:cq.importers.importStep(str(O/f)).val()for k,f in files.items()}
flat=s['sensor'].rotate((0,0,0),(1,0,0),90)
solids={k:[(v,v.BoundingBox()) for v in shape.Solids()] for k,shape in s.items() if k!='sensor'}
def overlap(a,b):return all(min(getattr(a,axis+'max'),getattr(b,axis+'max'))-max(getattr(a,axis+'min'),getattr(b,axis+'min'))>1e-7 for axis in 'xyz')
rows=[]
for deg,y in itertools.product((140,150,160,200,210,220),(-20,-10)):
 q=flat.rotate((0,0,0),(0,0,1),deg).translate((5,y,-2.32));b=q.BoundingBox()
 volumes={k:sum(q.intersect(v).Volume() for v,vb in parts if overlap(b,vb))for k,parts in solids.items()}
 row={'head_xy_mm':[5,y],'rotation_deg':deg,'overlap_mm3':volumes};rows.append(row);print(row,flush=True)
r={'status':'RELATED_HH_DIAGONAL_GRID_NOT_ADOPTED','source_sha256':{f:hashlib.sha256((O/f).read_bytes()).hexdigest()for f in files.values()},'cases':rows,'nominal_collision_free':[q for q in rows if all(v<1e-7 for v in q['overlap_mm3'].values())],'limits':['Only 12 poses; not exhaustive optimization.','No minimum clearance, full enclosure containment, tolerance, separator, solder, harness or retention check.','Nominal related HH STEP does not establish desired GL maximum fit.']}
(O/'ntcaflex-diagonal-search.json').write_text(json.dumps(r,indent=2)+'\n')
