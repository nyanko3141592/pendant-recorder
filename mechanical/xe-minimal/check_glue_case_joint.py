"""Measure nominal butt-joint area and corner walls; no strength qualification."""
from pathlib import Path
import cadquery as cq,json,hashlib,math
O=Path(__file__).resolve().parent
paths=[O/f'rounded-glue-{n}-study.step'for n in ['upper','lower']];upper,lower=[cq.importers.importStep(str(p)).val()for p in paths]
def seam_faces(s):
 return [f for f in s.Faces() if f.geomType()=='PLANE' and abs(f.BoundingBox().zmin-.4)<1e-6 and abs(f.BoundingBox().zmax-.4)<1e-6]
u,l=seam_faces(upper),seam_faces(lower);contact=sum(a.intersect(b).Area()for a in u for b in l)
b=cq.Compound.makeCompound([upper,lower]).BoundingBox();corners=[]
for sx in [-1,1]:
 for sy in [-1,1]:
  x=b.xmin+1.5 if sx<0 else b.xmax-1.5;y=b.ymin+1.5 if sy<0 else b.ymax-1.5
  start=cq.Vector(x,y,-1);end=cq.Vector(x+sx*2,y+sy*2,-1);edge=cq.Edge.makeLine(start,end);hit=lower.intersect(edge);length=sum(e.Length()for e in hit.Edges());corners.append({'sign_xy':[sx,sy],'z_mm':-1,'diagonal_wall_mm':length})
r={'status':'NOMINAL_JOINT_GEOMETRY_NOT_STRENGTH_APPROVAL','source_sha256':{p.name:hashlib.sha256(p.read_bytes()).hexdigest()for p in paths},'seam_z_mm':.4,'upper_seam_area_mm2':sum(f.Area()for f in u),'lower_seam_area_mm2':sum(f.Area()for f in l),'common_nominal_bond_area_mm2':contact,'corner_diagonal_measurements':corners,'limits':['Butt joint has zero nominal adhesive gap; actual bond-line not yet designed','Corner samples at one height only; not global minimum wall thickness','Adhesive strength, material compatibility and application access unresolved']}
(O/'glue-case-joint-review.json').write_text(json.dumps(r,indent=2)+'\n');print(r)
