"""Obstacle-aware inner power route; KiCad DRC remains authoritative."""
import pcbnew as k,wx
app=wx.App(False)
import math,json,heapq,shutil,subprocess
from pathlib import Path
O=Path(__file__).resolve().parent;src=O/'pa15-r44-rotate-candidate';dst=O/'pa15-ilim-r44-rotated-escape-candidate';cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')))
fps={f.GetReference():f for f in b.GetFootprints()}
def pad(ref,n):return next(p for p in fps[ref].Pads() if p.GetNumber()==n)
p=pad('R44','1');q=pad('U13','3');a,c=p.GetPosition(),q.GetPosition();net=p.GetNet()
def xy(p):return k.ToMM(p.x),k.ToMM(p.y)
a,c=xy(a),xy(c)
def dist(p,s,e):
 dx,dy=e[0]-s[0],e[1]-s[1];q=max(0,min(1,((p[0]-s[0])*dx+(p[1]-s[1])*dy)/(dx*dx+dy*dy))) if dx or dy else 0
 return math.hypot(p[0]-s[0]-q*dx,p[1]-s[1]-q*dy)
via_obs=[];via_rect=[]
for t in b.GetTracks():
 if t.GetNetname()=='/USB_ILIM_SET':continue
 via=isinstance(t,k.PCB_VIA);via_obs.append((xy(t.GetStart()),xy(t.GetEnd()),k.ToMM(t.GetWidth(k.In2_Cu) if via else t.GetWidth())/2+.28))
for f in b.GetFootprints():
 for p in f.Pads():
  bb=p.GetBoundingBox();via_rect.append((k.ToMM(bb.GetX())-.28,k.ToMM(bb.GetY())-.28,k.ToMM(bb.GetRight())+.28,k.ToMM(bb.GetBottom())+.28))
def via_clear(p):
 x,y=p
 return .5<x<23.5 and .5<y<26.5 and not any(l<x<r and u<y<d for l,u,r,d in via_rect) and not any(dist(p,s,e)<rad for s,e,rad in via_obs)
accepted=None
for layer in [k.F_Cu]:
 obs=[];rect=[]
 for t in b.GetTracks():
  if t.GetNetname()=='/USB_ILIM_SET':continue
  via=isinstance(t,k.PCB_VIA)
  if via or t.GetLayer()==layer:obs.append((xy(t.GetStart()),xy(t.GetEnd()),k.ToMM(t.GetWidth(layer) if via else t.GetWidth())/2+.18))
 for f in b.GetFootprints():
  for p in f.Pads():
   if p.GetNetname()=='/USB_ILIM_SET' or not p.IsOnLayer(layer):continue
   bb=p.GetBoundingBox();margin=.29 if p.GetAttribute()==k.PAD_ATTRIB_NPTH else .18;rect.append((k.ToMM(bb.GetX())-margin,k.ToMM(bb.GetY())-margin,k.ToMM(bb.GetRight())+margin,k.ToMM(bb.GetBottom())+margin))
 def clear(p):
  x,y=p
  return .3<x<23.7 and .3<y<26.7 and not any(l<x<r and u<y<d for l,u,r,d in rect) and not any(dist(p,s,e)<rad for s,e,rad in obs)
 def line(s,e):
  n=max(1,math.ceil(math.dist(s,e)/.08));return all(clear((s[0]+(e[0]-s[0])*i/n,s[1]+(e[1]-s[1])*i/n)) for i in range(n+1))
 step=.05;points={(x,y):(x*step,y*step) for x in range(max(6,round((a[0]-5)/step)),min(475,round((a[0]+5)/step))) for y in range(max(6,round((a[1]-5)/step)),min(535,round((a[1]+5)/step))) if clear((x*step,y*step))}
 start=sorted(points,key=lambda z:math.dist(points[z],a))[:16];goals={z for z in points if via_clear(points[z])}
 costs={};prev={};queue=[]
 for z in start:
  if line(a,points[z]):costs[z]=math.dist(a,points[z]);prev[z]=None;heapq.heappush(queue,(costs[z],z))
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
   if cost<costs.get(q,1e99):costs[q]=cost;prev[q]=z;heapq.heappush(queue,(cost,q))
 print('layer',layer,'visited',len(closed),'found',end is not None,flush=True)
 if end is None:continue
 c=points[end];path=[];z=end
 while z is not None:path.append(points[z]);z=prev[z]
 path.append(a);path.reverse();simple=[path[0]];i=0
 while i<len(path)-1:
  j=len(path)-1
  while j>i+1 and not line(path[i],path[j]):j-=1
  simple.append(path[j]);i=j
 added=[]
 for s,e in zip(simple,simple[1:]):
  t=k.PCB_TRACK(b);t.SetStart(k.VECTOR2I(round(s[0]*1e6),round(s[1]*1e6)));t.SetEnd(k.VECTOR2I(round(e[0]*1e6),round(e[1]*1e6)));t.SetLayer(layer);t.SetWidth(k.FromMM(.15));t.SetNet(net);b.AddNative(t);t.thisown=False;added.append(t)
 v=k.PCB_VIA(b);v.SetPosition(k.VECTOR2I(round(c[0]*1e6),round(c[1]*1e6)));v.SetWidth(k.FromMM(.35));v.SetDrill(k.FromMM(.15));v.SetViaType(k.VIATYPE_THROUGH);v.SetLayerPair(k.F_Cu,k.B_Cu);v.SetNet(net);b.AddNative(v);v.thisown=False;added.append(v)
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
 subprocess.run([cli,'pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'pa15-ilim-r44-rotated-escape-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 r=json.loads((O/'pa15-ilim-r44-rotated-escape-drc.json').read_text())
 if not r['violations'] and not r['schematic_parity'] and len(r['unconnected_items'])==25:accepted={'layer':layer,'path_mm':simple,'unconnected_items':len(r['unconnected_items'])};break
 print('violations',len(r['violations']),flush=True)
 for t in added:b.RemoveNative(t)
(O/'pa15-ilim-r44-rotated-escape-review.json').write_text(json.dumps({'accepted':accepted,'scope':'U13.3 USB_ILIM_SET breakout; not adopted alone'},indent=2)+'\n');print(accepted,flush=True)
