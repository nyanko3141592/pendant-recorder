"""Compare nominal lower/lid bead prisms in CAD assembly coordinates."""
from pathlib import Path
import argparse,runpy,contextlib,io,sys,json,hashlib,zipfile,xml.etree.ElementTree as ET
import numpy as np
from shapely.geometry import LineString
from shapely.ops import unary_union
from gcode_extrusion_paths import read_paths
O=Path(__file__).resolve().parent;D=O/'home-case-slice-review/tab-clearance-upper'
parser=argparse.ArgumentParser();parser.add_argument('--clearance200',action='store_true');args=parser.parse_args()
saved=sys.argv[:];sys.argv=['check','--lower','film-battery-end-wide-350um-lower-first018','--output','film-battery-wide350-first018-mating-review.json']
if args.clearance200:
 sys.argv=['check','--lower','film-sensor-clearance-200um-lower-first018','--separator','film-sensor-clearance-200um-supported-flipped-separator','--output','film-sensor-clearance-200um-mating-review.json']
try:
 with contextlib.redirect_stdout(io.StringIO()):state=runpy.run_path(str(O/'check_lead_wrap_full_mating.py'))
finally:sys.argv=saved
r=json.loads((D/'review.json').read_text());g=D/'plate_1.gcode';source=O/'tab-clearance-upper-trial.step';assert hashlib.sha256(source.read_bytes()).hexdigest()==r['source_sha256'];assert r['rotation_x_deg']==180
with zipfile.ZipFile(D/'upper.3mf') as archive:
 assert archive.read('Metadata/plate_1.gcode')==g.read_bytes()
 tree=ET.fromstring(archive.read('3D/3dmodel.model'));m=list(map(float,tree.find('.//{*}build/{*}item').attrib['transform'].split()));c=list(map(float,tree.find('.//{*}components/{*}component').attrib['transform'].split()))
 verts=ET.fromstring(archive.read('3D/Objects/object_1.model')).findall('.//{*}vertex')
 assert np.allclose(c[:9],np.eye(3).flatten(),atol=1e-7)
 assert all(abs(min(float(v.attrib[k])for v in verts)+c[9+i])<1e-5 for i,k in enumerate('xyz'))
R=np.array(m[:9]).reshape(3,3).T;inv=np.linalg.inv(R);t=np.array(m[9:]);shift=np.array(r['print_xyz_translation_mm']);assert np.allclose(R[2],[0,0,1],atol=1e-7)
def xy(p):
 q=inv@(np.array([p[0],p[1],0])-t)-shift;return(q[0],-q[1])
heights={};h=None
for line in g.read_text().splitlines():
 if line.startswith('; Z_HEIGHT:'):h=float(line.split(':')[1])
 if line.startswith('; LAYER_HEIGHT:'):heights[h]=float(line.split(':')[1])
upper=[]
for h,segs in read_paths(g).items():
 area=unary_union([LineString([xy(p)for p in pts]).buffer(w/2)for pts,w,f in segs if not f.startswith('Support')])
 z=h-shift[2]-t[2];upper.append({'bottom':-z,'top':-z+heights[h],'area':area,'print_z':h})
hits=[];pairs=[]
for a in state['parts']['lower']:
 for b in upper:
  overlap=a['area'].intersection(b['area']);area=overlap.area
  if area<1e-7:continue
  depth=min(a['top'],b['top'])-max(a['bottom'],b['bottom'])
  if depth>1e-7:hits.append({'lower_print_z':a['print_z'],'upper_print_z':b['print_z'],'depth_mm':depth,'area_mm2':area,'volume_mm3':depth*area,'xy_bounds_mm':list(overlap.bounds)})
  if b['bottom']>=a['top']-1e-7:pairs.append({'gap_mm':b['bottom']-a['top'],'projected_area_mm2':area,'lower_print_z':a['print_z'],'upper_print_z':b['print_z']})
result={'status':'NOMINAL_PRINTED_LID_SCREEN_NOT_CLOSURE_QUALIFICATION','lower_sources':state['sources']['lower'],'upper_sources_sha256':{str(p.relative_to(O)):hashlib.sha256(p.read_bytes()).hexdigest()for p in (source,g,D/'upper.3mf',D/'review.json')},'overlaps':hits,'nearest_nonoverlapping_pair':min(pairs,key=lambda q:q['gap_mm'])if pairs else None,'limits':['Nominal bead prisms only; not measured printed parts.','Adhesive, mating force, warping and seam seal are excluded.','No board, microphone duct, battery or harness collision checks in this result.']}
(O/('film-sensor-clearance-200um-lid-review.json' if args.clearance200 else 'film-wide350-printed-lid-review.json')).write_text(json.dumps(result,indent=2)+'\n');print('overlap pairs',len(hits),'volume',sum(q['volume_mm3']for q in hits));print(result['nearest_nonoverlapping_pair'])
