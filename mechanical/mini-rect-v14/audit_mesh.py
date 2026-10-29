"""Check exported binary STL topology; not a slicer or fit qualification."""
from pathlib import Path
import struct,json,collections,sys,numpy as np
root=Path(sys.argv[1]) if len(sys.argv)>1 else Path('/Users/takahashinaoki/Downloads/Pendant-mini-rect-v13-fit-study')
rows=[]
for path in sorted(root.glob('*.stl')):
 data=path.read_bytes();n=struct.unpack_from('<I',data,80)[0]
 assert len(data)==84+50*n,(path,'not binary STL')
 triangles=[];edges=collections.Counter();directed=collections.Counter()
 for i in range(n):
  v=struct.unpack_from('<12f',data,84+50*i)[3:]
  t=[tuple(round(q,5) for q in v[j:j+3]) for j in [0,3,6]];triangles.append(t)
  for a,b in zip(t,t[1:]+t[:1]):edges[tuple(sorted([a,b]))]+=1;directed[(a,b)]+=1
 a=np.array(triangles);lo=a.min(axis=(0,1));hi=a.max(axis=(0,1))
 volume=np.einsum('ij,ij->i',a[:,0],np.cross(a[:,1],a[:,2])).sum()/6
 rows.append(dict(file=path.name,triangles=n,bounds_mm=[lo.tolist(),hi.tolist()],size_mm=(hi-lo).tolist(),nonmanifold_edges=sum(v!=2 for v in edges.values()),orientation_mismatches=sum(directed[(e[0],e[1])]!=directed[(e[1],e[0])] for e in edges),signed_volume_mm3=round(float(volume),3)))
(root/'mesh-audit.json').write_text(json.dumps(rows,indent=2)+'\n');print(json.dumps(rows,indent=2))
