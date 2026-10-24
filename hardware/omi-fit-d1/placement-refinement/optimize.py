"""Electrical placement candidate search. Never overwrites the released/current board."""
import json,math,random,time,sys
from pathlib import Path
import numpy as np
P=Path(__file__).resolve().parents[1]
d=json.load(open(sys.argv[1] if len(sys.argv)>1 else P/'placement.json'));parts=json.load(open(P/'parts.json'));refs=[p['ref'] for p in parts];idx={r:i for i,r in enumerate(refs)}
N=len(refs);xy=np.array([[d['placements'][r]['x'],d['placements'][r]['y']] for r in refs]);wh=np.array([d['placements'][r]['bbox'][2:] for r in refs]);side=np.array([d['placements'][r]['side']=='B' for r in refs]);rot=np.array([d['placements'][r]['rotation'] for r in refs]);rot[idx['U1']]=180
# Terminal locations of U1 after 180-degree rotation, relative to footprint centre.
anchors={'C1':(-8.45,2.54),'C2':(-2.26,1.85),'C3':(-2.95,-4.34),'C5':(-3.95,-4.34),'C6':(-9.14,-2.15),'C7':(-9.14,-2.15),'Y1':(-9.14,.60)}
anchors={idx[k]:2*xy[idx['U1']]-np.array(v) for k,v in anchors.items()}
links=[]
def link(a,b,w):links.append((idx[a],idx[b],w))
for a,b,w in [('Y1','C11',12),('Y1','C12',12),('J1','U2',15),('U2','R8',6),('U2','R9',6),('U3','C13',15),('U3','C14',15),('U3','R10',10),('U4','C15',15),('U4','C16',15),('U6','C18',15),('U6','C19',15),('U8','C22',20),('U9','C23',20),('U9','C24',20),('U10','C25',15),('U11','C26',15),('U11','C27',10),('U8','U9',7),('U10','U11',5),('J1','R6',5),('J1','R7',5),('J1','Q1',5),('J1','D2',5),('U1','C9',4),('R33','R34',4),('R34','C28',4)]:link(a,b,w)
nets={}
for p in parts:
 for pin in p['pins']:
  n=pin['net']
  if n and n not in ['GND','V3V3','V1V8','SD_V3','VBUS','BAT','SYS']:nets.setdefault(n,set()).add(p['ref'])
for rr in nets.values():
 rr=list(rr)
 for i in range(len(rr)):
  for j in range(i):link(rr[i],rr[j],1/max(1,len(rr)-1))
L=np.array(links);aa=L[:,0].astype(int);bb=L[:,1].astype(int);ww=L[:,2];an=np.array(list(anchors));at=np.array(list(anchors.values()))
fixed={idx[r] for r in ['J1','J2','J3','U1','U8','U11','TH1','Y1']};front={idx[r] for r in ['SW1','D1','D6']};dual={idx[r] for r in ['J3','U8']}
# J1 through-board holes, from the standard footprint relative to bbox centre.
holes=np.array([[-2.89,5.185,.9,.9],[2.89,5.185,.9,.9],[-4.32,4.685,1.5,2.6],[4.32,4.685,1.5,2.6],[-4.32,8.865,1.5,2.3],[4.32,8.865,1.5,2.3]])
def valid(i):
 x,y=xy[i];w,h=wh[i]
 if (abs(x)+w/2+.02)**2+(abs(y)+h/2+.02)**2>11.35**2:return False
 same=(side==side[i]);same[i]=False
 if i in dual:same[:]=True;same[i]=False
 else:
  for j in dual:same[j]=True
 hit=(abs(xy[:,0]-x)<(wh[:,0]+w)/2+.04)&(abs(xy[:,1]-y)<(wh[:,1]+h)/2+.04)&same
 if hit.any():return False
 if side[i]:
  if ((abs(holes[:,0]-x)<(holes[:,2]+w)/2)&(abs(holes[:,1]-y)<(holes[:,3]+h)/2)).any():return False
 return True
def cost():
 dist=np.linalg.norm(xy[aa]-xy[bb],axis=1)
 c=np.sum(ww*(dist+1.0*(side[aa]!=side[bb])))
 da=np.linalg.norm(xy[an]-at,axis=1)
 return c+np.sum(30*da+30*np.maximum(da-2.5,0)**2+30*(side[an]!=True))
rng=random.Random(41);mov=[i for i in range(N) if i not in fixed];c=cost();best=c;state=(xy.copy(),wh.copy(),side.copy(),rot.copy());start=time.time()
for it in range(70000):
 i=rng.choice(mov);old=(xy.copy(),wh.copy(),side.copy(),rot.copy());changed=[i]
 if rng.random()<.12:
  target=np.array([.3,-2.6]) if refs[i]=='Y1' else anchors.get(i,xy[rng.choice(mov)])
  xy[i]=target+np.array([rng.uniform(-2,2),rng.uniform(-2,2)])
  hit=(abs(xy[:,0]-xy[i,0])<(wh[:,0]+wh[i,0])/2+.04)&(abs(xy[:,1]-xy[i,1])<(wh[:,1]+wh[i,1])/2+.04)&((side==side[i])|np.isin(np.arange(N),list(dual)));hit[i]=False
  bumps=list(np.flatnonzero(hit))
  if any(j in fixed for j in bumps):xy,wh,side,rot=old;continue
  changed+=bumps
  for j in bumps:xy[j]=[1000+j*10,1000]
  failed=False
  for j in bumps:
   choices=[]
   for trial in range(70):
    xy[j]=np.array([rng.uniform(-10,10),rng.uniform(-10,10)])
    if valid(j):choices.append((cost(),xy[j].copy()))
   if not choices:failed=True;break
   xy[j]=min(choices,key=lambda t:t[0])[1]
  if failed:xy,wh,side,rot=old;continue
 elif rng.random()<.65:
  j=rng.choice(mov);changed=[i,j];xy[[i,j]]=xy[[j,i]];side[[i,j]]=side[[j,i]]
 else:
  xy[i]+=np.array([rng.uniform(-1.5,1.5),rng.uniform(-1.5,1.5)])
  if rng.random()<.05:side[i]=not side[i]
  if rng.random()<.1:wh[i]=wh[i][::-1];rot[i]=(rot[i]+90)%180
 if any(side[k] and k in front for k in changed) or not all(valid(k) for k in changed):xy,wh,side,rot=old;continue
 nc=cost();temp=30*(1-(it%70000)/70000)**3+.1
 if nc<c or rng.random()<math.exp(min(0,(c-nc)/temp)):
  c=nc
  if c<best:best=c;state=(xy.copy(),wh.copy(),side.copy(),rot.copy())
 else:xy,wh,side,rot=old
 if it%70000==69999:xy,wh,side,rot=[v.copy() for v in state];c=best;print(it,best,flush=True)
xy,wh,side,rot=state
out={}
for i,r in enumerate(refs):out[r]=dict(x=float(xy[i,0]),y=float(xy[i,1]),side='B' if side[i] else 'F',rotation=int(rot[i]),bbox=[float(xy[i,0]-wh[i,0]/2),float(xy[i,1]-wh[i,1]/2),float(wh[i,0]),float(wh[i,1])])
report={'status':'ELECTRICAL_PLACEMENT_CANDIDATE_UNROUTED','cost':best,'elapsed_s':time.time()-start,'placements':out,'mcu_anchor_distances_mm':{refs[i]:float(np.linalg.norm(xy[i]-anchors[i])) for i in anchors}}
(P/'placement-refinement/candidate.json').write_text(json.dumps(report,indent=2));print(json.dumps(report['mcu_anchor_distances_mm'],indent=2))
