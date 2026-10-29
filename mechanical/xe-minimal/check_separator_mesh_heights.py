"""Vertical triangle intersections at interior XY probes, CAD vs exported meshes."""
from pathlib import Path
import struct,json,zipfile,xml.etree.ElementTree as ET
import numpy as np,cadquery as cq
O=Path(__file__).resolve().parent;d=O/'home-case-slice-review/film-roomier-joint-supported-separator';r=json.loads((d/'review.json').read_text());shift=np.array(r['translation_mm'])
b=(d/(d.name+'.stl')).read_bytes();n=struct.unpack_from('<I',b,80)[0];assert len(b)==84+50*n
stl=np.array([struct.unpack_from('<12f',b,84+i*50)[3:]for i in range(n)]).reshape(-1,3,3)-shift
with zipfile.ZipFile(d/(d.name+'.3mf'))as z:
 root=ET.fromstring(z.read('3D/3dmodel.model'));c=list(map(float,root.find('.//{*}components/{*}component').attrib['transform'].split()));mesh=ET.fromstring(z.read('3D/Objects/object_1.model'))
 vertices=np.array([[float(v.attrib[k])for k in 'xyz']for v in mesh.findall('.//{*}vertex')]);faces=np.array([[int(t.attrib[k])for k in ['v1','v2','v3']]for t in mesh.findall('.//{*}triangle')]);vertices=vertices@np.array(c[:9]).reshape(3,3)+np.array(c[9:])-shift;tri=vertices[faces]
def heights(tris,x,y):
 zs=[]
 for t in tris:
  A=np.column_stack((t[1,:2]-t[0,:2],t[2,:2]-t[0,:2]));det=np.linalg.det(A)
  if abs(det)<1e-12:continue
  u,v=np.linalg.solve(A,np.array([x,y])-t[0,:2])
  if u>=-1e-8 and v>=-1e-8 and u+v<=1+1e-8:zs.append(float(t[0,2]+u*(t[1,2]-t[0,2])+v*(t[2,2]-t[0,2])))
 return sorted(set(round(z,6)for z in zs))
s=cq.importers.importStep(str(O/r['source'])).val();rows=[]
for x,y in [(17,-15),(17.14984,-15.00002),(17,-20),(10,-27.1),(10,.1)]:
 q=s.intersect(cq.Edge.makeLine(cq.Vector(x,y,-4),cq.Vector(x,y,1)))
 rows.append({'xy_mm':[x,y],'CAD_intervals_mm':[[e.BoundingBox().zmin,e.BoundingBox().zmax]for e in q.Edges()],'STL_intersections_z_mm':heights(stl,x,y),'3MF_intersections_z_mm':heights(tri,x,y)})
report={'status':'MESH_PROBE_COMPARISON','source_sha256':r['source_sha256'],'rows':rows,'limits':['Finite interior probes only; not complete mesh equivalence proof.','3MF build placement removed; component transform and export translation applied.']}
(O/'film-separator-mesh-height-review.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
