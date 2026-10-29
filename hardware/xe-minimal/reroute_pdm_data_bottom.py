"""Replace PDM_DATA pad-via routing with a standard bottom-copper route."""
import pcbnew as k, wx
wx.App(False)
import math, heapq, json, shutil, subprocess
from pathlib import Path

O=Path(__file__).resolve().parent; src=O/'pendant-xe-minimal'; dst=O/'pdm-data-bottom-candidate'
cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']: shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
b=k.LoadBoard(str(src.with_suffix('.kicad_pcb'))); fps={f.GetReference():f for f in b.GetFootprints()}
pad=lambda r,n:next(p for p in fps[r].Pads() if p.GetNumber()==n)
p0,p1=pad('U1','40'),pad('U8','1'); net=p0.GetNet(); xy=lambda p:(k.ToMM(p.x),k.ToMM(p.y)); start,goal=xy(p0.GetPosition()),xy(p1.GetPosition())
for t in list(b.GetTracks()):
 if t.GetNetCode()==net.GetNetCode(): b.RemoveNative(t)
def dist(p,s,e):
 dx,dy=e[0]-s[0],e[1]-s[1]; q=max(0,min(1,((p[0]-s[0])*dx+(p[1]-s[1])*dy)/(dx*dx+dy*dy))) if dx or dy else 0
 return math.hypot(p[0]-s[0]-q*dx,p[1]-s[1]-q*dy)
obs=[]; rect=[]
for t in b.GetTracks():
 if isinstance(t,k.PCB_VIA) or t.GetLayer()==k.B_Cu: obs.append((xy(t.GetStart()),xy(t.GetEnd()),k.ToMM(t.GetWidth(k.B_Cu) if isinstance(t,k.PCB_VIA) else t.GetWidth())/2+.18))
for f in b.GetFootprints():
 for p in f.Pads():
  if p.GetNetCode()==net.GetNetCode() or not p.IsOnLayer(k.B_Cu): continue
  bb=p.GetBoundingBox(); m=.29 if p.GetAttribute()==k.PAD_ATTRIB_NPTH else .18
  rect.append((k.ToMM(bb.GetX())-m,k.ToMM(bb.GetY())-m,k.ToMM(bb.GetRight())+m,k.ToMM(bb.GetBottom())+m))
def clear(p):
 x,y=p
 if math.dist(p,start)<.5 or math.dist(p,goal)<.5:return True
 return .3<x<27.2 and .3<y<26.7 and not any(l<x<r and u<y<d for l,u,r,d in rect) and not any(dist(p,s,e)<rad for s,e,rad in obs)
def line(s,e):
 n=max(1,math.ceil(math.dist(s,e)/.05));return all(clear((s[0]+(e[0]-s[0])*i/n,s[1]+(e[1]-s[1])*i/n)) for i in range(n+1))
step=.1; points={(x,y):(x*step,y*step) for x in range(3,273) for y in range(3,268) if clear((x*step,y*step))}
starts=sorted(points,key=lambda z:math.dist(points[z],start))[:24]; goals={z for z in points if math.dist(points[z],goal)<.25 and line(points[z],goal)}
cost={};prev={};q=[]
for z in starts:
 if line(start,points[z]):cost[z]=math.dist(start,points[z]);prev[z]=None;heapq.heappush(q,(cost[z]+math.dist(points[z],goal),z))
end=None;closed=set()
while q:
 _,z=heapq.heappop(q)
 if z in closed:continue
 closed.add(z)
 if z in goals:end=z;break
 for dx,dy in [(1,0),(-1,0),(0,1),(0,-1),(1,1),(1,-1),(-1,1),(-1,-1)]:
  w=(z[0]+dx,z[1]+dy)
  if w not in points or w in closed or not line(points[z],points[w]):continue
  nc=cost[z]+step*math.hypot(dx,dy)
  if nc<cost.get(w,1e99):cost[w]=nc;prev[w]=z;heapq.heappush(q,(nc+math.dist(points[w],goal),w))
assert end is not None
path=[];z=end
while z is not None:path.append(points[z]);z=prev[z]
path=[start]+list(reversed(path))+[goal]; simple=[path[0]];i=0
while i<len(path)-1:
 j=len(path)-1
 while j>i+1 and not line(path[i],path[j]):j-=1
 simple.append(path[j]);i=j
for s,e in zip(simple,simple[1:]):
 t=k.PCB_TRACK(b);t.SetStart(k.VECTOR2I(k.FromMM(s[0]),k.FromMM(s[1])));t.SetEnd(k.VECTOR2I(k.FromMM(e[0]),k.FromMM(e[1])));t.SetLayer(k.B_Cu);t.SetWidth(k.FromMM(.15));t.SetNet(net);b.Add(t)
k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
subprocess.run([cli,'pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--refill-zones','--format','json','--severity-all','-o',str(O/'pdm-data-bottom-drc.json')],check=True)
d=json.loads((O/'pdm-data-bottom-drc.json').read_text());review={'path_mm':simple,'violations':len(d['violations']),'unconnected':len(d['unconnected_items']),'accepted':not d['violations'] and not d['unconnected_items']}
(O/'pdm-data-bottom-review.json').write_text(json.dumps(review,indent=2)+'\n');print(review)
