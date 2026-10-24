"""Conservative grid route candidates. Run KiCad DRC after each batch; no DRC bypass."""
import pcbnew as p,numpy as np,math,heapq,json,sys,time
from pathlib import Path
P=Path(__file__).resolve().parent;stem=sys.argv[1] if len(sys.argv)>1 else 'candidate';b=p.LoadBoard(str(P/(stem+'.kicad_pcb')));d=json.load(open(P/(sys.argv[2] if len(sys.argv)>2 else ('drc6.json' if stem=='candidate6' else 'drc.json'))))
via_drill=float(sys.argv[4]) if len(sys.argv)>4 else .2
via_diameter=float(sys.argv[3]) if len(sys.argv)>3 else .4;via_margin=via_diameter/2+.11
step=.05;origin=88.5;N=461;xx=origin+np.arange(N)*step;X,Y=np.meshgrid(xx,xx,indexing='ij');layers=[p.F_Cu]+[p.In1_Cu+2*i for i in range(b.GetCopperLayerCount()-2)]+[p.B_Cu]
# KiCad 10 layer constants are spaced by 2; get actual enabled copper layer sequence instead.
layers=list(b.GetEnabledLayers().CuStack())
lookup={a.m_Uuid.AsString():a for a in list(b.GetPads())+list(b.GetTracks())};report=[]
def xy(v):return p.ToMM(v.x),p.ToMM(v.y)
def segdist(a,c):
 dx,dy=c[0]-a[0],c[1]-a[1];den=dx*dx+dy*dy;u=np.clip(((X-a[0])*dx+(Y-a[1])*dy)/den,0,1) if den else 0
 return np.hypot(X-a[0]-u*dx,Y-a[1]-u*dy)
def grid(a):return (round((a[0]-origin)/step),round((a[1]-origin)/step))
def layer_ids(o):
 if isinstance(o,p.PCB_VIA):return list(range(len(layers)))
 if isinstance(o,p.PAD):return [i for i,l in enumerate(layers) if o.IsOnLayer(l)]
 return [layers.index(o.GetLayer())]
