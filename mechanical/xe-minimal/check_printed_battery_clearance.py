"""Nominal G-code bead prisms versus maximum battery body, including trial offsets."""
from pathlib import Path
import argparse,json,hashlib,itertools,zipfile,xml.etree.ElementTree as ET
import cadquery as cq
from shapely.geometry import LineString,box
from shapely.ops import unary_union
from gcode_extrusion_paths import read_paths
parser=argparse.ArgumentParser();parser.add_argument('--part',default='film-battery-end-wide-250um-lower-first018');args=parser.parse_args()
O=Path(__file__).resolve().parent;D=O/'home-case-slice-review'/args.part
review=json.loads((D/'review.json').read_text());t=review['translation_mm'];g=D/'plate_1.gcode'
assert hashlib.sha256((O/review['source']).read_bytes()).hexdigest()==review['source_sha256']
with zipfile.ZipFile(D/(args.part+'.3mf')) as archive:
 assert archive.read('Metadata/plate_1.gcode')==g.read_bytes()
 m=list(map(float,ET.fromstring(archive.read('3D/3dmodel.model')).find('.//{*}build/{*}item').attrib['transform'].split()))
assert all(abs(a-b)<1e-7 for a,b in zip(m[:9],[-1,0,0,0,-1,0,0,0,1]))
heights={};h=None
for line in g.read_text().splitlines():
 if line.startswith('; Z_HEIGHT:'):h=float(line.split(':')[1])
 if line.startswith('; LAYER_HEIGHT:'):heights[h]=float(line.split(':')[1])
layers=[]
for h,paths in read_paths(g).items():
 beads=[LineString([(m[9]-x-t[0],m[10]-y-t[1]) for x,y in pts]).buffer(w/2) for pts,w,f in paths if not f.startswith('Support')]
 layers.append((h-t[2]-m[11]-heights[h],h-t[2]-m[11],unary_union(beads)))
p=O/'offset-pack-assembly-trial.step';b=cq.importers.importStep(str(p)).val().BoundingBox();rows=[]
for dx,dy,dz in itertools.product((-.1,0,.1),(-.25,0,.25),(-.1,0,.1)):
 footprint=box(b.xmin+dx,b.ymin+dy,b.xmax+dx,b.ymax+dy);hits=[];gaps=[]
 for lo,hi,area in layers:
  depth=min(hi,b.zmax+dz)-max(lo,b.zmin+dz)
  if depth<=1e-8:continue
  overlap=area.intersection(footprint).area
  if overlap>1e-8:hits.append({'layer_z_mm':[lo,hi],'area_mm2':overlap,'volume_mm3':overlap*depth})
  gaps.append(area.distance(footprint))
 rows.append({'offset_mm':[dx,dy,dz],'overlap_volume_mm3':sum(q['volume_mm3']for q in hits),'hit_layers':hits,'minimum_xy_gap_on_overlapping_z_layers_mm':min(gaps)})
r={'status':'NOMINAL_PRINTED_BATTERY_SCREEN_NOT_ASSEMBLY_APPROVAL','sources_sha256':{str(q.relative_to(O)):hashlib.sha256(q.read_bytes()).hexdigest() for q in (p,g,D/'review.json',D/(args.part+'.3mf'))},'cases':rows,'colliding_cases':sum(q['overlap_volume_mm3']>1e-7 for q in rows),'limits':['Nominal rectangular bead model only; real bead bulging, shrinkage and tolerance excluded.','X/Z +/-0.1mm and Y +/-0.25mm are exploratory offsets, not measured assembly allowances.','Battery body envelope only; stock harness, plug and insertion motion excluded.','XY clearance applies only on layers with vertical overlap and is not full 3D distance.']}
(D/'battery-clearance-review.json').write_text(json.dumps(r,indent=2)+'\n');print('colliding cases',r['colliding_cases'],'/27');print('nominal',next(q for q in rows if q['offset_mm']==[0,0,0]))
