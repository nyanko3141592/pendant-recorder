from pathlib import Path
import wx,json,math,heapq,subprocess,shutil,numpy as np
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;fn=P/'signal-repair.kicad_pcb';cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli';b=k.LoadBoard(str(fn));layers=[k.F_Cu,k.In1_Cu,k.In2_Cu,k.In3_Cu,k.In4_Cu,k.B_Cu];step=.05;nx,ny=421,461
X,Y=np.meshgrid(np.arange(nx)*step,np.arange(ny)*step,indexing='ij')
def pt(x,y):return k.VECTOR2I(k.FromMM(x),k.FromMM(y))
def xy(p):return k.ToMM(p.x),k.ToMM(p.y)
def drc():
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(fn),b)
 subprocess.run([cli,'pcb','drc',str(fn),'--format','json','-o',str(P/'signal-repair-drc.json')],stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 return json.loads((P/'signal-repair-drc.json').read_text())

def masks(net):
 qx=np.abs(X-10.5)-8;qy=np.abs(Y-11.5)-9
 edge=(np.hypot(np.maximum(qx,0),np.maximum(qy,0))+np.minimum(np.maximum(qx,qy),0)>2.14)|(Y<.36)
 blocked=np.repeat(edge[None,:,:],6,axis=0);via=edge.copy()
 def cap(a,z,r):
  ax,ay=a;zx,zy=z;dx=zx-ax;dy=zy-ay;den=dx*dx+dy*dy
  u=np.clip(((X-ax)*dx+(Y-ay)*dy)/den,0,1) if den else 0
  return (X-ax-u*dx)**2+(Y-ay-u*dy)**2<=r*r
 for t in b.GetTracks():
  if t.GetNetCode()==net:
   if isinstance(t,k.PCB_VIA):via|=cap(xy(t.GetPosition()),xy(t.GetPosition()),.405)
   continue
  if isinstance(t,k.PCB_VIA):
   pos=xy(t.GetPosition());r=k.ToMM(t.GetWidth(k.F_Cu))/2;blocked|=cap(pos,pos,r+.151)[None,:,:];via|=cap(pos,pos,r+.29)
  else:
   a,z=xy(t.GetStart()),xy(t.GetEnd());r=k.ToMM(t.GetWidth())/2;blocked[layers.index(t.GetLayer())]|=cap(a,z,r+.151);via|=cap(a,z,r+.29)
 for f in b.GetFootprints():
  for p in f.Pads():
   if p.GetNetCode()==net:continue
   q=p.GetBoundingBox();a,c,w,h=[k.ToMM(v) for v in [q.GetX(),q.GetY(),q.GetWidth(),q.GetHeight()]]
   if p.GetAttribute()==k.PAD_ATTRIB_NPTH:
    axy=xy(p.GetPosition());blocked|=cap(axy,axy,k.ToMM(p.GetDrillSize().x)/2+.27)[None,:,:];via|=cap(axy,axy,k.ToMM(p.GetDrillSize().x)/2+.39);continue
   for j,l in enumerate(layers):
    if p.IsOnLayer(l):blocked[j]|=(X>a-.151)&(X<a+w+.151)&(Y>c-.151)&(Y<c+h+.151)
   via|=(X>a-.29)&(X<a+w+.29)&(Y>c-.29)&(Y<c+h+.29)
 if net!=b.FindNet("/GND").GetNetCode():blocked[1]=True;blocked[4]=True
 via|=(X>10.555)&(X<13.445)&(Y>2.69)&(Y<4.31) # actual TC2030 via keepout plus via radius
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
 if not starts or not ends:return
 def heur(u):return min(math.hypot(u[1]-v[1],u[2]-v[2])+(0 if u[0]==v[0] else 8) for v in ends)
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
for iteration in range(1):
 x=drc();objs={o.m_Uuid.AsString():o for o in list(b.GetTracks())+[p for f in b.GetFootprints() for p in f.Pads()]}
 print('Iteration',iteration,'remaining',len(x['unconnected_items']),flush=True)
 for c in sorted(x['unconnected_items'],key=lambda c:0 if any('PDM_CLK]' in i['description'] or 'MIC_WAKE]' in i['description'] for i in c['items']) else 1):
  aa,zz=[objs.get(i['uuid']) for i in c['items'][:2]]
  if aa is None or zz is None:continue
  if aa.GetNetname() in ["/GND","/USB_DP_MCU","/USB_DM_MCU"]:continue
  net=aa.GetNetCode();blocked,via=masks(net);r=astar(component_endpoints(aa),component_endpoints(zz),blocked,via)
  if not r:print('NO PATH',aa.GetNetname(),flush=True);continue
  route,a,z=r;last=(route[0][1]*step,route[0][2]*step);track(a,last,route[0][0],net)
  for u,v in zip(route,route[1:]):
   q=(v[1]*step,v[2]*step)
   if u[0]!=v[0]:
    vv=k.PCB_VIA(b);vv.SetPosition(pt(*q));vv.SetWidth(k.FromMM(.35));vv.SetDrill(k.FromMM(.15));vv.SetViaType(k.VIATYPE_THROUGH);vv.SetLayerPair(k.F_Cu,k.B_Cu);vv.SetNetCode(net);b.Add(vv)
   else:track(last,q,u[0],net)
   last=q
  track(last,z,route[-1][0],net);print('ROUTED',aa.GetNetname(),len(route),flush=True)
x=drc();print('RESULT',len(x['violations']),len(x['unconnected_items']),flush=True)
