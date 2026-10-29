"""Local single-layer route search. Conservative pad bounds; DRC remains authoritative."""
from pathlib import Path
import wx,pcbnew as k,numpy as np,math,heapq,json,shutil,subprocess,hashlib
app=wx.App(False)
P=Path(__file__).resolve().parent
src=P/'usb-inner-dp-search-candidate.kicad_pcb';b=k.LoadBoard(str(src))
def xy(p):return k.ToMM(p.x),k.ToMM(p.y)
ids={'37e718fd-3138-47e7-8a18-1a28297a20dc','e08ce9f0-5270-4cca-8d42-94e59856a7a6'}
ts=[t for t in b.GetTracks() if t.m_Uuid.AsString() in ids];assert len(ts)==2
width=max(k.ToMM(t.GetWidth()) for t in ts);net=ts[0].GetNetCode()
a=(9.5573,11.7634);z=(13.4658,20.8398)
for t in ts:b.DeleteNative(t)
step=.02;lo=(7.,11.);shape=(401,576)
X,Y=np.meshgrid(lo[0]+np.arange(shape[0])*step,lo[1]+np.arange(shape[1])*step,indexing='ij')
blocked=np.zeros(shape,dtype=bool);margin=width/2+.1001
def capsule(a,z,r):
 dx,dy=z[0]-a[0],z[1]-a[1];den=dx*dx+dy*dy
 u=np.clip(((X-a[0])*dx+(Y-a[1])*dy)/den,0,1) if den else 0
 return (X-a[0]-u*dx)**2+(Y-a[1]-u*dy)**2<=r*r
for q in b.GetTracks():
 if q.GetNetCode()==net:continue
 if isinstance(q,k.PCB_VIA):blocked|=capsule(xy(q.GetPosition()),xy(q.GetPosition()),k.ToMM(q.GetWidth(k.In2_Cu))/2+margin)
 elif q.GetLayer()==k.In2_Cu:blocked|=capsule(xy(q.GetStart()),xy(q.GetEnd()),k.ToMM(q.GetWidth())/2+margin)
for f in b.GetFootprints():
 for p in f.Pads():
  if p.GetNetCode()==net or not p.IsOnLayer(k.In2_Cu):continue
  bb=p.GetBoundingBox();x,y,w,h=[k.ToMM(v) for v in [bb.GetX(),bb.GetY(),bb.GetWidth(),bb.GetHeight()]]
  blocked|=(X>=x-margin)&(X<=x+w+margin)&(Y>=y-margin)&(Y<=y+h+margin)
 for q in f.Zones():
  if q.GetIsRuleArea() and q.GetDoNotAllowTracks() and q.IsOnLayer(k.In2_Cu):
   bb=q.GetBoundingBox();x,y,w,h=[k.ToMM(v) for v in [bb.GetX(),bb.GetY(),bb.GetWidth(),bb.GetHeight()]]
   blocked|=(X>=x-margin)&(X<=x+w+margin)&(Y>=y-margin)&(Y<=y+h+margin)
# Preserve a short transition escape around the existing signal via.
projection=np.zeros(shape,dtype=bool)
for q in b.GetTracks():
 if not isinstance(q,k.PCB_VIA) and q.GetLayer()==k.B_Cu and q.GetNetname() in ['/USB_DP','/USB_DM']:
  projection|=capsule(xy(q.GetStart()),xy(q.GetEnd()),k.ToMM(q.GetWidth())/2+width/2+.155)
projection&=~capsule(a,a,.55)
# Projection is a cost, allowing unavoidable crossings to remain reviewable.
def index(p):return tuple(round((p[i]-lo[i])/step) for i in range(2))
s,e=index(a),index(z)
result={'source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'transition_escape_radius_mm':.55,'projection_cost_multiplier':20,'step_mm':step,'width_mm':width,'bounds_mm':[lo,[float(X[-1,-1]),float(Y[-1,-1])]],'endpoint_blocked':[bool(blocked[s]),bool(blocked[e])],'limitations':['Conservative pad bounding boxes may reject viable paths','Single layer; only two connected SYS segments replaced','Grid search is not proof of global impossibility']}
queue=[(0,0,s)];cost={s:0};prev={};found=False
if not blocked[s] and not blocked[e]:
 while queue:
  _,g,u=heapq.heappop(queue)
  if g>cost[u]+1e-9:continue
  if u==e:found=True;break
  for dx in [-1,0,1]:
   for dy in [-1,0,1]:
    if not (dx or dy):continue
    v=(u[0]+dx,u[1]+dy)
    if not(0<=v[0]<shape[0] and 0<=v[1]<shape[1]) or blocked[v]:continue
    if dx and dy and (blocked[u[0]+dx,u[1]] or blocked[u[0],u[1]+dy]):continue
    ng=g+math.hypot(dx,dy)*(20 if projection[v] else 1)
    if ng<cost.get(v,1e99):
     cost[v]=ng;prev[v]=u;heapq.heappush(queue,(ng+math.hypot(v[0]-e[0],v[1]-e[1]),ng,v))
result['visited']=len(cost)
if found:
 path=[e]
 while path[-1]!=s:path.append(prev[path[-1]])
 path.reverse()
 # Greedy visibility simplification, checking all four grid neighbors along a segment.
 def visible(u,v):
  n=max(2,math.ceil(math.dist(u,v)*4))
  for f in np.linspace(0,1,n+1):
   x=u[0]+(v[0]-u[0])*f;y=u[1]+(v[1]-u[1])*f
   for ix in {math.floor(x),math.ceil(x)}:
    for iy in {math.floor(y),math.ceil(y)}:
     if blocked[ix,iy] or projection[ix,iy]:return False
  return True
 smooth=[path[0]];i=0
 while i<len(path)-1:
  j=len(path)-1
  while j>i+1 and not visible(path[i],path[j]):j-=1
  smooth.append(path[j]);i=j
 path=smooth
 corners=[path[0]]
 for i in range(1,len(path)-1):
  d1=(path[i][0]-path[i-1][0],path[i][1]-path[i-1][1]);d2=(path[i+1][0]-path[i][0],path[i+1][1]-path[i][1])
  if d1!=d2:corners.append(path[i])
 corners.append(path[-1]);points=[a]+[(lo[0]+u[0]*step,lo[1]+u[1]*step) for u in corners]+[z]
 for a,z in zip(points,points[1:]):
  if math.dist(a,z)<1e-7:continue
  t=k.PCB_TRACK(b);t.SetLayer(k.In2_Cu);t.SetNetCode(net);t.SetWidth(k.FromMM(width));t.SetStart(k.VECTOR2I(k.FromMM(a[0]),k.FromMM(a[1])));t.SetEnd(k.VECTOR2I(k.FromMM(z[0]),k.FromMM(z[1])));b.Add(t)
 fn=P/'usb-sys-search-candidate.kicad_pcb';k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(fn),b);shutil.copyfile(P/'power-width-candidate.kicad_pro',fn.with_suffix('.kicad_pro'))
 subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc','--format','json','--output',str(P/'usb-sys-search-drc.json'),str(fn)],check=True)
 d=json.loads((P/'usb-sys-search-drc.json').read_text());result.update(violations=len(d['violations']),unconnected=len(d['unconnected_items']),status='CANDIDATE_NOT_RELEASED',route_points=len(points))
else:result['status']='NO_LOCAL_PATH_BASELINE_UNCHANGED'
(P/'usb-sys-search-review.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
