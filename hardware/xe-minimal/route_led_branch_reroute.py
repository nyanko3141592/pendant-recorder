"""Obstacle-aware inner power route; KiCad DRC remains authoritative."""
import pcbnew as k,wx
app=wx.App(False)
import math,json,heapq,shutil,subprocess
from pathlib import Path
O=Path(__file__).resolve().parent;src=O/'led-sdv3-branch-restored-candidate';dst=O/'led-branch-rerouted-candidate';cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:
 shutil.copyfile((O/'pendant-xe-minimal').with_suffix(ext),src.with_suffix(ext))
 shutil.copyfile((O/'pendant-xe-minimal').with_suffix(ext),dst.with_suffix(ext))
b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')))
def xy(p):return k.ToMM(p.x),k.ToMM(p.y)
net=next(p.GetNet() for f in b.GetFootprints() if f.GetReference()=='R32' for p in f.Pads() if p.GetNumber()=='1')
escape=json.loads((O/'led-r32-escape-review.json').read_text())['accepted'];assert escape
for start,end in zip(escape['path_mm'],escape['path_mm'][1:]):
 t=k.PCB_TRACK(b);t.SetStart(k.VECTOR2I(round(start[0]*1e6),round(start[1]*1e6)));t.SetEnd(k.VECTOR2I(round(end[0]*1e6),round(end[1]*1e6)));t.SetLayer(escape['layer']);t.SetWidth(k.FromMM(.1));t.SetNet(net);b.AddNative(t);t.thisown=False
end=escape['path_mm'][-1];v=k.PCB_VIA(b);v.SetPosition(k.VECTOR2I(round(end[0]*1e6),round(end[1]*1e6)));v.SetWidth(k.FromMM(.35));v.SetDrill(k.FromMM(.15));v.SetViaType(k.VIATYPE_THROUGH);v.SetLayerPair(k.F_Cu,k.B_Cu);v.SetNet(net);b.AddNative(v);v.thisown=False
vs=[t for t in b.GetTracks() if isinstance(t,k.PCB_VIA) and t.GetNetname()=='/STATUS_LED'];assert len(vs)==2;a,c=[xy(v.GetPosition()) for v in sorted(vs,key=lambda t:t.GetPosition().y)];net=vs[0].GetNet()
def dist(p,s,e):
 dx,dy=e[0]-s[0],e[1]-s[1];q=max(0,min(1,((p[0]-s[0])*dx+(p[1]-s[1])*dy)/(dx*dx+dy*dy))) if dx or dy else 0
 return math.hypot(p[0]-s[0]-q*dx,p[1]-s[1]-q*dy)
from functools import lru_cache
layers=[k.In2_Cu,k.In4_Cu,k.F_Cu,k.B_Cu,k.In1_Cu,k.In3_Cu]; obstacles={};rects={};allobs=[];allrect=[]
for t in b.GetTracks():
 if t.GetNetname()=='/STATUS_LED':continue
 via=isinstance(t,k.PCB_VIA);width=k.ToMM(t.GetWidth(k.In2_Cu) if via else t.GetWidth())
 allobs.append((xy(t.GetStart()),xy(t.GetEnd()),width/2+.29))
for f in b.GetFootprints():
 for p in f.Pads():
  bb=p.GetBoundingBox();allrect.append((k.ToMM(bb.GetX())-.29,k.ToMM(bb.GetY())-.29,k.ToMM(bb.GetRight())+.29,k.ToMM(bb.GetBottom())+.29))
for layer in layers:
 obstacles[layer]=[];rects[layer]=[]
 for t in b.GetTracks():
  if t.GetNetname()=='/STATUS_LED':continue
  via=isinstance(t,k.PCB_VIA)
  if via or t.GetLayer()==layer:obstacles[layer].append((xy(t.GetStart()),xy(t.GetEnd()),k.ToMM(t.GetWidth(layer) if via else t.GetWidth())/2+.151))
 for f in b.GetFootprints():
  for p in f.Pads():
   if p.GetNetname()=='/STATUS_LED' or not p.IsOnLayer(layer):continue
   bb=p.GetBoundingBox();margin=.29 if p.GetAttribute()==k.PAD_ATTRIB_NPTH else .151;rects[layer].append((k.ToMM(bb.GetX())-margin,k.ToMM(bb.GetY())-margin,k.ToMM(bb.GetRight())+margin,k.ToMM(bb.GetBottom())+margin))
def clear(pos,layer):
 x,y=pos
 return .3<x<23.7 and .3<y<26.7 and not any(l<x<r and u<y<d for l,u,r,d in rects[layer]) and not any(dist(pos,s,e)<rad for s,e,rad in obstacles[layer])
