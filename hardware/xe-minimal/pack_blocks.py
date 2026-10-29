"""Pack fixed local IC/cap geometry using separate front/back collision checks."""
import json,random,sys
from pathlib import Path
O=Path(__file__).resolve().parent;source=sys.argv[1] if len(sys.argv)>1 else 'local-blocks.json';blocks=json.loads((O/source).read_text())['blocks']
geo=json.loads((O/'pad-geometry.json').read_text())
through_check=len(sys.argv)>2 and sys.argv[2]=='through'
def overlap(a,b):return a[0]<b[0]+b[2]+.2-1e-8 and b[0]<a[0]+a[2]+.2-1e-8 and a[1]<b[1]+b[3]+.2-1e-8 and b[1]<a[1]+a[3]+.2-1e-8
def attempt(W,H,seed):
 rng=random.Random(seed);placed=[];occupied={'F':[],'B':[]}
 order=sorted(blocks,key=lambda b:(0 if b['anchor']=='J1' else 1 if b['anchor']=='J2' else 2,-b['envelope_mm'][0]*b['envelope_mm'][1]*(1+rng.uniform(-.1,.1))))
 for block in order:
  xmin,ymin,xmax,ymax=block['bounds'];bw,bh=block['envelope_mm']
  if block['anchor']=='J1':positions=[((W-bw)/2-xmin,H-.3-ymax)]
  elif block['anchor']=='J2':positions=[(([.3,(W-bw)/2,W-.3-bw][seed%3])-xmin,.3-ymin)]
  else:positions=((.3+ix*.5-xmin,.3+iy*.5-ymin) for iy in range(max(0,int((H-.6-bh)/.5)+1)) for ix in range(max(0,int((W-.6-bw)/.5)+1)))
  if block['anchor'] not in ['J1','J2']:
   positions=list(positions)
   if (seed//3)%3==1:positions.sort(key=lambda p:(p[0],p[1]))
   elif (seed//3)%3==2:positions.sort(key=lambda p:(p[1],-p[0]))
  found=None;tested=0
  for x,y in positions:
   tested+=1;ps=[];ok=True
   for p in block['parts']:
    a,b,w,h=p['box'];box=[a+x,b+y,w,h]
    if box[0]<.3-1e-8 or box[1]<.3-1e-8 or box[0]+w>W-.3+1e-8 or box[1]+h>H-.3+1e-8 or any(overlap(box,q) for q in occupied[p['side']]):ok=False;break
    ps.append(dict(ref=p['ref'],x_mm=p['x']+x,y_mm=p['y']+y,side=p['side'],box=box))
   if ok and through_check:
    for p in ps:
     other='B' if p['side']=='F' else 'F'
     for a,b,w,h in geo[p['ref']].get('through',[]):
      hole=[a+p['x_mm'],b+p['y_mm'],w,h]
      if any(overlap(hole,q) for q in occupied[other]) or any(q['ref']!=p['ref'] and q['side']==other and overlap(hole,q['box']) for q in ps):ok=False;break
     if not ok:break
   if ok:found=ps;break
  if found is None:
   if W==26 and H==29 and seed==0:(O/'packing-failure-debug.json').write_text(json.dumps({'block':block,'tested':tested,'placed':placed},indent=2)+'\n')
   return None,block['anchor']
  placed.extend(found)
  for p in found:
   occupied[p['side']].append(p['box'])
   if through_check:
    for a,b,w,h in geo[p['ref']].get('through',[]):occupied['B' if p['side']=='F' else 'F'].append([a+p['x_mm'],b+p['y_mm'],w,h])
 return placed,None
results=[];best=None
for W,H in ([(20,27),(22,27),(24,27),(22,29),(24,29),(26,29)] if through_check else [(20,27),(22,27),(24,27),(26,29)]):
 for seed in range(24 if through_check else 3):
  found,failed=attempt(W,H,seed)
  if found:break
 results.append({'board_mm':[W,H],'found':found is not None,'last_unplaced_block':failed,'trials':seed+1})
 if found:best={'board_mm':[W,H],'placements':found};break
report={'status':'BLOCK_PLACEMENT_SCREEN_NOT_ROUTED','results':results,'best_found':best,'limitations':['Limited greedy0.5mm search, no rotation or side changes; failures are not impossibility proofs.','Local19 capacitor relationships retained but ground loops/vias still unverified.','No battery harness, acoustic, USB insertion, crystal or full trace feasibility checks.']}
(O/('through-signal-block-packing-screen.json' if through_check else 'signal-block-packing-screen.json' if source=='signal-blocks.json' else 'block-packing-screen.json')).write_text(json.dumps(report,indent=2)+'\n');print(results,flush=True)
