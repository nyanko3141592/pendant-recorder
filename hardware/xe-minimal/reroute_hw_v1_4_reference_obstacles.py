#!/usr/bin/env python3
"""Reroute selected two-ended inner components without adding layers or vias.
Accept only clean DRC/parity, shorter missing USB reference and <=1.5x length.
"""
from pathlib import Path
import pcbnew as k,wx,numpy as np
import json,math,heapq,collections,subprocess,shutil,hashlib
def mm(v): return k.FromMM(float(v))
app=wx.App(False)
H=Path(__file__).resolve().parent;D=H/'costdown/HW-V1.4-EVT-4LAYER-27P5/route';P=D/'hw-v1.4-evt-4layer-27p5-routed-candidate.kicad_pcb';W=D/'reference-reroute';W.mkdir(exist_ok=True)
backup=W/'before.kicad_pcb'
if not backup.exists():shutil.copy2(P,backup)
T=W/'trial.kicad_pcb'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copy2(P.with_suffix(ext),T.with_suffix(ext))
def xy(q):return np.array([k.ToMM(q.x),k.ToMM(q.y)])
def missing(board):
 p=next(z for z in board.Zones() if z.GetLayer()==k.In1_Cu and z.GetNetname()=='/GND').GetFilledPolysList(k.In1_Cu);m=0.
 for t in board.GetTracks():
  if isinstance(t,k.PCB_VIA) or t.GetLayer()!=k.F_Cu or t.GetNetname() not in ['/USB_DP','/USB_DM']:continue
  a=xy(t.GetStart());e=xy(t.GetEnd());l=k.ToMM(t.GetLength());n=max(1,math.ceil(l/.025))
  for i in range(n):
   q=a+(e-a)*(i+.5)/n
   if not p.Contains(k.VECTOR2I(mm(q[0]),mm(q[1]))):m+=l/n
 return m
