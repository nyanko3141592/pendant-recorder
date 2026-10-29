"""Conservative rectangular sensor insulation envelopes versus nominal print beads."""
from pathlib import Path
import argparse,runpy,contextlib,io,json,math,sys
from shapely.geometry import Polygon
O=Path(__file__).resolve().parent
parser=argparse.ArgumentParser();parser.add_argument('--clearance200',action='store_true');args=parser.parse_args()
saved=sys.argv[:]
sys.argv=['check_lead_wrap_full_mating.py','--lower','film-battery-end-wide-350um-lower-first018','--output','film-battery-wide350-first018-mating-review.json']
if args.clearance200:
 sys.argv=['check_lead_wrap_full_mating.py','--lower','film-sensor-clearance-200um-lower-first018','--separator','film-sensor-clearance-200um-supported-flipped-separator','--output','film-sensor-clearance-200um-mating-review.json']
try:
 with contextlib.redirect_stdout(io.StringIO()):state=runpy.run_path(str(O/'check_lead_wrap_full_mating.py'))
finally:sys.argv=saved
angle=math.radians(-28)
def xy(x,y):return (7.6+x*math.cos(angle)-y*math.sin(angle),-25.5+x*math.sin(angle)+y*math.cos(angle))
rows=[]
for sign in (-1,1):
 # Transition box encloses both endpoint cross sections, including loft overlap.
 specs=[('joint',sign*.9-.55,sign*.9+.55,23.2,26,-2.47,-1.37),('lead_wrap',sign*.95-.43,sign*.95+.43,22,23.05,-2.4,-1.66),('transition_bound',min(sign*.95-.43,sign*.9-.55),max(sign*.95+.43,sign*.9+.55),23,23.4,-2.47,-1.37)]
 for label,x0,x1,y0,y1,z0,z1 in specs:
  poly=Polygon([xy(x,y)for x,y in ((x0,y0),(x1,y0),(x1,y1),(x0,y1))])
  for name,layers in state['parts'].items():
   hits=[];gaps=[]
   for layer in layers:
    depth=min(z1,layer['top'])-max(z0,layer['bottom'])
    if depth<=1e-7:continue
    area=poly.intersection(layer['area']).area
    if area>1e-7:hits.append({'print_z_mm':layer['print_z'],'overlap_volume_mm3':depth*area})
    gaps.append(poly.distance(layer['area']))
   rows.append({'sign':sign,'envelope':label,'part':name,'hits':hits,'minimum_xy_gap_on_shared_z_mm':min(gaps)if gaps else None})
r={'status':'PROVISIONAL_INSULATION_BUDGET_PRINT_SCREEN','sources':state['sources'],'rows':rows,'limits':['Conservative transition rectangular bound is larger than the lofted budget.','Actual tape, solder, lead tolerances and support residue are not qualified.','Only lower and separator beads are checked, not board/upper/body/harness or assembly motion.','Gap values are XY minima on overlapping Z layers, not global 3D clearance.']}
(O/('film-sensor-clearance-200um-printed-review.json' if args.clearance200 else 'film-wide350-printed-sensor-review.json')).write_text(json.dumps(r,indent=2)+'\n')
for row in rows:print(row['sign'],row['envelope'],row['part'],'hits',len(row['hits']),'gap',row['minimum_xy_gap_on_shared_z_mm'])
