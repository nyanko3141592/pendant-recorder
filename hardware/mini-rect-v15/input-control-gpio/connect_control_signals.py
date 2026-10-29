from pathlib import Path
import wx,json,math,heapq,subprocess,shutil,numpy as np
app=wx.App(False)
import pcbnew as k
from scipy.ndimage import distance_transform_edt
P=Path(__file__).parent;fn=P/'input-final-candidate.kicad_pcb';cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli';shutil.copyfile(P/'input-boot-underpass.kicad_pcb',fn)
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(P/('input-boot-underpass'+ext),fn.with_suffix(ext))
b=k.LoadBoard(str(fn));layers=[k.F_Cu,k.In1_Cu,k.In2_Cu,k.In3_Cu,k.In4_Cu,k.B_Cu];step=.05;nx,ny=521,581
X,Y=np.meshgrid(np.arange(nx)*step,np.arange(ny)*step,indexing='ij')
def pt(x,y):return k.VECTOR2I(k.FromMM(x),k.FromMM(y))
def xy(p):return k.ToMM(p.x),k.ToMM(p.y)
def drc():
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(fn),b)
 subprocess.run([cli,'pcb','drc',str(fn),'--format','json','-o',str(P/'input-final-candidate.drc.json')],stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 return json.loads((P/'input-final-candidate.drc.json').read_text())

def masks(net):
 edge=(X<.36)|(X>25.64)|(Y<.36)|(Y>28.64)
 blocked=np.repeat(edge[None,:,:],6,axis=0);via=edge.copy()
 def cap(a,z,r):
  ax,ay=a;zx,zy=z;dx=zx-ax;dy=zy-ay;den=dx*dx+dy*dy
  u=np.clip(((X-ax)*dx+(Y-ay)*dy)/den,0,1) if den else 0
  return (X-ax-u*dx)**2+(Y-ay-u*dy)**2<=r*r
 for t in b.GetTracks():
  if t.GetNetCode()==net:
   if isinstance(t,k.PCB_VIA):via|=cap(xy(t.GetPosition()),xy(t.GetPosition()),.451)
   continue
  if isinstance(t,k.PCB_VIA):
   pos=xy(t.GetPosition());r=k.ToMM(t.GetWidth(k.F_Cu))/2;blocked|=cap(pos,pos,r+.17)[None,:,:];via|=cap(pos,pos,r+.351)
  else:
   a,z=xy(t.GetStart()),xy(t.GetEnd());r=k.ToMM(t.GetWidth())/2;blocked[layers.index(t.GetLayer())]|=cap(a,z,r+.17);via|=cap(a,z,r+.351)
 for f in b.GetFootprints():
  for p in f.Pads():
   if p.GetNetCode()==net:continue
   q=p.GetBoundingBox();a,c,w,h=[k.ToMM(v) for v in [q.GetX(),q.GetY(),q.GetWidth(),q.GetHeight()]]
   if p.GetAttribute()==k.PAD_ATTRIB_NPTH:
    axy=xy(p.GetPosition());blocked|=cap(axy,axy,k.ToMM(p.GetDrillSize().x)/2+.27)[None,:,:];via|=cap(axy,axy,k.ToMM(p.GetDrillSize().x)/2+.39);continue
   for j,l in enumerate(layers):
    if p.IsOnLayer(l):blocked[j]|=(X>a-.17)&(X<a+w+.17)&(Y>c-.17)&(Y<c+h+.17)
   via|=(X>a-.351)&(X<a+w+.351)&(Y>c-.351)&(Y<c+h+.351)
 if net!=b.FindNet("/GND").GetNetCode():blocked[1]=True;blocked[3]=True
 # Actual footprint rule areas; conservative bounding rectangles after transform.
 for f in b.GetFootprints():
  for z in f.Zones():
   if not z.GetIsRuleArea():continue
   q=z.GetBoundingBox();a,c,w,h=[k.ToMM(v) for v in [q.GetX(),q.GetY(),q.GetWidth(),q.GetHeight()]]
   if z.GetDoNotAllowVias():via|=(X>a-.1725)&(X<a+w+.1725)&(Y>c-.1725)&(Y<c+h+.1725)
   if z.GetDoNotAllowTracks():
    for j,l in enumerate(layers):
     if z.IsOnLayer(l):blocked[j]|=(X>a-.05)&(X<a+w+.05)&(Y>c-.05)&(Y<c+h+.05)
 # Avoid placing a new hole into any SMD land, including its own net.
 for f in b.GetFootprints():
  for p in f.Pads():
   if p.GetAttribute()!=k.PAD_ATTRIB_SMD:continue
   q=p.GetBoundingBox();a,c,w,h=[k.ToMM(v) for v in [q.GetX(),q.GetY(),q.GetWidth(),q.GetHeight()]]
   via|=(X>a-.15)&(X<a+w+.15)&(Y>c-.15)&(Y<c+h+.15)
 return blocked,via

def endpoints(obj):
 if isinstance(obj,k.PCB_VIA):return [(xy(obj.GetPosition()),j) for j in range(6)]
 if isinstance(obj,k.PCB_TRACK):
  a,z=xy(obj.GetStart()),xy(obj.GetEnd());n=max(2,int(math.hypot(a[0]-z[0],a[1]-z[1])/.1)+1)
  return [((a[0]+(z[0]-a[0])*u/(n-1),a[1]+(z[1]-a[1])*u/(n-1)),layers.index(obj.GetLayer())) for u in range(n)]
 q=obj.GetBoundingBox();a,c,w,h=[k.ToMM(v) for v in [q.GetX(),q.GetY(),q.GetWidth(),q.GetHeight()]];out=[]
 for ix in range(math.ceil(a/step),math.floor((a+w)/step)+1):
  for iy in range(math.ceil(c/step),math.floor((c+h)/step)+1):
   if obj.HitTest(pt(ix*step,iy*step)):
    out.extend([((ix*step,iy*step),j) for j,l in enumerate(layers) if obj.IsOnLayer(l)])
 return out
def component_endpoints(seed):
 b.BuildConnectivity();conn=b.GetConnectivity();queue=[seed];seen=set();out=[]
 while queue:
  obj=queue.pop();uid=obj.m_Uuid.AsString()
  if uid in seen:continue
  seen.add(uid)
  if isinstance(obj,(k.PCB_TRACK,k.PAD)):
   out.extend(endpoints(obj))
   queue.extend(list(conn.GetConnectedTracks(obj))+list(conn.GetConnectedPads(obj)))
 return list(dict.fromkeys(out))
def astar(a,z,blocked,via):
 starts={};ends={}
 for dest,points in [(starts,a),(ends,z)]:
  for (xx,yy),j in points:
   ix,iy=round(xx/step),round(yy/step)
   if 0<=ix<nx and 0<=iy<ny and not blocked[j,ix,iy]:dest[(j,ix,iy)]=(xx,yy)
 print('ENDPOINTS',len(starts),len(ends),flush=True)
 if not starts or not ends:return
 # Exact nearest-target Euclidean distance per layer, precomputed once.
 # Previously every expanded node scanned thousands of ground endpoints.
 distance=np.full((6,nx,ny),np.inf)
 for j in range(6):
  target=np.ones((nx,ny),dtype=bool);present=False
  for jj,ix,iy in ends:
   if jj==j:target[ix,iy]=False;present=True
  if present:distance[j]=distance_transform_edt(target)
 lower=np.minimum(distance,distance.min(axis=0)[None,:,:]+8)
 def heur(u):return float(lower[u])
 queue=[(heur(u),0,u) for u in starts];heapq.heapify(queue);cost={u:0 for u in starts};prev={};dirs=[(dx,dy) for dx in [-1,0,1] for dy in [-1,0,1] if dx or dy]
 while queue:
  _,g,u=heapq.heappop(queue)
  if g>cost[u]+1e-8:continue
  if u in ends:
   route=[u]
   while u in prev:u=prev[u];route.append(u)
   route.reverse();return route,starts[route[0]],ends[route[-1]]
  j,ix,iy=u;neighbors=[]
  for dx,dy in dirs:
   xx,yy=ix+dx,iy+dy
   if 0<=xx<nx and 0<=yy<ny and not blocked[j,xx,yy] and not(dx and dy and (blocked[j,ix+dx,iy] or blocked[j,ix,iy+dy])):neighbors.append(((j,xx,yy),math.hypot(dx,dy)))
  if not via[ix,iy]:neighbors.extend(((jj,ix,iy),12) for jj in range(6) if jj!=j and not blocked[jj,ix,iy])
  for v,price in neighbors:
   ng=g+price
   if ng<cost.get(v,1e99):cost[v]=ng;prev[v]=u;heapq.heappush(queue,(ng+heur(v),ng,v))

def track(a,z,j,net):
 if a==z:return
 t=k.PCB_TRACK(b);t.SetStart(pt(*a));t.SetEnd(pt(*z));t.SetLayer(layers[j]);t.SetNetCode(net);t.SetWidth(k.FromMM(.1));b.Add(t)


results=[]
for iteration in range(12):
 d=drc()
 if not d['unconnected_items']:break
 items={a.m_Uuid.AsString():a for a in list(b.GetTracks())+[p for f in b.GetFootprints() for p in f.Pads()]}
 progress=False
 for item in d['unconnected_items']:
  uu=[v['uuid'] for v in item['items']]
  if not all(u in items for u in uu):continue
  a0,z0=[items[u] for u in uu];net=a0.GetNetCode();name=a0.GetNetname()
  blocked,via=masks(net);r=astar(component_endpoints(a0),component_endpoints(z0),blocked,via)
  print('PATH',name,bool(r),flush=True)
  if not r:continue
  route,a,z=r;before={t.m_Uuid.AsString() for t in b.GetTracks()}
  last=(route[0][1]*step,route[0][2]*step);track(a,last,route[0][0],net)
  for u,v in zip(route,route[1:]):
   q=(v[1]*step,v[2]*step)
   if u[0]!=v[0]:
    vv=k.PCB_VIA(b);vv.SetPosition(pt(*q));vv.SetWidth(k.FromMM(.45));vv.SetDrill(k.FromMM(.2));vv.SetViaType(k.VIATYPE_THROUGH);vv.SetLayerPair(k.F_Cu,k.B_Cu);vv.SetNetCode(net);b.Add(vv)
   else:track(last,q,u[0],net)
   last=q
  track(last,z,route[-1][0],net)
  check=drc();accepted=not check['violations'] and len(check['unconnected_items'])<len(d['unconnected_items'])
  results.append(dict(net=name,accepted=accepted,violations=len(check['violations']),remaining=len(check['unconnected_items'])))
  print(results[-1],flush=True)
  if not accepted:
   tag=name.strip('/');(P/('rejected-'+tag+'.json')).write_text(json.dumps(check,indent=2)+'\n');k.SaveBoard(str(P/('rejected-'+tag+'.kicad_pcb')),b)
  if accepted:progress=True;break
  for t in list(b.GetTracks()):
   if t.m_Uuid.AsString() not in before:b.DeleteNative(t)
  drc()
 if not progress:break
(P/'connection-routing-review.json').write_text(json.dumps({'status':'NOT_RELEASED','attempts':results},indent=2)+'\n')
print('FINAL',len(drc()['unconnected_items']),flush=True)
