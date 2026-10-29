"""Obstacle-aware inner power route; KiCad DRC remains authoritative."""
import pcbnew as k,wx
app=wx.App(False)
import math,json,heapq,shutil,subprocess
from pathlib import Path
O=Path('/Users/takahashinaoki/Dev/pendant-recorder/hardware/xe-minimal/q5-tmux-placement-trial');src=O/'drain-clear-rework';dst=O/'drain-connected';cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));net=b.FindNet('/USB_HIGH_BUDGET_DRAIN')
a,c=(7.25,9.9),(10.5,3.2)
def xy(p):return k.ToMM(p.x),k.ToMM(p.y)

def dist(p,s,e):
 dx,dy=e[0]-s[0],e[1]-s[1];q=max(0,min(1,((p[0]-s[0])*dx+(p[1]-s[1])*dy)/(dx*dx+dy*dy))) if dx or dy else 0
 return math.hypot(p[0]-s[0]-q*dx,p[1]-s[1]-q*dy)
accepted=None
for layer in [k.In3_Cu,k.In1_Cu,k.In4_Cu]:
 obs=[];rect=[]
 for t in b.GetTracks():
  if t.GetNetname()=='/USB_HIGH_BUDGET_DRAIN':continue
  via=isinstance(t,k.PCB_VIA)
  if via or t.GetLayer()==layer:obs.append((xy(t.GetStart()),xy(t.GetEnd()),k.ToMM(t.GetWidth(layer) if via else t.GetWidth())/2+.176))
 for f in b.GetFootprints():
  for p in f.Pads():
   if p.GetNetname()=='/USB_HIGH_BUDGET_DRAIN' or not p.IsOnLayer(layer):continue
   bb=p.GetBoundingBox();rect.append((k.ToMM(bb.GetX())-.176,k.ToMM(bb.GetY())-.176,k.ToMM(bb.GetRight())+.176,k.ToMM(bb.GetBottom())+.176))
 def clear(p):
  x,y=p
  return .3<x<23.7 and .3<y<26.7 and not any(l<x<r and u<y<d for l,u,r,d in rect) and not any(dist(p,s,e)<rad for s,e,rad in obs)
 def line(s,e):
  n=max(1,math.ceil(math.dist(s,e)/.08));return all(clear((s[0]+(e[0]-s[0])*i/n,s[1]+(e[1]-s[1])*i/n)) for i in range(n+1))
 step=.1;points={(x,y):(x*step,y*step) for x in range(3,238) for y in range(3,268) if clear((x*step,y*step))}
 targets=[xy(t.GetPosition()) for t in b.GetTracks() if isinstance(t,k.PCB_VIA) and t.GetNetname()=='/USB_HIGH_BUDGET_DRAIN' and math.dist(xy(t.GetPosition()),a)>.1]
 start=sorted(points,key=lambda z:math.dist(points[z],a))[:16];goals={}
 for target in targets:
  for z in sorted(points,key=lambda z:math.dist(points[z],target))[:16]:
   if line(points[z],target):goals[z]=target
 def heuristic(p):return min(math.dist(p,t) for t in targets)

 costs={};prev={};queue=[]
 for z in start:
  if line(a,points[z]):costs[z]=math.dist(a,points[z]);prev[z]=None;heapq.heappush(queue,(costs[z]+heuristic(points[z]),z))
 end=None;closed=set()
 while queue:
  _,z=heapq.heappop(queue)
  if z in closed:continue
  closed.add(z)
  if z in goals:end=z;break
  for dx,dy in [(1,0),(-1,0),(0,1),(0,-1),(1,1),(1,-1),(-1,1),(-1,-1)]:
   q=(z[0]+dx,z[1]+dy)
   if q not in points or q in closed or not line(points[z],points[q]):continue
   cost=costs[z]+step*math.hypot(dx,dy)
   if cost<costs.get(q,1e99):costs[q]=cost;prev[q]=z;heapq.heappush(queue,(cost+heuristic(points[q]),q))
 print('layer',layer,'visited',len(closed),'found',end is not None,flush=True)
 if end is None:continue
 c=goals[end];path=[c];z=end
 while z is not None:path.append(points[z]);z=prev[z]
 path.append(a);path.reverse();simple=[path[0]];i=0
 while i<len(path)-1:
  j=len(path)-1
  while j>i+1 and not line(path[i],path[j]):j-=1
  simple.append(path[j]);i=j
 added=[]
 for s,e in zip(simple,simple[1:]):
  t=k.PCB_TRACK(b);t.SetStart(k.VECTOR2I(k.FromMM(s[0]),k.FromMM(s[1])));t.SetEnd(k.VECTOR2I(k.FromMM(e[0]),k.FromMM(e[1])));t.SetLayer(layer);t.SetWidth(k.FromMM(.15));t.SetNet(net);b.AddNative(t);t.thisown=False;added.append(t)
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
 subprocess.run([cli,'pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'drain-connected-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 r=json.loads((O/'drain-connected-drc.json').read_text())
 if not [v for v in r['violations'] if v['type'] not in ['track_dangling','via_dangling']] and not r['schematic_parity'] and len(r['unconnected_items'])==0:accepted={'layer':layer,'path_mm':simple,'unconnected_items':len(r['unconnected_items'])};break
 print('violations',len(r['violations']),flush=True)
 for t in added:b.RemoveNative(t)
(O/'drain-connected-review.json').write_text(json.dumps({'accepted':accepted,'scope':'U16 VBUS to existing via; partial candidate only, canonical unchanged'},indent=2)+'\n');print(accepted,flush=True)
