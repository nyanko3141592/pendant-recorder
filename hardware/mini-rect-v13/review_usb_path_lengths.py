"""Copper graph path lengths, with ideal pad connections; not delay/skew qualification."""
from pathlib import Path
import wx,pcbnew as k,json,math,heapq,hashlib,collections
app=wx.App(False);P=Path(__file__).resolve().parent;src=P/'usb-ground-plane-candidate.kicad_pcb';b=k.LoadBoard(str(src));layers=[k.F_Cu,k.In1_Cu,k.In2_Cu,k.In3_Cu,k.In4_Cu,k.B_Cu]
th=[.035,.1164,.0152,.13,.0152,.2028,.0152,.13,.0152,.1164,.035];depth={};z=0
for i,t in enumerate(th):
 if i%2==0:depth[layers[i//2]]=z+t/2
 z+=t
rows=[]
for net,pin in [('/USB_DP','33'),('/USB_DM','32')]:
 tracks=[t for t in b.GetTracks() if t.GetNetname()==net and not isinstance(t,k.PCB_VIA)];vias=[t for t in b.GetTracks() if t.GetNetname()==net and isinstance(t,k.PCB_VIA)];pads=[p for f in b.GetFootprints() for p in f.Pads() if p.GetNetname()==net];nodes=set();g=collections.defaultdict(list)
 def key(q,l):return (q.x,q.y,l)
 def edge(a,c,w,kind):g[a].append((c,w,kind));g[c].append((a,w,kind))
 for t in tracks:nodes.update([key(t.GetStart(),t.GetLayer()),key(t.GetEnd(),t.GetLayer())])
 for v in vias:
  for l in layers:nodes.add(key(v.GetPosition(),l))
 for t in tracks:
  a,c=t.GetStart(),t.GetEnd();dx,dy=c.x-a.x,c.y-a.y;den=dx*dx+dy*dy
  if not den:continue
  pts=[]
  for n in nodes:
   if n[2]!=t.GetLayer():continue
   u=((n[0]-a.x)*dx+(n[1]-a.y)*dy)/den
   if -.000001<=u<=1.000001 and math.hypot(n[0]-a.x-u*dx,n[1]-a.y-u*dy)<=2:pts.append((u,n))
  pts.sort()
  for (_,u),(_,v) in zip(pts,pts[1:]):edge(u,v,math.hypot(v[0]-u[0],v[1]-u[1])/1e6,b.GetLayerName(t.GetLayer()))
 for v in vias:
  for a,c in zip(layers,layers[1:]):edge(key(v.GetPosition(),a),key(v.GetPosition(),c),abs(depth[c]-depth[a]),'via_vertical')
 padnodes={}
 for p in pads:
  name=p.GetParentFootprint().GetReference()+':'+p.GetNumber();pn=('pad',name);padnodes[name]=pn
  for n in nodes:
   if p.IsOnLayer(n[2]) and p.HitTest(k.VECTOR2I(n[0],n[1])):edge(pn,n,0.,'ideal_pad')
 start=padnodes['U1:'+pin];counter=0;queue=[(0,counter,start)];cost={start:0};prev={}
 while queue:
  value,_,u=heapq.heappop(queue)
  if value>cost[u]+1e-10:continue
  for v,w,kind in g[u]:
   nv=value+w
   if nv<cost.get(v,math.inf)-1e-10:cost[v]=nv;prev[v]=(u,w,kind);counter+=1;heapq.heappush(queue,(nv,counter,v))
 for name,target in padnodes.items():
  if not name.startswith('J1:'):continue
  assert target in cost, name
  by=collections.defaultdict(float);path=[];v=target
  while v!=start:
   u,w,kind=prev[v];by[kind]+=w;path.append({'from':u,'to':v,'length_mm':w,'kind':kind});v=u
  rows.append({'net':net,'from':'U1:'+pin,'to':name,'copper_length_mm':round(cost[target],6),'by_layer_mm':{x:round(y,6) for x,y in by.items()},'path':list(reversed(path))})
r={'status':'COPPER_GRAPH_LENGTHS_WITH_IDEAL_PADS_NOT_TIMING_APPROVAL','source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'rows':rows,'limitations':['All contact points within each pad treated equipotential with zero internal length','No package, connector, ESD-device propagation or dielectric delay model','Shortest graph path does not measure open stubs or return loss','Via barrel uses copper-center layer distance, not stub model']};(P/'usb-path-length-review.json').write_text(json.dumps(r,indent=2)+'\n');print([(r['to'],r['copper_length_mm'],r['by_layer_mm']) for r in rows])
