from pathlib import Path
import struct,collections,json,hashlib
O=Path(__file__).resolve().parent/'home-fit-coupons';rows=[]
for p in sorted(O.glob('*.stl')):
 raw=p.read_bytes();n=struct.unpack_from('<I',raw,80)[0];assert len(raw)==84+50*n
 edges=collections.Counter();volume=0;points=[]
 for i in range(n):
  f=struct.unpack_from('<12fH',raw,84+50*i);a,b,c=[tuple(f[j:j+3])for j in [3,6,9]];points.extend([a,b,c])
  for u,v in [(a,b),(b,c),(c,a)]:edges[tuple(sorted([u,v]))]+=1
  volume+=(a[0]*(b[1]*c[2]-b[2]*c[1])+a[1]*(b[2]*c[0]-b[0]*c[2])+a[2]*(b[0]*c[1]-b[1]*c[0]))/6
 assert all(count==2 for count in edges.values())and volume>0
 rows.append({'file':p.name,'sha256':hashlib.sha256(raw).hexdigest(),'triangles':n,'each_mesh_edge_has_two_adjacent_faces':True,'signed_volume_mm3':volume,'bounds_mm':[[min(v[j]for v in points)for j in range(3)],[max(v[j]for v in points)for j in range(3)]]})
(O/'mesh-review.json').write_text(json.dumps({'status':'CLOSED_EDGE_MESH_SCREEN_PASS','files':rows,'limits':['Edge incidence and signed volume do not prove absence of all self-intersections','No slicing or physical print performed']},indent=2)+'\n');print([(x['file'],x['triangles'])for x in rows])
