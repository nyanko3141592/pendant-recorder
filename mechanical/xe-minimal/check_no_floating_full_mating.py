"""Nominal bead-prism screen in assembly coordinates, excluding removable support."""
from pathlib import Path
import json,hashlib,zipfile,xml.etree.ElementTree as ET
import numpy as np
import cadquery as cq
from shapely.geometry import LineString,MultiPoint
from shapely.ops import unary_union
from gcode_extrusion_paths import read_paths
O=Path(__file__).resolve().parent;D=O/'home-case-slice-review';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
from shapely.geometry import box
roi=box(-2,-30,27,3)
names={'lower':'film-open-joint-pockets-lower','separator':'film-roomier-joint-supported-no-floating-shell-separator'};parts={};sources={}
for key,name in names.items():
 d=D/name;r=json.loads((d/'review.json').read_text());assert sha(O/r['source'])==r['source_sha256'];p=d/'plate_1.gcode';text=p.read_text();height={};h=None
 for line in text.splitlines():
  if line.startswith('; Z_HEIGHT:'):h=float(line.split(':')[1])
  if line.startswith('; LAYER_HEIGHT:'):height[h]=float(line.split(':')[1])
 with zipfile.ZipFile(d/(name+'.3mf')) as z:
  assert z.read('Metadata/plate_1.gcode')==p.read_bytes();root=ET.fromstring(z.read('3D/3dmodel.model'));m=list(map(float,root.find('.//{*}build/{*}item').attrib['transform'].split()));c=list(map(float,root.find('.//{*}components/{*}component').attrib['transform'].split()))
  verts=ET.fromstring(z.read('3D/Objects/object_1.model')).findall('.//{*}vertex')
  assert np.allclose(c[:9],np.eye(3).flatten(),atol=1e-7)
  assert all(abs(min(float(v.attrib[k])for v in verts)+c[9+i])<1e-5 for i,k in enumerate('xyz'))
 R=np.array(m[:9]).reshape(3,3).T;t=np.array(m[9:]);shift=np.array(r['translation_mm']);inv=np.linalg.inv(R);assert np.allclose(R[2],[0,0,1],atol=1e-7)
 def cadxy(pt):return tuple((inv@(np.array([pt[0],pt[1],0])-t)-shift)[:2])
 layers=[]
 for h,segs in read_paths(p).items():
  beads=[LineString([cadxy(pt)for pt in pts]).buffer(w/2)for pts,w,f in segs if not f.startswith('Support')]
  area=unary_union(beads).intersection(roi)
  if area.area>1e-7:layers.append({'top':h-shift[2]-t[2],'bottom':h-height[h]-shift[2]-t[2],'area':area,'print_z':h})
 parts[key]=layers;sources[key]={'source_sha256':r['source_sha256'],'gcode_sha256':sha(p),'3mf_sha256':sha(d/(name+'.3mf'))}
contacts=[];overlaps=[]
for a in parts['lower']:
 for b in parts['separator']:
  area=a['area'].intersection(b['area']).area
  if area<1e-7:continue
  depth=min(a['top'],b['top'])-max(a['bottom'],b['bottom'])
  if depth>1e-7:overlaps.append({'lower_layer':a['print_z'],'separator_layer':b['print_z'],'depth_mm':depth,'area_mm2':area,'nominal_prism_overlap_mm3':depth*area,'intersection_xy_bounds_mm':list(a['area'].intersection(b['area']).bounds),'intersection_xy_centroid_mm':list(a['area'].intersection(b['area']).centroid.coords)[0]})
  elif abs(depth)<1e-7:contacts.append({'lower_layer':a['print_z'],'separator_layer':b['print_z'],'contact_area_mm2':area,'assembly_z_mm':a['top']})
r={'status':'NOMINAL_PRINT_MATING_SCREEN_NOT_TOLERANCE_QUALIFICATION','sources':sources,'roi':'Full part XY bounding region -2..27, -30..3','separator_lowest_part_bottom_in_roi_mm':min(x['bottom']for x in parts['separator']),'contacts':contacts,'overlaps':overlaps,'limits':['Rectangular bead cross-section is an approximation, not measured deposited geometry.','Excludes support; support removal residue and sag are unknown.','Assembly positioning uses CAD origin; mounting datum tolerances are not characterized.','Zero nominal gap does not establish fit or seating force.','Full XY for lower/separator only; board, lid, sensor, battery and wires excluded.']}
(O/'film-no-floating-full-mating-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