def line(s,e,layer):
 n=max(1,math.ceil(math.dist(s,e)/.08));return all(clear((s[0]+(e[0]-s[0])*i/n,s[1]+(e[1]-s[1])*i/n),layer) for i in range(n+1))
existing_holes=[(xy(t.GetPosition()),k.ToMM(t.GetDrillValue())/2+.075+.255) for t in b.GetTracks() if isinstance(t,k.PCB_VIA)]
@lru_cache(None)
def via_ok(x,y):
 pos=(x*.1,y*.1);px,py=pos
 return not any(math.dist(pos,h)<r for h,r in existing_holes) and .5<px<23.5 and .5<py<26.5 and not any(l<px<r and u<py<d for l,u,r,d in allrect) and not any(dist(pos,s,e)<rad for s,e,rad in allobs)
points={(x,y,l):(x*.1,y*.1) for l in layers for x in range(3,238) for y in range(3,268) if clear((x*.1,y*.1),l)}
queue=[];costs={};prev={};goals=set()
for l in layers:
 local=[z for z in points if z[2]==l]
 for z in sorted(local,key=lambda z:math.dist(points[z],a))[:16]:
  if line(a,points[z],l):costs[z]=math.dist(a,points[z]);prev[z]=None;heapq.heappush(queue,(costs[z]+math.dist(points[z],c),z))
 goals.update(z for z in sorted(local,key=lambda z:math.dist(points[z],c))[:16] if line(points[z],c,l))
closed=set();end=None
while queue:
 _,z=heapq.heappop(queue)
 if z in closed:continue
 closed.add(z)
 if z in goals:end=z;break
 neighbors=[((z[0]+dx,z[1]+dy,z[2]),.1*math.hypot(dx,dy)) for dx,dy in [(1,0),(-1,0),(0,1),(0,-1),(1,1),(1,-1),(-1,1),(-1,-1)]]
 if via_ok(z[0],z[1]):neighbors.extend(((z[0],z[1],other),3.0) for other in layers if other!=z[2])
 for q,extra in neighbors:
  if q not in points or q in closed:continue
  if q[2]==z[2] and not line(points[z],points[q],z[2]):continue
  cost=costs[z]+extra
  if cost<costs.get(q,1e99):costs[q]=cost;prev[q]=z;heapq.heappush(queue,(cost+math.dist(points[q],c),q))
print('visited',len(closed),'found',end is not None,flush=True)
review={'accepted':False,'visited':len(closed)}
if end is not None:
 states=[];z=end
 while z is not None:states.append(z);z=prev[z]
 states.reverse();runs=[];layer=states[0][2];run=[a];switches=[]
 for z in states:
  if z[2]!=layer:
   switches.append(points[z]);runs.append((layer,run));run=[points[z]];layer=z[2]
  else:run.append(points[z])
 run.append(c);runs.append((layer,run));paths=[]
 for layer,run in runs:
  simple=[run[0]];i=0
  while i<len(run)-1:
   j=len(run)-1
   while j>i+1 and not line(run[i],run[j],layer):j-=1
   simple.append(run[j]);i=j
  paths.append({'layer':layer,'points':simple})
  for s,e in zip(simple,simple[1:]):
   if s==e:continue
   t=k.PCB_TRACK(b);t.SetStart(k.VECTOR2I(round(s[0]*1000000),round(s[1]*1000000)));t.SetEnd(k.VECTOR2I(round(e[0]*1000000),round(e[1]*1000000)));t.SetLayer(layer);t.SetWidth(k.FromMM(.1));t.SetNet(net);b.AddNative(t);t.thisown=False
 for x,y in switches:
  v=k.PCB_VIA(b);v.SetPosition(k.VECTOR2I(round(x*1000000),round(y*1000000)));v.SetWidth(k.FromMM(.35));v.SetDrill(k.FromMM(.15));v.SetViaType(k.VIATYPE_THROUGH);v.SetLayerPair(k.F_Cu,k.B_Cu);v.SetNet(net);b.AddNative(v);v.thisown=False
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
 subprocess.run([cli,'pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'led-branch-rerouted-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 r=json.loads((O/'led-branch-rerouted-drc.json').read_text());review.update(accepted=not r['violations'] and not r['schematic_parity'] and len(r['unconnected_items'])==13,paths=paths,switches=switches,violations=r['violations'],unconnected_items=len(r['unconnected_items']))
(O/'led-branch-rerouted-review.json').write_text(json.dumps(review,indent=2)+'\n');print('accepted',review['accepted'],flush=True)
