from pathlib import Path
import sys,json,hashlib,zipfile
from shapely.geometry import box,LineString
from shapely.ops import unary_union
H=Path(__file__).resolve().parent;sys.path.insert(0,str(H.parent));from gcode_extrusion_paths import read_paths
O=H/'captured-carrier-case';J=O/'a1mini-fit-kit';p=J/'plate_1.gcode'
with zipfile.ZipFile(J/'captured-carrier-fit-kit.3mf') as z:assert z.read('Metadata/plate_1.gcode')==p.read_bytes()
r=json.loads((J/'result.json').read_text());b=next(x['bbox'] for x in r['sliced_plates'][0]['objects'] if x['name']=='carrier.stl');roi=box(b['x']-1,b['y']-1,b['x']+b['width']+1,b['y']+b['depth']+1)
heights={};z=None
for line in p.read_text().splitlines():
 if line.startswith('; Z_HEIGHT:'):z=float(line.split(':')[1])
 if line.startswith('; LAYER_HEIGHT:'):heights[z]=float(line.split(':')[1])
nodes=[]
for z,segs in read_paths(p).items():
 beads=[LineString(pts).buffer(w/2) for pts,w,f in segs if not f.startswith('Support') and LineString(pts).intersects(roi)]
 if not beads:continue
 area=unary_union(beads).intersection(roi)
 for q in (list(area.geoms) if hasattr(area,'geoms') else [area]):
  if q.area>1e-9:nodes.append((z-heights[z],z,q))
parent=list(range(len(nodes)))
def root(i):
 while parent[i]!=i:parent[i]=parent[parent[i]];i=parent[i]
 return i
for i,(a,b,q) in enumerate(nodes):
 for j,(c,d,s) in enumerate(nodes[:i]):
  if min(b,d)>=max(a,c)-1e-7 and q.intersection(s).area>1e-9:parent[root(i)]=root(j)
groups={}
for i,(a,b,q) in enumerate(nodes):groups.setdefault(root(i),[]).append((a,b,q))
out={'status':'COMMANDED_BEAD_CONNECTIVITY_NOT_PHYSICAL_STRENGTH','gcode_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'node_count':len(nodes),'component_count':len(groups),'component_volumes_mm3':[sum((b-a)*q.area for a,b,q in g) for g in groups.values()],'support_excluded':True,'roi_plate_mm':list(roi.bounds),'limits':['Width-buffered nominal bead model; no physical fusion or stiffness qualification.','Includes positive XY overlap at touching/overlapping Z, excludes point contact.','Carrier ROI only; other objects and support attachment are not certified by this check.']}
(O/'carrier-print-connectivity.json').write_text(json.dumps(out,indent=2)+'\n');print(out)
