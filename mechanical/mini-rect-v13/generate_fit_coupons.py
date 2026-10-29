"""Local printable clearance coupons, not a qualified case latch."""
from pathlib import Path
import json,subprocess
P=Path.home()/'Downloads/Pendant-v13-lid-fit-coupons';(P/'print').mkdir(parents=True,exist_ok=True)
CLI=str(Path.home()/'.local/bin/solidcraft-cli')
def box(c,name,x,y,z,w,d,h,op='new',target=None):
 c.extend([{'command':'sketch.create','params':{'plane':'XY','offset':z,'name':name+'_profile'}},{'command':'sketch.rectangle.rounded','params':{'p0':[x-w/2,y-d/2],'p1':[x+w/2,y+d/2],'radius':.1}},{'command':'sketch.finish','params':{}}])
 p={'distance':h,'operation':op,'body_name':name}
 if target:p['targets']=[target]
 c.append({'command':'solid.extrude','params':p})
rows=[]
for i,gap in enumerate([.2,.25,.3]):
 for sex in ['male','female']:
  name=f'{i+1}_{sex}_gap_{gap:.2f}';c=[]
  box(c,name,5,4,0,10,8,1.2)
  if sex=='male':box(c,'tongue',5,4,1.1,3,1.2,1.3,'join',name)
  else:
   # Minimum wall0.6mm even for largest0.30mm clearance.
   box(c,'socket',5,4,1.1,4.8,3,1.7,'join',name)
   box(c,'slot',5,4,1.4,3+2*gap,1.2+2*gap,1.6,'cut',name)
  f=P/'print'/(name+'.json');f.write_text(json.dumps({'commands':c}))
  subprocess.run([CLI,'run',str(f),'--out',str(f.with_suffix('.stl')),'--out',str(f.with_suffix('.3mf')),'--out',str(f.with_suffix('.step')),'--quiet'],check=True,stdout=subprocess.DEVNULL)
  rows.append({'name':name,'clearance_per_side_mm':gap,'sex':sex,'base_mm':[10,8,1.2],'orientation':'base flat on bed; tongue or socket opening up','pair':i+1})
(P/'manifest.json').write_text(json.dumps({'status':'UNSLICED_CLEARANCE_COUPONS_NOT_LATCH','parts':rows,'instructions':['Print each matching-number pair with the same nozzle/material/layer settings intended for the case','Invert the male over the female for insertion; record hand insertion/removal force and visible cracks','Clearance is per side, not total width; do not scale STL','Small parts: keep grouped by filename or mark the bases after printing','No clip/detent: these compare sliding fit only, not final retention strength','Flat coupon print orientation differs from portions of the final case; a case fit test is still required']},indent=2)+'\n')
print(P)
