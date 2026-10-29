"""Adaptive distance bounds for rigid vertical insertion; nominal CAD only."""
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

# Under pure translation, separation distance changes at most by translation length.
# If midpoint distance exceeds half interval length + numerical margin, every
# position in that interval is clear, conditional on the CAD distance accuracy.
def bound_path(shape,obstacle):
 pending=[(.01,8.)];certified=[];unresolved=[];evaluations=0
 while pending:
  lo,hi=pending.pop();mid=(lo+hi)/2
  d=shape.translate((0,0,mid)).distance(obstacle);evaluations+=1
  lower_bound=d-(hi-lo)/2
  if lower_bound>1e-5:
   certified.append({'range_mm':[lo,hi],'distance_lower_bound_mm':lower_bound})
  elif hi-lo<=.002 or evaluations>=400:
   unresolved.append({'range_mm':[lo,hi],'midpoint_distance_mm':d})
  else:pending.extend([(lo,mid),(mid,hi)])
 return {'range_mm':[.01,8.],'evaluations':evaluations,'certified_intervals':certified,'unresolved_intervals':unresolved,'fully_bounded_clear':not unresolved}
results={}
for name,q in {**parts,'separator':s['separator'],'board':s['board']}.items():
 results[name]={}
 for key in ['lower','battery']:
  results[name][key]=bound_path(q,s[key]);print(name,key,results[name][key]['evaluations'],results[name][key]['fully_bounded_clear'],flush=True)
out={'status':'ADAPTIVE_TRANSLATION_DISTANCE_BOUND_NOT_PHYSICAL_ASSEMBLY_QUALIFICATION','sources_sha256':{k:hashlib.sha256((O/v).read_bytes()).hexdigest() for k,v in files.items()},'route_sha256':hashlib.sha256(route_path.read_bytes()).hexdigest(),'results':results,'method':'Pure translation distance is 1-Lipschitz; midpoint distance minus half interval span bounds all positions. CAD distance numerical margin 0.00001 mm is an engineering assumption, not a certified kernel error bound.','limits':['Final lift interval 0 to 0.01 mm excluded because intentional bearing contact defeats a positive-distance certificate.','No material tolerance, motion rotation, wire flex, battery harness, adhesive or cap.','Parts are assumed held rigidly in their design positions; fixture and preassembly unresolved.','Shape-distance bounds are only as reliable as source geometry and numerical kernel.']}
(O/(prefix+'-continuous-review.json')).write_text(json.dumps(out,indent=2)+'\n')
