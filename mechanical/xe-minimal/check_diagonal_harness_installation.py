"""Integrated candidate and sampled rigid lowering; cannot certify a continuous path."""
from pathlib import Path
import cadquery as cq,json,hashlib,argparse
from wire_geometry import rounded
parser=argparse.ArgumentParser();parser.add_argument('--tapered',action='store_true');parser.add_argument('--retainer',action='store_true');args=parser.parse_args()
O=Path(__file__).resolve().parent
prefix='diagonal-tapered-harness' if args.tapered else 'diagonal-harness'
files={'board':'film-sensor-depopulated-board-study.step','separator':'diagonal-bridge-separator-trial.step','lower':'diagonal-tray-mounted-lower-trial.step','upper':'tab-clearance-upper-trial.step','battery':'offset-pack-assembly-trial.step'}
if args.tapered:files['lower']='diagonal-tapered-tray-lower-trial.step'
if args.retainer:
 files.update(lower='diagonal-recessed-cap-lower-trial.step',separator='diagonal-integral-retainer-separator-trial.step');prefix='diagonal-retainer-harness'
s={k:cq.importers.importStep(str(O/v)).val() for k,v in files.items()}
def box(w,l,h,x,y,z):return cq.Workplane('XY').box(w,l,h,centered=(True,False,False)).translate((x,y,z)).val()
def pose(q):return q.rotate((0,0,0),(0,0,1),-28).translate((7.6,-25.5,0))
body=pose(box(4.1,22,.5,0,0,-2.32));leads=[pose(box(.7,4,.5,x,22,-2.32)) for x in [-.95,.95]]
joints=[pose(box(.9,3,.8,x,23,-2.32)) for x in [-.9,.9]]
route_path=O/'diagonal-wire-offset-overpass-review.json';r=json.loads(route_path.read_text());chosen=r['rows'][r['selected_row']]
wires=[rounded(p,rad)[0] for p,rad in zip(chosen['paths_mm'],chosen['radii_mm'])]
parts={'sensor':cq.Compound.makeCompound([body]+leads),'joints':cq.Compound.makeCompound(joints),'wires':cq.Compound.makeCompound(wires)}
static={n:{k:{'overlap_mm3':q.intersect(v).Volume(),'gap_mm':q.distance(v)} for k,v in s.items()} for n,q in parts.items()}
internal={'wire_body_overlap_mm3':[w.intersect(body).Volume() for w in wires],'wire_other_lead_overlap_mm3':[wires[i].intersect(leads[1-i]).Volume() for i in range(2)],'wire_other_joint_overlap_mm3':[wires[i].intersect(joints[1-i]).Volume() for i in range(2)]}
rows=[]
# Seller-installed harness plus board move together; upper shell remains removed.
# Separator kept fixed is an explicit assembly hypothesis, not a presumed feasible order.
for dz in [0,.25,.5,1,2,4,8]:
 checks={n:{k:q.translate((0,0,dz)).intersect(s[k]).Volume() for k in ['lower','battery','separator']} for n,q in parts.items()}
 rows.append({'lift_mm':dz,'overlap_mm3':checks})
module_rows=[]
for dz in [0,.25,.5,1,2,4,8]:
 checks={n:{k:q.translate((0,0,dz)).intersect(s[k]).Volume() for k in ['lower','battery']} for n,q in {**parts,'separator':s['separator'],'board':s['board']}.items()}
 module_rows.append({'lift_mm':dz,'overlap_mm3':checks})
a=cq.Assembly(name='diagonal_harness_integrated_candidate')
for k,q in {**s,**parts}.items():a.add(q,name=k)
a.export(str(O/(prefix+'-integrated-study.step')))
out={'status':'INTEGRATED_HARNESS_AND_SAMPLED_INSTALLATION_NOT_ADOPTED','sources_sha256':{k:hashlib.sha256((O/v).read_bytes()).hexdigest() for k,v in files.items()},'route_source_sha256':hashlib.sha256(route_path.read_bytes()).hexdigest(),'static':static,'internal_checks':internal,'sampled_lowering':rows,'sampled_module_lowering':module_rows,'limits':['Discrete samples can prove collision at a sample but cannot prove a clear continuous insertion path.','Second scenario samples board and separator moving together with harness; continuous path still unproven.','Upper lid removed; separator and battery held fixed during lowering hypothesis.','Own lead/joint/wire overlap represents unresolved connection geometry.','No battery harness, solder wrap, cap, adhesive or print tolerances.']}
(O/(prefix+'-installation-review.json')).write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({'static_overlap_max_mm3':max(c['overlap_mm3'] for x in static.values() for c in x.values()),'internal':internal,'module_sample_collisions':[r for r in module_rows if max(v for q in r['overlap_mm3'].values() for v in q.values())>1e-8],'sample_collisions':[r for r in rows if max(v for q in r['overlap_mm3'].values() for v in q.values())>1e-8]},indent=2))
