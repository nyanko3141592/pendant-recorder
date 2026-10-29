from pathlib import Path
import json,re,math,hashlib,zipfile,xml.etree.ElementTree as ET,argparse
parser=argparse.ArgumentParser();parser.add_argument('--prefix',default='film-bridge');args=parser.parse_args()
O=Path(__file__).resolve().parent;D=O/('home-case-slice-review/'+args.prefix+'-separator');p=D/'plate_1.gcode'
with zipfile.ZipFile(D/(args.prefix+'-separator.3mf')) as archive:
 tree=ET.fromstring(archive.read('3D/3dmodel.model'));m=list(map(float,tree.find('.//{*}build/{*}item').attrib['transform'].split()))
x=y=z=0.;layer=None;width=.42;feature='';relative=False;old_e=0;paths={}
for line in p.read_text().splitlines():
 if line.startswith('; Z_HEIGHT:'):layer=float(line.split(':')[1])
 if line.startswith('; LINE_WIDTH:'):width=float(line.split(':')[1])
 if line.startswith('; FEATURE:'):feature=line.split(':',1)[1].strip()
 code=line.split(';')[0].strip();cmd=code.split(' ')[0];v={k:float(n)for k,n in re.findall(r'([XYZIJEF])(-?\d*\.?\d+)',code)}
 if cmd=='M83':relative=True
 if cmd=='M82':relative=False
 if cmd=='G92':old_e=v.get('E',old_e);continue
 if cmd not in ['G0','G1','G2','G3']:continue
 nx,ny,nz=v.get('X',x),v.get('Y',y),v.get('Z',z);de=v.get('E',0) if relative else v.get('E',old_e)-old_e
 if 'E'in v:old_e=v['E'] if not relative else old_e+v['E']
 points=[(x,y),(nx,ny)]
 if cmd in ['G2','G3'] and ('I'in v or 'J'in v):
  cx,cy=x+v.get('I',0),y+v.get('J',0);rad=math.hypot(x-cx,y-cy);a=math.atan2(y-cy,x-cx);end=math.atan2(ny-cy,nx-cx);sweep=(end-a)%(2*math.pi) if cmd=='G3'else-((a-end)%(2*math.pi));steps=max(2,math.ceil(abs(sweep)*rad/.01));points=[(cx+rad*math.cos(a+sweep*i/steps),cy+rad*math.sin(a+sweep*i/steps))for i in range(steps+1)]
 if de>0 and layer is not None and feature!='Custom' and any(math.dist(a,b)>1e-7 for a,b in zip(points,points[1:])):paths.setdefault(layer,[]).append((points,width,feature))
 x,y,z=nx,ny,nz

from shapely.geometry import LineString,MultiPoint
from shapely.ops import unary_union
import cadquery as cq
review=json.loads((D/'review.json').read_text());shift=review['translation_mm']
cap=cq.importers.importStep(str(O/'diagonal-recessed-joint-cap-trial.step')).val()
def bed(v):
 x,y,z=v.X+shift[0],v.Y+shift[1],v.Z+shift[2]
 return (m[0]*x+m[3]*y+m[6]*z+m[9],m[1]*x+m[4]*y+m[7]*z+m[10])
footprint=MultiPoint([bed(v) for v in cap.Vertices()]).convex_hull
rows=[]
for h,segs in sorted(paths.items()):
 support=[LineString(pts).buffer(w/2) for pts,w,f in segs if f.startswith('Support')]
 part=[LineString(pts).buffer(w/2) for pts,w,f in segs if not f.startswith('Support')]
 a=unary_union(support).intersection(footprint).area if support else 0
 b=unary_union(part).intersection(footprint).area if part else 0
 if a>1e-6 or b>1e-6:rows.append({'layer_top_mm':h,'support_under_cap_mm2':a,'part_in_cap_footprint_mm2':b})
result={'status':'SUPPORT_POSITION_REVIEW_NOT_REMOVAL_QUALIFICATION','source_gcode_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'footprint_area_mm2':footprint.area,'rows':rows,'nominal_cap_underside_print_z_mm':cap.BoundingBox().zmin+shift[2],'limits':['Projection coverage does not guarantee flatness or support removal without damage.','Support extrusion width is nominal; cap strength not measured.','Support layer heights may differ from part layers; previous-layer-only checker is not sufficient.']}
(D/'cap-support-position-review.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
