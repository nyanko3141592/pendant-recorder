from pathlib import Path
import struct,collections,json,math,hashlib
P=Path(__file__).resolve().parent;results=[]
for p in sorted(P.glob('*.stl')):
 data=p.read_bytes();n=struct.unpack_from('<I',data,80)[0];assert len(data)==84+50*n
 edges=collections.Counter();directed=collections.Counter();verts=set();triangles=[];volume=0;degenerate=0
 for i in range(n):
  row=struct.unpack_from('<12fH',data,84+50*i);tri=[tuple(round(v,6) for v in row[k:k+3]) for k in [3,6,9]];triangles.append(tri);verts.update(tri)
  a,b,c=tri;cross=(b[1]*c[2]-b[2]*c[1],b[2]*c[0]-b[0]*c[2],b[0]*c[1]-b[1]*c[0]);volume+=sum(a[j]*cross[j] for j in range(3))/6
  u=[b[j]-a[j] for j in range(3)];v=[c[j]-a[j] for j in range(3)];area=sum((u[(j+1)%3]*v[(j+2)%3]-u[(j+2)%3]*v[(j+1)%3])**2 for j in range(3));degenerate+=area<1e-16
  for a,b in zip(tri,tri[1:]+tri[:1]):edges[tuple(sorted([a,b]))]+=1;directed[(a,b)]+=1
 graph=collections.defaultdict(set)
 for a,b in edges:graph[a].add(b);graph[b].add(a)
 seen=set();components=0
 for a in verts:
  if a in seen:continue
  components+=1;stack=[a];seen.add(a)
  while stack:
   for b in graph[stack.pop()]:
    if b not in seen:seen.add(b);stack.append(b)
 bounds=[[min(v[j] for v in verts),max(v[j] for v in verts)] for j in range(3)];dims=[b-a for a,b in bounds];expect={'rounded_whole_26x31x14.stl':[26,31,14],'rounded_front_half_print_flat.stl':[26,31,7],'rounded_back_half_print_flat.stl':[26,31,7]}.get(p.name,dims)
 assert all(abs(a-b)<1e-5 for a,b in zip(dims,expect));assert min(v[2] for v in verts)==0
 assert all(c==2 for c in edges.values());assert all(directed[(a,b)]==directed[(b,a)] for a,b in edges);assert components==1 and volume>0 and degenerate==0
 results.append(dict(file=p.name,dimensions_mm=dims,triangles=n,closed_manifold=True,consistent_winding=True,connected_components=components,degenerate_triangles=degenerate,signed_volume_mm3=volume,bed_z_min=0,sha256=hashlib.sha256(data).hexdigest(),scope='Topology/bounds/winding checks; not a physical print or full triangle self-intersection test'))
(P/'mesh-validation.json').write_text(json.dumps(results,indent=2)+'\n');print(json.dumps(results,indent=2))
