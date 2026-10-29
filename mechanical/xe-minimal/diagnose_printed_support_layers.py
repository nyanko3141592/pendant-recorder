from pathlib import Path
import json,zipfile,xml.etree.ElementTree as ET
import numpy as np,cadquery as cq
from shapely.geometry import LineString,box
from shapely.ops import unary_union
from gcode_extrusion_paths import read_paths
O=Path(__file__).resolve().parent;d=O/'home-case-slice-review/film-roomier-joint-supported-separator'
r=json.loads((d/'review.json').read_text())
with zipfile.ZipFile(d/(d.name+'.3mf'))as z:
 root=ET.fromstring(z.read('3D/3dmodel.model'));m=list(map(float,root.find('.//{*}build/{*}item').attrib['transform'].split()))
R=np.array(m[:9]).reshape(3,3).T;inv=np.linalg.inv(R);t=np.array(m[9:]);shift=np.array(r['translation_mm'])
def xy(pt):return tuple((inv@(np.array([*pt,0])-t)-shift)[:2])
s=cq.importers.importStep(str(O/r['source'])).val();line=cq.Edge.makeLine(cq.Vector(17,-15,-4),cq.Vector(17,-15,0));intervals=[[e.BoundingBox().zmin,e.BoundingBox().zmax]for e in s.intersect(line).Edges()]
rows=[];roi=box(16.6,-16,17.4,-14)
for h,segs in sorted(read_paths(d/'plate_1.gcode').items()):
 if h>.5:continue
 for feature in sorted(set(f for _,_,f in segs)):
  selected=[LineString([xy(p)for p in pts]).buffer(w/2)for pts,w,f in segs if f==feature]
  area=unary_union(selected).intersection(roi).area
  if area>1e-6:rows.append({'print_z_mm':h,'feature':feature,'nominal_bead_area_in_support_roi_mm2':area})
centers=[]
for pts,w,f in read_paths(d/'plate_1.gcode')[.14]:
 if f!='Outer wall':continue
 line2=LineString([xy(pt)for pt in pts]);inside=line2.intersection(roi)
 if inside.is_empty:continue
 mid=inside.centroid;probe=cq.Edge.makeLine(cq.Vector(mid.x,mid.y,-4),cq.Vector(mid.x,mid.y,0))
 intervals2=[[e.BoundingBox().zmin,e.BoundingBox().zmax]for e in s.intersect(probe).Edges()]
 centers.append({'xy':[mid.x,mid.y],'width_mm':w,'CAD_z_intervals_mm':intervals2,'path_bounds':list(line2.bounds)})
out={'first_layer_outer_wall_center_samples':centers,'source':r['source'],'CAD_vertical_intervals_at_17_minus15_mm':intervals,'rows':rows,'scope':'One central support XY rectangle; identify actual first-layer feature labels.'}
(O/'film-printed-support-layer-diagnostic.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2))
