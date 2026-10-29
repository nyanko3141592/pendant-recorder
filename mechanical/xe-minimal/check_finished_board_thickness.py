"""Conservative finished-thickness screen, bottom PCB seating plane fixed at Z=0."""
from pathlib import Path
import cadquery as cq
import hashlib,json,argparse
a=argparse.ArgumentParser();a.add_argument("--upper",default="rounded-glue-reinforced-upper-study.step");a.add_argument("--output",default="finished-board-thickness-review.json");args=a.parse_args()
O=Path(__file__).resolve().parent
files={'board':'glue-case-candidate-integrated-board.step','lower':'offset-pack-lower-trial.step','upper':args.upper,'separator':'support-notched-separator-trial.step','battery':'offset-pack-assembly-trial.step'}
s={n:cq.importers.importStep(str(O/f)).val() for n,f in files.items()}
nom=.8264;low=.73;high=.93;rows=[];counts={'bottom_fixed':0,'upper_or_crossing':0,'substrate':0}
for i,solid in enumerate(s['board'].Solids()):
 b=solid.BoundingBox()
 if b.xlen>23.9 and b.ylen>26.9:
  kind='substrate';zmin=0;zmax=high
 elif b.zmax<=.0001:
  kind='bottom_fixed';zmin=b.zmin;zmax=b.zmax
 else:
  kind='upper_or_crossing';zmin=b.zmin+low-nom;zmax=b.zmax+high-nom
 counts[kind]+=1
 prism=cq.Workplane('XY').box(b.xlen,b.ylen,zmax-zmin,centered=(False,False,False)).translate((b.xmin,b.ymin,zmin)).val()
 for name in ['lower','upper','separator','battery']:
  v=prism.intersect(s[name]).Volume()
  if v>1e-7:
   end=[]
   if kind=='upper_or_crossing':
    for t in [low,nom,high]:end.append({'thickness_mm':t,'exact_body_intersection_mm3':solid.translate((0,0,t-nom)).intersect(s[name]).Volume()})
   rows.append({'solid_index':i,'kind':kind,'other':name,'enclosing_prism_overlap_mm3':v,'nominal_bbox_mm':[b.xmin,b.xmax,b.ymin,b.ymax,b.zmin,b.zmax],'endpoint_checks':end})
r={'status':'CONSERVATIVE_THICKNESS_SCREEN_NOT_ASSEMBLY_APPROVAL','datum':'PCB bottom seating plane fixed at Z=0; upper and crossing solids translated by finished thickness delta; bottom bodies fixed','nominal_mm':nom,'finished_range_mm':[low,high],'counts':counts,'flags':rows,'source_sha256':{n:hashlib.sha256((O/f).read_bytes()).hexdigest() for n,f in files.items()},'limitations':['Bounding prism may flag empty space; endpoint exact checks cannot alone prove continuous clearance','Upper/crossing solid classification from geometry, not original STEP component labels','PCB rectangular envelope deliberately encloses substrate including holes and entire finished thickness','Solder standoff, component tolerances, case print error, warpage, leads and mating plug not included','No geometry changed or release approval']}
(O/args.output).write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
