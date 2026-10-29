"""Check revised support bearing and sensor envelopes; nominal geometry only."""
from pathlib import Path
import json, hashlib, argparse
import cadquery as cq
parser=argparse.ArgumentParser();parser.add_argument('--reinforced',action='store_true');args=parser.parse_args()
O=Path(__file__).resolve().parent
prefix='diagonal-reinforced' if args.reinforced else 'diagonal-support'
files={'separator':'diagonal-film-separator-trial.step','lower':'diagonal-film-lower-trial.step','board':'film-sensor-depopulated-board-study.step','battery':'offset-pack-assembly-trial.step','upper':'tab-clearance-upper-trial.step'}
if args.reinforced:files['separator']='diagonal-bridge-separator-trial.step'
s={k:cq.importers.importStep(str(O/v)).val() for k,v in files.items()}
def box(w,l,h,x,y,z):
 return cq.Workplane('XY').box(w,l,h,centered=(True,False,False)).translate((x,y,z)).val()
def pose(q):
 return q.rotate((0,0,0),(0,0,1),-28).translate((7.6,-25.5,0))
film=pose(cq.Compound.makeCompound([box(4.1,22,.5,0,0,-2.32)]+[box(.7,4,.5,x,22,-2.32) for x in [-.95,.95]]))
holders=pose(cq.Compound.makeCompound([box(1.7,3.8,1.6,x,22.6,-2.72) for x in [-.9,.9]]))
objects={'film':film,'holder_budget':holders}
checks={n:{k:{'overlap_mm3':q.intersect(v).Volume(),'distance_mm':q.distance(v)} for k,v in s.items()} for n,q in objects.items()}
# Coplanar intersection face at the designed bearing height, not an inferred volume.
z=-2.22
sepfaces=[f for f in s['separator'].Faces() if abs(f.BoundingBox().zmin-z)<1e-6 and abs(f.BoundingBox().zmax-z)<1e-6]
lowfaces=[f for f in s['lower'].Faces() if abs(f.BoundingBox().zmin-z)<1e-6 and abs(f.BoundingBox().zmax-z)<1e-6]
contacts=[]
for sf in sepfaces:
 for lf in lowfaces:
  c=sf.intersect(lf)
  if c.Area()>1e-8:
   b=c.BoundingBox();contacts.append({'area_mm2':c.Area(),'bounds_xy_mm':[b.xmin,b.ymin,b.xmax,b.ymax]})
a=cq.Assembly(name='diagonal_support_sensor_review')
for k,q in {**s,**objects}.items():a.add(q,name=k)
a.export(str(O/(prefix+'-sensor-study.step')))
r={'status':'NOMINAL_BEARING_AND_ENVELOPE_REVIEW_NOT_ADOPTED','sources_sha256':{k:hashlib.sha256((O/v).read_bytes()).hexdigest() for k,v in files.items()},'checks':checks,'bearing_contacts':contacts,'bearing_area_total_mm2':sum(c['area_mm2'] for c in contacts),'limits':['Coplanar area is nominal geometry, not load capacity or printed contact qualification.','Holder boxes are packaging budgets, not hollow fabricated holders.','Terminal width 0.7 mm is assumed, not manufacturer maximum.','Wire route, battery harness, assembly path, diagonal slot stiffness and printing remain unresolved.']}
(O/(prefix+'-contact-review.json')).write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps(r,indent=2))
