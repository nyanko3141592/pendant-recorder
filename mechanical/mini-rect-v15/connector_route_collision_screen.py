"""Sample three shortest planar return paths against current part envelopes."""
from pathlib import Path
import sys,json,math,hashlib
import numpy as np
from scipy.spatial import cKDTree
P=Path(__file__).resolve().parent
sys.path.insert(0,str(P/'vendor/pythonrobotics'))
from dubins_path_planner import plan_dubins_path
source=P.parents[1]/'hardware/mini-rect-v15/input-control-pa2-pb5/usb-reference-power.mechanical-handoff.json'
h=json.loads(source.read_text());candidates=json.loads((P/'connector-tangent-screen.json').read_text())
R=1.4;wire_radius=.4
parts=[]
for p in h['parts']:
 if p['ref']=='J2' or p['side']!='B':continue
 lo=np.array([2+p['x_mm']-p['w_mm']/2,1.5+p['y_mm']-p['d_mm']/2,8.6-p['height_mm']])
 hi=lo+np.array([p['w_mm'],p['d_mm'],p['height_mm']]);parts.append((p['ref'],lo,hi))
rows=[]
for c in candidates['rows']:
 if not c['passes_planar_min_length']:continue
 dx,dy=c['translation_mm'];wires=[]
 for x in (8.05,9.25,10.45):
  px,py,_,_,_=plan_dubins_path(x,28.9,-math.pi/2,x+dx,22.02+dy,-math.pi/2,1/R,step_size=.005)
  initial=np.array([[x,y,4.5] for y in np.linspace(28.5,28.9,81)])
  ts=np.linspace(0,math.pi,881)
  turn=np.array([[x,28.9+R*math.sin(t),4.5+R*(1-math.cos(t))] for t in ts])
  wires.append(np.vstack((initial,turn,np.column_stack((px,py,np.full(len(px),7.3))))))
 pair=min(float(cKDTree(wires[i]).query(wires[j])[0].min()) for i,j in ((0,1),(1,2),(0,2)))
 hits=[]
 for i,w in enumerate(wires):
  for ref,lo,hi in parts:
   dist=np.linalg.norm(np.maximum(np.maximum(lo-w,w-hi),0),axis=1)
   if float(dist.min())<wire_radius:hits.append(dict(wire=i+1,part=ref,min_sampled_center_to_envelope_mm=float(dist.min())))
 points=np.concatenate(wires)
 case_hit=bool(np.any(points[:,0]-wire_radius<1.2) or np.any(points[:,0]+wire_radius>28.8) or np.any(points[:,1]+wire_radius>30.8))
 rows.append(dict(translation_mm=[dx,dy],part_hits=hits,min_sampled_wire_center_distance_mm=pair,sampled_wire_collision=pair<2*wire_radius,case_wall_violation=case_hit,no_sampled_collision=not hits and pair>=2*wire_radius and not case_hit,unused_length_at_12mm=c['remaining_slack_mm']))
r=dict(status='SHORTEST_PATH_SAMPLE_SCREEN_NOT_HARNESS_FIT',source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),rows=rows,clear_sample_count=sum(r['no_sampled_collision'] for r in rows),limitations=['Only chosen shortest return path per position; other routes may avoid detected interference.','Unused wire length has not been routed, even at minimum 12mm; 15/18mm cases not addressed.','Centerline samples and part AABBs only; absence of sample hits is not continuous clearance proof.','Wire OD0.8mm, radius1.4mm, start/end locations and mated height remain assumptions.','J2 intentionally excluded at termination; connector body, mating sweep, self-contact, thermal and acoustic allocations, case supports and pack emergence not qualified.'])
(P/'connector-route-collision-screen.json').write_text(json.dumps(r,indent=2)+'\n')
print('Without sampled collisions:',r['clear_sample_count'],'of',len(rows))
print('Clear translations:',[r['translation_mm'] for r in rows if r['no_sampled_collision']])
print('Hit references:',sorted({hit['part'] for row in rows for hit in row['part_hits']}))
