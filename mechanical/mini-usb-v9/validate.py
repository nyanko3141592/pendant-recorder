import struct,collections,json,hashlib,zipfile,xml.etree.ElementTree as ET,math
from pathlib import Path
P=Path('/Users/takahashinaoki/Downloads/Pendant-mini-usb-v9');results=[]
for p in sorted(P.glob('*/*.stl')):
 data=p.read_bytes();n=struct.unpack_from('<I',data,80)[0];assert len(data)==84+50*n
 edges=collections.Counter();directed=collections.Counter();vertices=set();vol=0;bad=0
 for i in range(n):
  row=struct.unpack_from('<12fH',data,84+50*i);tri=[tuple(round(v,5) for v in row[k:k+3]) for k in [3,6,9]];vertices.update(tri);a,b,c=tri
  cross=(b[1]*c[2]-b[2]*c[1],b[2]*c[0]-b[0]*c[2],b[0]*c[1]-b[1]*c[0]);vol+=sum(a[j]*cross[j] for j in range(3))/6
  u=[b[j]-a[j] for j in range(3)];v=[c[j]-a[j] for j in range(3)];area=sum((u[(j+1)%3]*v[(j+2)%3]-u[(j+2)%3]*v[(j+1)%3])**2 for j in range(3));bad+=area<1e-16
  for a,b in zip(tri,tri[1:]+tri[:1]):edges[tuple(sorted([a,b]))]+=1;directed[(a,b)]+=1
 graph=collections.defaultdict(set)
 for a,b in edges:graph[a].add(b);graph[b].add(a)
 seen=set();components=0
 for a in vertices:
  if a in seen:continue
  components+=1;stack=[a];seen.add(a)
  while stack:
   for b in graph[stack.pop()]:
    if b not in seen:seen.add(b);stack.append(b)
 bounds=[[min(v[j] for v in vertices),max(v[j] for v in vertices)] for j in range(3)];dims=[b-a for a,b in bounds]
 assert all(c==2 for c in edges.values()),p
 assert all(directed[(a,b)]==directed[(b,a)] for a,b in edges),p
 assert components==1 and vol>0 and bad==0,(p,components,vol,bad)
 assert bounds[2][0]==0,(p,bounds)
 if p.parent.name in ['A','B']:
  v=p.parent.name;W,T=(40,10.8) if v=='A' else (22,16.4)
  expected={'body':[W,41,T-1.2],'lid':[W,41,2.4],'pcb_components':[18,33.5,5.86]}.get(p.stem)
  if expected:assert all(abs(a-b)<1e-4 for a,b in zip(dims,expected)),(p,dims,expected)
 if p.stem=='battery':assert all(abs(a-b)<1e-4 for a,b in zip(dims,[15.5,27,4.2]))
 with zipfile.ZipFile(p.with_suffix('.3mf')) as z:
  root=ET.fromstring(z.read('3D/3dmodel.model'));assert root.get('unit')=='millimeter'
  vv=[[float(a.get(k)) for k in ['x','y','z']] for a in root.iter() if a.tag.endswith('}vertex')]
  d3=[max(a[j] for a in vv)-min(a[j] for a in vv) for j in range(3)]
  assert all(abs(a-b)<1e-4 for a,b in zip(dims,d3)),(p,dims,d3)
 results.append(dict(file=str(p.relative_to(P)),dimensions_mm=dims,triangles=n,closed_manifold=True,consistent_winding=True,connected_components=components,degenerate_triangles=bad,volume_mm3=vol,bed_z_min=bounds[2][0],unit_3mf='millimeter',sha256=hashlib.sha256(data).hexdigest()))
(P/'mesh-validation.json').write_text(json.dumps(dict(scope='Closed edges/winding/connectedness/positive volume/bounds/3MF mm. No exhaustive triangle self-intersection test; no physical print.',results=results),indent=2));print('PASS',len(results),'STL and 3MF pairs')
