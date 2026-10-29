#!/usr/bin/env python3
"""Move the VBUS_CHARGER transition out of U13 pad 5 and autoroute both sides."""
import heapq,math,wx,pcbnew as k
from pathlib import Path
wx.App(False); p=Path(__file__).with_name('pendant-xe-minimal.kicad_pcb'); b=k.LoadBoard(str(p))
net=b.FindNet('/VBUS_CHARGER'); old=k.VECTOR2I(k.FromMM(11.5375),k.FromMM(1.249999)); drop=(12.7375,1.05); goal=(4.4,9.8)
for q in list(b.GetTracks()):
 if q.GetNetCode()!=net.GetNetCode():continue
 if type(q) is k.PCB_VIA and q.GetPosition()==old:b.RemoveNative(q)
 elif type(q) is k.PCB_TRACK and (q.GetStart()==old or q.GetEnd()==old):b.RemoveNative(q)
v=k.PCB_VIA(b);v.SetNet(net);v.SetPosition(k.VECTOR2I(k.FromMM(drop[0]),k.FromMM(drop[1])));v.SetWidth(k.FromMM(.35));v.SetDrill(k.FromMM(.15));v.SetLayerPair(k.F_Cu,k.B_Cu);b.Add(v)
def route(a,z,layer):
 def xy(p):return(k.ToMM(p.x),k.ToMM(p.y))
 def ds(p,s,e):
  dx,dy=e[0]-s[0],e[1]-s[1];q=max(0,min(1,((p[0]-s[0])*dx+(p[1]-s[1])*dy)/(dx*dx+dy*dy))) if dx or dy else 0;return math.hypot(p[0]-s[0]-q*dx,p[1]-s[1]-q*dy)
 obs=[];rect=[]
 for q in b.GetTracks():
  if q.GetNetCode()==net.GetNetCode():continue
  if type(q) is k.PCB_VIA:obs.append((xy(q.GetStart()),xy(q.GetEnd()),k.ToMM(q.GetWidth(layer))/2+.18))
  elif q.GetLayer()==layer:obs.append((xy(q.GetStart()),xy(q.GetEnd()),k.ToMM(q.GetWidth())/2+.18))
 for f in b.GetFootprints():
  for d in f.Pads():
   if d.GetNetCode()==net.GetNetCode() or not d.IsOnLayer(layer):continue
   bb=d.GetBoundingBox();m=.29 if d.GetAttribute()==k.PAD_ATTRIB_NPTH else .18;rect.append((k.ToMM(bb.GetX())-m,k.ToMM(bb.GetY())-m,k.ToMM(bb.GetRight())+m,k.ToMM(bb.GetBottom())+m))
 def clear(q):
  if math.dist(q,a)<.6 or math.dist(q,z)<.6:return True
  x,y=q;return .25<x<27.25 and -.25<y<26.75 and not any(l<x<r and u<y<d for l,u,r,d in rect) and not any(ds(q,s,e)<w for s,e,w in obs)
 def line(s,e):
  n=max(1,math.ceil(math.dist(s,e)/.05));return all(clear((s[0]+(e[0]-s[0])*i/n,s[1]+(e[1]-s[1])*i/n)) for i in range(n+1))
 step=.1;pts={(x,y):(x*step,y*step) for x in range(3,273) for y in range(-2,268) if clear((x*step,y*step))};starts=sorted(pts,key=lambda q:math.dist(pts[q],a))[:32];goals={q for q in pts if math.dist(pts[q],z)<.3 and line(pts[q],z)};cost={};prev={};hq=[]
 for q in starts:
  if line(a,pts[q]):cost[q]=math.dist(a,pts[q]);prev[q]=None;heapq.heappush(hq,(cost[q]+math.dist(pts[q],z),q))
 end=None;seen=set()
 while hq:
  _,q=heapq.heappop(hq)
  if q in seen:continue
  seen.add(q)
  if q in goals:end=q;break
  for dx,dy in ((1,0),(-1,0),(0,1),(0,-1),(1,1),(1,-1),(-1,1),(-1,-1)):
   w=(q[0]+dx,q[1]+dy)
   if w not in pts or w in seen or not line(pts[q],pts[w]):continue
   nc=cost[q]+step*math.hypot(dx,dy)
   if nc<cost.get(w,1e99):cost[w]=nc;prev[w]=q;heapq.heappush(hq,(nc+math.dist(pts[w],z),w))
 assert end is not None,(a,z,b.GetLayerName(layer));path=[];q=end
 while q is not None:path.append(pts[q]);q=prev[q]
 path=[a]+list(reversed(path))+[z];simp=[path[0]];i=0
 while i<len(path)-1:
  j=len(path)-1
  while j>i+1 and not line(path[i],path[j]):j-=1
  simp.append(path[j]);i=j
 for s,e in zip(simp,simp[1:]):
  t=k.PCB_TRACK(b);t.SetNet(net);t.SetLayer(layer);t.SetWidth(k.FromMM(.2));t.SetStart(k.VECTOR2I(k.FromMM(s[0]),k.FromMM(s[1])));t.SetEnd(k.VECTOR2I(k.FromMM(e[0]),k.FromMM(e[1])));b.Add(t)
route(drop,goal,k.In2_Cu);k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(p),b)
