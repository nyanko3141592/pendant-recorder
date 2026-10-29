"""Offline STEP/STL/3MF geometry audit; does not slice or print."""
from pathlib import Path
import argparse, hashlib, json, struct, zipfile
import xml.etree.ElementTree as ET
import numpy as np
import cadquery as cq
from scipy.spatial import cKDTree
p=argparse.ArgumentParser();p.add_argument('package',type=Path);a=p.parse_args()
w=a.package;job=w/'a1mini-fit-kit'
ns={'c':'http://schemas.microsoft.com/3dmanufacturing/core/2015/02'}
prod='{http://schemas.microsoft.com/3dmanufacturing/production/2015/06}'
def stl(path):
 b=path.read_bytes();n=struct.unpack_from('<I',b,80)[0]
 assert len(b)==84+50*n,'Expected binary STL'
 return np.array([struct.unpack_from('<9f',b,84+50*i+12) for i in range(n)]).reshape(-1,3,3)
def metrics(t):
 v=t.reshape(-1,3);return np.ptp(v,axis=0),abs(np.einsum('ij,ij->i',t[:,0],np.cross(t[:,1],t[:,2])).sum()/6)
def linear(s):
 x=np.array(list(map(float,s.split()))).reshape(4,3)
 assert np.allclose(x[:3]@x[:3].T,np.eye(3),atol=1e-6),'Non-rigid transform'
 return x
rows=[]
with zipfile.ZipFile(job/'prototype-fit-kit.3mf') as z:
 root=ET.fromstring(z.read('3D/3dmodel.model'));assert root.get('unit')=='millimeter'
 names={o.get('id'):o.find("metadata[@key='name']").get('value') for o in ET.fromstring(z.read('Metadata/model_settings.config')).findall('object')}
 objects={o.get('id'):o for o in root.findall('c:resources/c:object',ns)}
 items=root.findall('c:build/c:item',ns);assert len(items)==5
 for item in items:
  oid=item.get('objectid');name=names[oid];linear(item.get('transform','1 0 0 0 1 0 0 0 1 0 0 0'))
  comps=objects[oid].findall('c:components/c:component',ns);assert len(comps)==1
  comp=comps[0];tr=linear(comp.get('transform'));r=ET.fromstring(z.read(comp.get(prod+'path').lstrip('/')));assert r.get('unit')=='millimeter'
  mesh=r.find('c:resources/c:object/c:mesh',ns)
  vs=np.array([[float(v.get(k)) for k in ('x','y','z')] for v in mesh.findall('c:vertices/c:vertex',ns)])
  ids=np.array([[int(t.get(k)) for k in ('v1','v2','v3')] for t in mesh.findall('c:triangles/c:triangle',ns)])
  t3=(vs@tr[:3]+tr[3])[ids];ts=stl(job/name)
  # Bidirectional vertex distance, face count, volume and bounds catch scale/mesh substitutions.
  x=t3.reshape(-1,3);y=ts.reshape(-1,3)
  distance=max(cKDTree(x).query(y)[0].max(),cKDTree(y).query(x)[0].max())
  assert len(t3)==len(ts) and distance<.0001,(name,distance)
  ext,vol=metrics(ts);e3,v3=metrics(t3);assert abs(vol-v3)<.001
  stem=Path(name).stem;step=w/(stem+'.step')
  shape=cq.importers.importStep(str(step)).val()
  if stem=='case-lower':shape=shape.rotate((0,0,0),(0,1,0),90)
  if stem=='case-upper':shape=shape.rotate((0,0,0),(1,0,0),180)
  bb=shape.BoundingBox();ex=np.array([bb.xlen,bb.ylen,bb.zlen]);sv=shape.Volume()
  assert np.max(abs(ext-ex))<.05,(name,ext,ex)
  assert abs(vol-sv)/sv<.005,(name,vol,sv)
  rows.append({'name':name,'dimensions_mm':ext.tolist(),'step_volume_mm3':sv,'stl_volume_mm3':vol,'three_mf_vertex_distance_mm':float(distance),'triangles':len(ts),'step_sha256':hashlib.sha256(step.read_bytes()).hexdigest(),'stl_sha256':hashlib.sha256((job/name).read_bytes()).hexdigest()})
expected={'case-lower.stl','case-upper.stl','carrier.stl','pcba-max-gauge.stl','battery-max.stl'}
assert {r['name'] for r in rows}==expected
out={'status':'PASS_OFFLINE_GEOMETRY_SCALE_AND_MESH_CORRESPONDENCE','objects':rows,'three_mf_sha256':hashlib.sha256((job/'prototype-fit-kit.3mf').read_bytes()).hexdigest(),'limits':['STEP tessellation bounds tolerance 0.05 mm and volume 0.5%; STL/3MF bidirectional vertex tolerance 0.0001 mm, equal face count, volume difference <0.001 mm3.','Does not qualify print accuracy, physical assembly, harness, battery safety or joint strength.'],'release_allowed':False}
(w/'geometry-correspondence.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out,indent=2))
