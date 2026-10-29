"""Planar bounded-curvature necessary screen for same-orientation J2 moves."""
from pathlib import Path
import sys,json,math,hashlib
import numpy as np
P=Path(__file__).resolve().parent
sys.path.insert(0,str(P/'vendor/pythonrobotics'))
from dubins_path_planner import plan_dubins_path
source=P/'connector-relocation-screen.json'
old=json.loads(source.read_text());R=old['assumed_uturn_radius_mm'];budget=old['remaining_length_after_fixed_uturn_mm']
rows=[]
for row in old['rows']:
 if not row['passes_necessary_screens_only']:continue
 dx,dy=row['translation_mm']
 gx,gy=dx,22.02+dy
 px,py,yaw,modes,lengths=plan_dubins_path(0.,28.9,-math.pi/2,gx,gy,-math.pi/2,1/R,step_size=.01)
 length=sum(lengths)
 assert math.hypot(px[-1]-gx,py[-1]-gy)<1e-8
 assert abs(math.atan2(math.sin(yaw[-1]+math.pi/2),math.cos(yaw[-1]+math.pi/2)))<1e-8
 assert length+1e-8>=math.hypot(gx,gy-28.9)
 # Independently integrate exact constant-curvature primitives.
 x,y,a=0.,28.9,-math.pi/2
 for mode,s in zip(modes,lengths):
  if mode=='S':x+=s*math.cos(a);y+=s*math.sin(a)
  else:
   k=(1 if mode=='L' else -1)/R;b=a+k*s
   x+=(math.sin(b)-math.sin(a))/k;y+=(math.cos(a)-math.cos(b))/k;a=b
 assert math.hypot(x-gx,y-gy)<1e-8
 rows.append(dict(translation_mm=[dx,dy],planar_shortest_return_mm=length,modes=modes,segments_mm=lengths,passes_planar_min_length=length<=budget+1e-9,remaining_slack_mm=budget-length))
base=next(r for r in rows if r['translation_mm']==[0,0]);assert abs(base['planar_shortest_return_mm']-6.88)<1e-8
r=dict(status='PLANAR_TANGENT_LENGTH_SCREEN_NOT_3D_IMPOSSIBILITY_PROOF',source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),algorithm_provenance='vendor/pythonrobotics/provenance.json',initial_candidates=len(rows),passing_candidates=sum(r['passes_planar_min_length'] for r in rows),rows=rows,limitations=['R1.4 and wire endpoints assumed, not qualified manufacturer limits.','Shortest path assumes planar constant-height return and fixed endpoint headings; rejecting a planar route does not reject all 3D paths.','Obstacle-free shortest path does not establish an obstacle-free actual route.','No long-lead slack storage, wire-to-wire, self-contact, copper routing, case or insertion sweep proof.'])
(P/'connector-tangent-screen.json').write_text(json.dumps(r,indent=2)+'\n')
print('Planar tangent/length candidates:',r['passing_candidates'],'of',r['initial_candidates'])
print('Rejected:',[x['translation_mm'] for x in rows if not x['passes_planar_min_length']])
