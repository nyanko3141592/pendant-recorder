"""Local single-layer reroute attempt; saved candidate needs full DRC."""
from pathlib import Path
import wx,pcbnew as k,json,math,heapq,functools,shutil
app=wx.App(False);O=Path(__file__).resolve().parent;src=O/'pendant-xe-film-lap-unrouted.kicad_pcb';b=k.LoadBoard(str(src));r=json.loads((O/'review.json').read_text());ids=set(r['track_segments_requiring_review'])
for t in list(b.GetTracks()):
 if t.m_Uuid.AsString()in ids:b.RemoveNative(t);t.thisown=False

# Separate repacking hypothesis: shift R13 0.3 mm inward and bridge its old pads.
f=next(f for f in b.GetFootprints()if f.GetReference()=='R13');old=[(p.GetNumber(),p.GetPosition(),p.GetNet())for p in f.Pads()];f.Move(k.VECTOR2I(0,k.FromMM(.3)))
for number,pos,net in old:
 q=next(p for p in f.Pads()if p.GetNumber()==number);t=k.PCB_TRACK(b);t.SetStart(pos);t.SetEnd(q.GetPosition());t.SetLayer(k.B_Cu);t.SetWidth(k.FromMM(.3 if net.GetNetname()=='/VBUS' else .15));t.SetNet(net);b.AddNative(t);t.thisown=False

def xy(p):return k.ToMM(p.x),k.ToMM(p.y)
def vec(p):return k.VECTOR2I(k.FromMM(p[0]),k.FromMM(p[1]))
def dist(p,s,e):
 dx,dy=e[0]-s[0],e[1]-s[1];den=dx*dx+dy*dy;v=max(0,min(1,((p[0]-s[0])*dx+(p[1]-s[1])*dy)/den))if den else 0
 return math.hypot(p[0]-s[0]-v*dx,p[1]-s[1]-v*dy)
results=[]
for net,a,z in [('/SD_MOSI',(15.5,1.6),(12.1,2.6)),('/SD_MISO',(15.7,2.3),(13.7,1.7)),('/BAT_TS',(12.75,1.5),(16.13,1.055))]:
 margin=.18;obs=[];rect=[]
 for t in b.GetTracks():
  if t.GetNetname()==net or not t.IsOnLayer(k.B_Cu):continue
  isvia=isinstance(t,k.PCB_VIA);obs.append((xy(t.GetStart()),xy(t.GetEnd()),k.ToMM(t.GetWidth(k.B_Cu)if isvia else t.GetWidth())/2+margin))
 for f in b.GetFootprints():
  for p in f.Pads():
   if p.GetNetname()==net or not p.IsOnLayer(k.B_Cu):continue
   bb=p.GetBoundingBox();rect.append((k.ToMM(bb.GetX())-margin,k.ToMM(bb.GetY())-margin,k.ToMM(bb.GetRight())+margin,k.ToMM(bb.GetBottom())+margin))
 obs=[o for o in obs if min(o[0][0],o[1][0])-o[2]<17.5 and max(o[0][0],o[1][0])+o[2]>11 and min(o[0][1],o[1][1])-o[2]<4.5];rect=[o for o in rect if o[0]<17.5 and o[2]>11 and o[1]<4.5]
 @functools.lru_cache(None)
 def clear(p):
  x,y=p
  return 11<=x<=17.5 and .25<=y<=4.5 and not any(l<x<rr and u<y<d for l,u,rr,d in rect) and not any(dist(p,s,e)<rad for s,e,rad in obs)
 def line(s,e):
  n=max(1,math.ceil(math.dist(s,e)/.025));return all(clear((round(s[0]+(e[0]-s[0])*i/n,8),round(s[1]+(e[1]-s[1])*i/n,8)))for i in range(n+1))
 step=.05;points={(i,j):(round(i*step,8),round(j*step,8))for i in range(220,351)for j in range(5,91)if clear((round(i*step,8),round(j*step,8)))}
 starts=sorted(points,key=lambda q:math.dist(points[q],a))[:20];goals={q for q in sorted(points,key=lambda q:math.dist(points[q],z))[:20]if line(points[q],z)};cost={};prev={};queue=[];closed=set();end=None
 for q in starts:
  if line(a,points[q]):cost[q]=math.dist(a,points[q]);prev[q]=None;heapq.heappush(queue,(cost[q]+math.dist(points[q],z),q))
 while queue:
  _,q=heapq.heappop(queue)
  if q in closed:continue
  closed.add(q)
  if q in goals:end=q;break
  for dx,dy in [(1,0),(-1,0),(0,1),(0,-1),(1,1),(1,-1),(-1,1),(-1,-1)]:
   n=(q[0]+dx,q[1]+dy)
   if n not in points or n in closed or not line(points[q],points[n]):continue
   c=cost[q]+step*math.hypot(dx,dy)
   if c<cost.get(n,1e99):cost[n]=c;prev[n]=q;heapq.heappush(queue,(c+math.dist(points[n],z),n))
 result={'net':net,'start':a,'end':z,'visited':len(closed),'found':end is not None};results.append(result);print(result,flush=True)
 if end is None:continue
 path=[z];q=end
 while q is not None:path.append(points[q]);q=prev[q]
 path.append(a);path.reverse();simple=[path[0]];i=0
 while i<len(path)-1:
  j=len(path)-1
  while j>i+1 and not line(path[i],path[j]):j-=1
  simple.append(path[j]);i=j
 for s,e in zip(simple,simple[1:]):
  if math.dist(s,e)<1e-8:continue
  t=k.PCB_TRACK(b);t.SetStart(vec(s));t.SetEnd(vec(e));t.SetLayer(k.B_Cu);t.SetWidth(k.FromMM(.15));t.SetNet(b.FindNet(net));b.AddNative(t);t.thisown=False
 result['path_mm']=simple
out=O/'pendant-xe-film-lap-r13-trial.kicad_pcb';k.SaveBoard(str(out),b)
for ext in ['.kicad_pro','.kicad_dru']:
 shutil.copyfile(O.parent/'fixed-usb-limit-trial/ncu-sensor-trial'/('pendant-xe-minimal'+ext),out.with_suffix(ext))
(O/'r13-route-review.json').write_text(json.dumps({'status':'LOCAL_ROUTE_TRIAL_NOT_DRC_APPROVED','results':results,'limits':['Single-layer bounded search failure does not prove all routing impossible.','Full DRC and electrical/assembly qualification required.','Failed routes remain open in this explicitly separate study candidate.']},indent=2)+'\n')
