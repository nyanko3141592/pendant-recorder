from pathlib import Path
import argparse,json,zipfile,hashlib,xml.etree.ElementTree as ET
from shapely.geometry import LineString
from shapely.ops import unary_union
from gcode_extrusion_paths import read_paths
O=Path(__file__).resolve().parent
parser=argparse.ArgumentParser()
parser.add_argument('--wide350',action='store_true')
args=parser.parse_args()
part='film-battery-end-wide-350um-lower-first018' if args.wide350 else 'film-battery-end-wide-250um-lower'
margin=.35 if args.wide350 else .25
D=O/'home-case-slice-review'/part
review=json.loads((D/'review.json').read_text());t=review['translation_mm']
assert hashlib.sha256((O/review['source']).read_bytes()).hexdigest()==review['source_sha256']
assert hashlib.sha256((D/(D.name+'.3mf')).read_bytes()).hexdigest()==review['3mf_sha256']
assert review['slice_result']['return_code']==0
with zipfile.ZipFile(D/(D.name+'.3mf')) as z:
 embedded=[n for n in z.namelist() if n.endswith('/plate_1.gcode')]
 assert len(embedded)==1
 assert z.read(embedded[0])==(D/'plate_1.gcode').read_bytes()
 m=list(map(float,ET.fromstring(z.read('3D/3dmodel.model')).find('.//{*}build/{*}item').attrib['transform'].split()))
assert all(abs(a-b)<1e-7 for a,b in zip(m[:9],[-1,0,0,0,-1,0,0,0,1]))
def bed(x,y):
 x+=t[0];y+=t[1];return (m[0]*x+m[3]*y+m[9],m[1]*x+m[4]*y+m[10])
rows=[]
for h,paths in read_paths(D/'plate_1.gcode').items():
 z=h-t[2]
 if not -6.6<=z<=-2.5:continue
 beads=unary_union([LineString(pts).buffer(w/2) for pts,w,f in paths if 'wall' in f.lower()])
 for x in ([round(.85+i*.1,2) for i in range(158)] if args.wide350 else (1,8,16,16.5)):
  for name,lo,hi in [('negative',-28.3,-27-margin),('positive',margin,1.3)]:
   ray=LineString([bed(x,lo),bed(x,hi)])
   rows.append({'layer_top_mm':h,'CAD_z_top_mm':z,'CAD_x_mm':x,'end':name,'wall_bead_intersection_length_mm':beads.intersection(ray).length})
assert rows
r={'status':'NOMINAL_COMMANDED_BEAD_SCREEN_NOT_PRINT_APPROVAL','part':part,'end_relief_margin_mm':margin,'source_step_sha256':review['source_sha256'],'sources_sha256':{f:hashlib.sha256((D/f).read_bytes()).hexdigest() for f in ('plate_1.gcode',D.name+'.3mf','review.json')},'probes':rows,'zero_coverage_probes':sum(q['wall_bead_intersection_length_mm']<1e-7 for q in rows),'minimum_intersection_length_mm':min(q['wall_bead_intersection_length_mm'] for q in rows),'limits':['Sampled layer tops and X positions only, not continuous 3D wall coverage; wide350 samples X=0.85..16.55mm at 0.1mm spacing.','Commanded bead width is not measured plastic thickness.','No print, strength or tolerance approval.']}
(D/'end-wall-toolpaths.json').write_text(json.dumps(r,indent=2)+'\n');print(len(rows),'probes; empty',r['zero_coverage_probes'],'minimum coverage',r['minimum_intersection_length_mm'])