for k,v in enumerate(d['unconnected_items']):
 its=v['items'];a,z=[lookup.get(it['uuid']) for it in its]
 if a is None or z is None:continue
 net=a.GetNetCode();start=tuple(its[0]['pos'][q] for q in ['x','y']);end=tuple(its[1]['pos'][q] for q in ['x','y']);sx,sy=grid(start);gx,gy=grid(end)
 existing_vias={}
 radius=np.hypot(X-100,Y-100);blocked=np.repeat((radius>11.24)[None,:,:],len(layers),axis=0);vbad=radius>11.04
 for pad in b.GetPads():
  bb=pad.GetBoundingBox();px,py,w,h=[p.ToMM(t) for t in [bb.GetX(),bb.GetY(),bb.GetWidth(),bb.GetHeight()]]
  hole=pad.GetAttribute()==p.PAD_ATTRIB_NPTH;vm=via_diameter/2+.21 if hole else via_margin
  vbad|=(X>px-vm)&(X<px+w+vm)&(Y>py-vm)&(Y<py+h+vm)
  if pad.GetNetCode()==net and not hole:continue
  margin=.26 if hole else .16;mask=(X>px-margin)&(X<px+w+margin)&(Y>py-margin)&(Y<py+h+margin)
  for li,l in enumerate(layers):
   if hole or pad.IsOnLayer(l):blocked[li]|=mask
 for t in b.GetTracks():
  if isinstance(t,p.PCB_VIA):
   dist=segdist(xy(t.GetPosition()),xy(t.GetPosition()));w=p.ToMM(t.GetWidth(p.F_Cu));vbad|=dist<(via_margin+w/2)
   if t.GetNetCode()==net:existing_vias[grid(xy(t.GetPosition()))]=xy(t.GetPosition())
   if t.GetNetCode()!=net:blocked|=(dist<(.16+w/2))[None,:,:]
  else:
   dist=segdist(xy(t.GetStart()),xy(t.GetEnd()));w=p.ToMM(t.GetWidth())
   if t.GetNetCode()!=net:vbad|=dist<(via_margin+w/2)
   if t.GetNetCode()!=net and t.GetLayer() in layers:blocked[layers.index(t.GetLayer())]|=dist<(.16+w/2)
 for vx,vy in existing_vias:vbad[vx,vy]=False
 sources=[(l,sx,sy) for l in layer_ids(a) if not blocked[l,sx,sy]];targets={(l,gx,gy) for l in layer_ids(z) if not blocked[l,gx,gy]}
 if not sources or not targets:report.append({'index':k,'net':a.GetNetname(),'result':'endpoint_blocked'});print(k,a.GetNetname(),'endpoint blocked',flush=True);continue
 q=[];cost={u:0 for u in sources};prev={};closed=set();goal=None;t0=time.time()
 for u in sources:heapq.heappush(q,(math.hypot(sx-gx,sy-gy),u))
 while q and time.time()-t0<25:
  _,u=heapq.heappop(q)
  if u in closed:continue
  closed.add(u)
  if u in targets:goal=u;break
  l,x,y=u
  opts=[((l,x+dx,y+dy),math.hypot(dx,dy)) for dx,dy in [(1,0),(-1,0),(0,1),(0,-1),(1,1),(-1,1),(1,-1),(-1,-1)]]
  if not vbad[x,y]:opts.extend(((li,x,y),30) for li in range(len(layers)) if li!=l)
  for node,dc in opts:
   li,ix,iy=node
   if not(0<=ix<N and 0<=iy<N) or blocked[node]:continue
   if li==l and ix!=x and iy!=y and (blocked[l,ix,y] or blocked[l,x,iy]):continue
   nc=cost[u]+dc
   if nc<cost.get(node,1e30):cost[node]=nc;prev[node]=u;heapq.heappush(q,(nc+math.hypot(ix-gx,iy-gy),node))
 if goal is None:report.append({'index':k,'net':a.GetNetname(),'result':'no_route_or_timeout','searched':len(closed)});print(k,a.GetNetname(),'no route',len(closed),flush=True);continue
 path=[goal]
 while path[-1] in prev:path.append(prev[path[-1]])
 path.reverse();points=[(layers[l],*existing_vias.get((x,y),(origin+x*step,origin+y*step))) for l,x,y in path];points=[(points[0][0],*start)]+points+[(points[-1][0],*end)]
 keep=[points[0]]
 for j in range(1,len(points)-1):
  v0,v1,v2=points[j-1:j+2]
  if v0[0]!=v1[0] or v1[0]!=v2[0] or abs((v1[1]-v0[1])*(v2[2]-v1[2])-(v1[2]-v0[2])*(v2[1]-v1[1]))>1e-9:keep.append(v1)
 keep.append(points[-1]);vias=set()
 for v0,v1 in zip(keep,keep[1:]):
  if v0[0]!=v1[0]:
   pos=v0[1:]
   if pos in vias or pos in existing_vias.values():continue
   t=p.PCB_VIA(b);t.SetPosition(p.VECTOR2I(p.FromMM(pos[0]),p.FromMM(pos[1])));t.SetWidth(p.FromMM(via_diameter));t.SetDrill(p.FromMM(via_drill));t.SetLayerPair(p.F_Cu,p.B_Cu);t.SetViaType(p.VIATYPE_THROUGH);vias.add(pos)
  else:
   if v0[1:]==v1[1:]:continue
   t=p.PCB_TRACK(b);t.SetStart(p.VECTOR2I(p.FromMM(v0[1]),p.FromMM(v0[2])));t.SetEnd(p.VECTOR2I(p.FromMM(v1[1]),p.FromMM(v1[2])));t.SetWidth(p.FromMM(.1));t.SetLayer(v0[0])
  t.SetNetCode(net);b.Add(t)
 report.append({'index':k,'net':a.GetNetname(),'result':'candidate_added','vertices':len(keep)});print(k,a.GetNetname(),'added',len(keep),flush=True)
p.ZONE_FILLER(b).Fill(b.Zones());p.SaveBoard(str(P/(stem+'-grid.kicad_pcb')),b);(P/(stem+'-grid-report.json')).write_text(json.dumps(report,indent=2))
