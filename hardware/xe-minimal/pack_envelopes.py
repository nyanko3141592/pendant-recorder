"""Conservative rectangle packing screen; does not establish routability or mechanical fit."""
import json,random
from pathlib import Path
O=Path(__file__).resolve().parent
parts=json.loads((O/'placement-envelopes.json').read_text())
def hit(a,b):return a[0]<b[0]+b[2]-1e-8 and b[0]<a[0]+a[2]-1e-8 and a[1]<b[1]+b[3]-1e-8 and b[1]<a[1]+a[3]-1e-8
def subtract(free,b):
 result=[]
 for a in free:
  if not hit(a,b):result.append(a);continue
  x,y,w,h=a;X,Y,W,H=b
  if X>x:result.append((x,y,X-x,h))
  if X+W<x+w:result.append((X+W,y,x+w-X-W,h))
  if Y>y:result.append((x,y,w,Y-y))
  if Y+H<y+h:result.append((x,Y+H,w,y+h-Y-H))
 return [a for i,a in enumerate(result) if not any(i!=j and a!=b and a[0]>=b[0] and a[1]>=b[1] and a[0]+a[2]<=b[0]+b[2]+1e-8 and a[1]+a[3]<=b[1]+b[3]+1e-8 for j,b in enumerate(result))]
def attempt(W,H,seed):
 rng=random.Random(seed);free={s:[(.3,.3,W-.6,H-.6)] for s in ['F','B']};placed=[]
 order=sorted(parts,key=lambda p: (p['ref'] not in ['J1','J2'],-p['w']*p['h']*(1+rng.uniform(-.15,.15))))
 for p in order:
  w,h=p['w']+.2,p['h']+.2;s=p['side']
  if p['ref']=='J1':box=((W-w)/2,H-.3-h,w,h)
  elif p['ref']=='J2':box=((W-w)/2,.3,w,h)
  else:
   candidates=[(min(a[2]-w,a[3]-h),a[1],a[0],(a[0],a[1],w,h)) for a in free[s] if a[2]>=w and a[3]>=h]
   if not candidates:return None
   box=min(candidates)[-1]
  if any(q['side']==s and hit(box,q['box']) for q in placed):return None
  if min(box[:2])<.3-1e-8 or box[0]+w>W-.3+1e-8 or box[1]+h>H-.3+1e-8:return None
  free[s]=subtract(free[s],box)
  placed.append(dict(ref=p['ref'],side=s,box=box,x_mm=box[0]+.1-p['dx'],y_mm=box[1]+.1-p['dy']))
 return placed
results=[];best=None
for W,H in [(17,27),(18,27),(19,27),(20,27),(21,27),(22,27),(23,27),(24,27)]:
 found=None
 for seed in range(12):
  found=attempt(W,H,seed)
  if found:break
 results.append({'board_mm':[W,H],'found':found is not None,'trials':seed+1})
 if found and best is None:best={'board_mm':[W,H],'placements':found}
report={'status':'GEOMETRIC_SCREEN_ONLY','edge_margin_mm':.3,'extra_envelope_gap_mm':.2,'results':results,'best_found':best,'limitations':['Not a mathematical minimum; limited greedy search.','Library bounds include fabrication/courtyard graphics, not qualified component solids.','USB mouth direction and approach, microphone hole, decoupling adjacency, SWD access, trace escape and battery lead route not validated.','Fixed inherited front/back sides; battery clearance below bottom parts not included.','Do not treat board dimensions as completed product dimensions.']}
(O/'packing-screen.json').write_text(json.dumps(report,indent=2)+'\n')
print(results)
