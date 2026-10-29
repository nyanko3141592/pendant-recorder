"""Screen nominal wire cylinders against commanded bead prisms at the stop."""
from pathlib import Path
import json,hashlib,zipfile,xml.etree.ElementTree as ET,math
import numpy as np
from shapely.geometry import LineString,box
from shapely.ops import unary_union
from gcode_extrusion_paths import read_paths
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
O=Path(__file__).resolve().parent
name='film-axial-stop-relieved-supported-separator';d=O/'home-case-slice-review'/name
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
r=json.loads((d/'review.json').read_text());assert sha(O/r['source'])==r['source_sha256']
p=d/'plate_1.gcode';heights={};h=None
for line in p.read_text().splitlines():
 if line.startswith('; Z_HEIGHT:'):h=float(line.split(':')[1])
 if line.startswith('; LAYER_HEIGHT:'):heights[h]=float(line.split(':')[1])
with zipfile.ZipFile(d/(name+'.3mf')) as archive:
 assert archive.read('Metadata/plate_1.gcode')==p.read_bytes()
 root=ET.fromstring(archive.read('3D/3dmodel.model'))
 m=list(map(float,root.find('.//{*}build/{*}item').attrib['transform'].split()))
 c=list(map(float,root.find('.//{*}components/{*}component').attrib['transform'].split()))
 vertices=ET.fromstring(archive.read('3D/Objects/object_1.model')).findall('.//{*}vertex')
 assert np.allclose(c[:9],np.eye(3).flatten(),atol=1e-7)
 assert all(abs(min(float(v.attrib[k])for v in vertices)+c[9+i])<1e-5 for i,k in enumerate('xyz'))
R=np.array(m[:9]).reshape(3,3).T;t=np.array(m[9:]);shift=np.array(r['translation_mm']);inv=np.linalg.inv(R)
assert np.allclose(R[2],[0,0,1],atol=1e-7)
a=math.radians(28);rot=np.array([[math.cos(a),-math.sin(a)],[math.sin(a),math.cos(a)]])
def local(pt):
 cad=(inv@(np.array([*pt,0])-t)-shift)[:2]
 return tuple(rot@(cad-np.array([7.6,-25.5])))
rows=[];draw=[]
for h,segs in sorted(read_paths(p).items()):
 top=h-shift[2]-t[2];bottom=top-heights[h]
 if top < -2.42 or bottom > -1.42:continue
 groups={}
 for key in ['part','support']:
  groups[key]=unary_union([LineString([local(pt)for pt in pts]).buffer(w/2) for pts,w,f in segs if f.startswith('Support')==(key=='support')]).intersection(box(-2.2,23.3,2.2,26.8))
 for x in [-.9,.9]:
  dz=max(bottom-(-1.92),-1.92-top,0)
  radius=.155
  if dz>=radius:continue
  half=math.sqrt(radius**2-dz**2)
  envelope=box(x-half,26.1,x+half,26.5)
  rows.append({'layer_top_mm':h,'assembly_bottom_mm':bottom,'assembly_top_mm':top,'hole_local_x_mm':x,'wire_max_slice_halfwidth_mm':half,'part_overlap_upper_bound_mm2':groups['part'].intersection(envelope).area,'support_overlap_upper_bound_mm2':groups['support'].intersection(envelope).area})
 draw.append((h,groups))
fig,axs=plt.subplots(1,len(draw),figsize=(3*len(draw),5),squeeze=False)
for ax,(h,g) in zip(axs.flat,draw):
 for key,color in [('part','#187d99'),('support','#df9b59')]:
  for geom in getattr(g[key],'geoms',[g[key]]):
   if geom.geom_type=='Polygon':
    ax.fill(*geom.exterior.xy,color=color,alpha=.7)
    for ring in geom.interiors:ax.fill(*ring.xy,color='white')
 for x in [-.9,.9]:
  ax.add_patch(plt.Rectangle((x-.155,26.1),.31,.4,fill=False,color='red'))
 ax.set(xlim=(-2.2,2.2),ylim=(23.3,26.8),title=f'Z {h:.2f}',aspect='equal')
fig.suptitle('Axial stop: nominal part / support paths; red = wire XY extent')
fig.tight_layout();fig.savefig(O/'film-axial-stop-printed-holes.png',dpi=160)
report={'status':'NOMINAL_BEAD_PRISM_SCREEN_NOT_PRINT_QUALIFICATION','source_sha256':r['source_sha256'],'gcode_sha256':sha(p),'rows':rows,'limits':['Wire nominal OD .31 mm; no manufacturing tolerances.','Per-layer maximum cylinder section is conservative: positive overlap is a screen finding, not exact physical collision.','Commanded bead width and rectangular layer section are approximations.','Support must be removed; sag, residue, hole size and pull strength require physical validation.']}
(O/'film-axial-stop-printed-holes-review.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(report,indent=2))