results=[]
import sys
requested=sys.argv[1:] or ['/BAT','/PDM_DATA','/PDM_CLK','/VBUS_GATE']
for name in requested:
 for layer in [k.In2_Cu,k.F_Cu,k.B_Cu]:
  b=k.LoadBoard(str(P));alltracks=b.GetTracks();ts=[t for t in alltracks if not isinstance(t,k.PCB_VIA) and t.GetNetname()==name and t.GetLayer()==k.In1_Cu]
  if not ts:break
  deg=collections.Counter((v.x,v.y) for t in ts for v in [t.GetStart(),t.GetEnd()]);ends=[p for p,n in deg.items() if n==1]
  assert len(ends)==2 and all(n<=2 for n in deg.values()),name
  a,c=[np.array([k.ToMM(x),k.ToMM(y)]) for x,y in ends];width=max(k.ToMM(t.GetWidth()) for t in ts);oldlength=sum(k.ToMM(t.GetLength()) for t in ts);net=ts[0].GetNetCode();before=missing(b)
  for t in ts:b.RemoveNative(t)
  obstacles=[];rects=[]
  for t in b.GetTracks():
   if t.GetNetname()==name:continue
   via=isinstance(t,k.PCB_VIA)
   if via or t.GetLayer()==layer:
    radius=k.ToMM(t.GetWidth(layer) if via else t.GetWidth())/2+.105+width/2
    if via:radius=max(radius,k.ToMM(t.GetDrillValue())/2+.205+width/2)
    obstacles.append((xy(t.GetStart()),xy(t.GetEnd()),radius))
  for f in b.GetFootprints():
   for pad in f.Pads():
    if pad.GetNetname()==name or not pad.IsOnLayer(layer):continue
    bb=pad.GetBoundingBox();margin=.11+width/2
    rects.append((k.ToMM(bb.GetX())-margin,k.ToMM(bb.GetRight())+margin,k.ToMM(bb.GetY())-margin,k.ToMM(bb.GetBottom())+margin))
  step=.05;xs=np.arange(.25,27.251,step);ys=np.arange(-.25,26.751,step);X,Y=np.meshgrid(xs,ys,indexing='ij');free=np.ones(X.shape,dtype=bool)
  for s,e,r in obstacles:
   vx,vy=e-s;den=vx*vx+vy*vy;f=np.clip(((X-s[0])*vx+(Y-s[1])*vy)/den,0,1) if den else 0
   free &= (X-s[0]-f*vx)**2+(Y-s[1]-f*vy)**2>=r*r
  for x0,x1,y0,y1 in rects:free &= ~((X>=x0)&(X<=x1)&(Y>=y0)&(Y<=y1))
  def clearline(s,e):
   for a0,b0,r in obstacles:
    v=b0-a0;w=e-s
    # Distance through dense samples is conservative with 0.005mm margin.
    n=max(2,math.ceil(float(np.linalg.norm(w))/.025)+1);q=s+np.linspace(0,1,n)[:,None]*w
    den=float(v@v);f=np.clip(((q-a0)@v)/den,0,1) if den else np.zeros(n)
    if np.any(np.sum((q-a0-f[:,None]*v)**2,axis=1)<r*r):return False
   for x0,x1,y0,y1 in rects:
    n=max(2,math.ceil(float(np.linalg.norm(e-s))/.025)+1);q=s+np.linspace(0,1,n)[:,None]*(e-s)
    if np.any((q[:,0]>=x0)&(q[:,0]<=x1)&(q[:,1]>=y0)&(q[:,1]<=y1)):return False
   return True
  def nearby(p):
   ix=int(round((p[0]-.25)/step));iy=int(round((p[1]+.25)/step));cand=[]
   for i in range(max(0,ix-5),min(len(xs),ix+6)):
    for j in range(max(0,iy-5),min(len(ys),iy+6)):
     if free[i,j]:cand.append((i,j))
   return sorted(cand,key=lambda ij:(xs[ij[0]]-p[0])**2+(ys[ij[1]]-p[1])**2)[:12]
  point=lambda ij:np.array([xs[ij[0]],ys[ij[1]]])
  def search(start,goal):
   starts=[v for v in nearby(start) if clearline(start,point(v))];goals={v for v in nearby(goal) if clearline(point(v),goal)};cost={};parent={};queue=[]
   for v in starts:cost[v]=float(np.linalg.norm(point(v)-start));parent[v]=None;heapq.heappush(queue,(cost[v]+float(np.linalg.norm(point(v)-goal)),v))
   closed=set();end=None
   while queue:
    _,v=heapq.heappop(queue)
    if v in closed:continue
    closed.add(v)
    if v in goals:end=v;break
    for dx,dy in [(1,0),(-1,0),(0,1),(0,-1),(1,1),(1,-1),(-1,1),(-1,-1)]:
     q=(v[0]+dx,v[1]+dy)
     if q in closed or not(0<=q[0]<len(xs) and 0<=q[1]<len(ys)) or not free[q]:continue
     if dx and dy and not(free[v[0]+dx,v[1]] and free[v[0],v[1]+dy]):continue
     g=cost[v]+step*math.hypot(dx,dy)
     if g<cost.get(q,1e99):cost[q]=g;parent[q]=v;heapq.heappush(queue,(g+float(np.linalg.norm(point(q)-goal)),q))
   if end is None:return None,len(closed)
   path=[goal];v=end
   while v is not None:path.append(point(v));v=parent[v]
   path.append(start);path.reverse();return path,len(closed)
  def on_removed(q):
   for t in ts:
    s=xy(t.GetStart());e=xy(t.GetEnd());v=e-s;den=float(v@v);f=np.clip(float((q-s)@v)/den,0,1) if den else 0
    if np.linalg.norm(q-s-f*v)<.001:return True
   return False
  # Degree-two track nodes may still connect to a via and another-layer branch.
  mids=[xy(t.GetPosition()) for t in alltracks if isinstance(t,k.PCB_VIA) and t.GetNetname()==name and on_removed(xy(t.GetPosition())) and np.linalg.norm(xy(t.GetPosition())-a)>.001 and np.linalg.norm(xy(t.GetPosition())-c)>.001]
  checkpoints=[a]+sorted(mids,key=lambda q:float(np.linalg.norm(q-a)))+[c]
  path=[];visits=0;found=True
  for start,goal in zip(checkpoints,checkpoints[1:]):
   leg,n=search(start,goal);visits+=n
   if leg is None:found=False;break
   path+=leg if not path else leg[1:]
  row={'net':name,'target_layer':b.GetLayerName(layer),'required_via_waypoints':[p.tolist() for p in checkpoints],'path_found':found,'visited':visits,'accepted':False}
  if found:
   # Collapse collinear grid runs; avoid expensive arbitrary-angle shortcuts.
   simple=[path[0]]
   for i in range(1,len(path)-1):
    u=path[i]-simple[-1];v=path[i+1]-path[i]
    if abs(u[0]*v[1]-u[1]*v[0])>1e-8:simple.append(path[i])
   simple.append(path[-1]);length=sum(float(np.linalg.norm(z-s)) for s,z in zip(simple,simple[1:]));row['old_length_mm']=oldlength;row['new_length_mm']=length
   if length<=oldlength*1.5 and all(clearline(s,z) for s,z in zip(simple,simple[1:])):
    for s,z in zip(simple,simple[1:]):
     if np.linalg.norm(z-s)<1e-7:continue
     t=k.PCB_TRACK(b);t.SetStart(k.VECTOR2I(mm(s[0]),mm(s[1])));t.SetEnd(k.VECTOR2I(mm(z[0]),mm(z[1])));t.SetWidth(mm(width));t.SetLayer(layer);t.SetNetCode(net);b.AddNative(t);t.thisown=False
    k.SaveBoard(str(T),b)
    subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc','--refill-zones','--save-board','--schematic-parity','--severity-all','--format','json','-o',str(W/'trial-drc.json'),str(T)],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
    drc=json.loads((W/'trial-drc.json').read_text());bad=[v for v in drc['violations'] if v['type']!='lib_footprint_issues'];row['geometric']=len(bad);row['unconnected']=len(drc['unconnected_items']);row['parity']=len(drc['schematic_parity']);after=missing(k.LoadBoard(str(T)));row['missing_usb_reference_before_mm']=before;row['missing_usb_reference_after_mm']=after
    row['accepted']=not bad and not drc['unconnected_items'] and not drc['schematic_parity'] and after<before-.05
    if row['accepted']:shutil.copy2(T,P);shutil.copy2(T,W/(name.strip('/')+'-accepted.kicad_pcb'))
  results.append(row);(W/'review.json').write_text(json.dumps(results,indent=2)+'\n');print(json.dumps(row),flush=True)
  if row['accepted']:break
print('complete',flush=True)
