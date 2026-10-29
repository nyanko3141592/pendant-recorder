from pathlib import Path
import wx,json,math,heapq,subprocess,shutil,numpy as np
app=wx.App(False)
import pcbnew as k
from scipy.ndimage import distance_transform_edt
P=Path(__file__).parent;fn=P/'usb-both-front-trial.kicad_pcb';cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli';b=k.LoadBoard(str(P/'power-width-candidate.kicad_pcb'));layers=[k.F_Cu,k.In1_Cu,k.In2_Cu,k.In3_Cu,k.In4_Cu,k.B_Cu];step=.05;nx,ny=421,461
X,Y=np.meshgrid(np.arange(nx)*step,np.arange(ny)*step,indexing='ij')
def pt(x,y):return k.VECTOR2I(k.FromMM(x),k.FromMM(y))
def xy(p):return k.ToMM(p.x),k.ToMM(p.y)
def drc():
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(fn),b)
 subprocess.run([cli,'pcb','drc',str(fn),'--format','json','-o',str(P/'usb-both-front-trial-drc.json')],stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 return json.loads((P/'usb-both-front-trial-drc.json').read_text())

def masks(net):
 margin=.226 if b.FindNet(net).GetNetname() in ["/BAT","/VBUS","/SYS","/V3V3"] else .151
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
   pos=xy(t.GetPosition());r=k.ToMM(t.GetWidth(k.F_Cu))/2;blocked|=cap(pos,pos,r+margin)[None,:,:];via|=cap(pos,pos,r+.29)
  else:
   a,z=xy(t.GetStart()),xy(t.GetEnd());r=k.ToMM(t.GetWidth())/2;blocked[layers.index(t.GetLayer())]|=cap(a,z,r+margin);via|=cap(a,z,r+.29)
 for f in b.GetFootprints():
  for p in f.Pads():
   if p.GetNetCode()==net:continue
   q=p.GetBoundingBox();a,c,w,h=[k.ToMM(v) for v in [q.GetX(),q.GetY(),q.GetWidth(),q.GetHeight()]]
   if p.GetAttribute()==k.PAD_ATTRIB_NPTH:
    axy=xy(p.GetPosition());blocked|=cap(axy,axy,k.ToMM(p.GetDrillSize().x)/2+.27)[None,:,:];via|=cap(axy,axy,k.ToMM(p.GetDrillSize().x)/2+.39);continue
   for j,l in enumerate(layers):
    if p.IsOnLayer(l):blocked[j]|=(X>a-margin)&(X<a+w+margin)&(Y>c-margin)&(Y<c+h+margin)
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
 t=k.PCB_TRACK(b);t.SetStart(pt(*a));t.SetEnd(pt(*z));t.SetLayer(layers[j]);t.SetNetCode(net);t.SetWidth(k.FromMM(.25 if b.FindNet(net).GetNetname() in ["/BAT","/VBUS","/SYS","/V3V3"] else .1));b.Add(t)

for ext in ['kicad_pro','kicad_sch']:shutil.copy2(P/('power-width-candidate.'+ext),P/('usb-both-front-trial.'+ext))
removed=[]
for t in list(b.GetTracks()):
 if t.GetNetname()!='/USB_DM':continue
 if (isinstance(t,k.PCB_VIA) and xy(t.GetPosition())[0]<9) or (not isinstance(t,k.PCB_VIA) and (t.GetLayer()==k.In3_Cu or (t.GetLayer()==k.F_Cu and max(xy(t.GetStart())[0],xy(t.GetEnd())[0])<9))):
  removed.append(t.m_Uuid.AsString());b.DeleteNative(t)
for t in list(b.GetTracks()):
 if t.GetNetname()=='/USB_DP' and not isinstance(t,k.PCB_VIA) and t.GetLayer()==k.F_Cu and min(xy(t.GetStart())[0],xy(t.GetEnd())[0])<10.25:
  removed.append(t.m_Uuid.AsString());b.DeleteNative(t)
pads={(f.GetReference(),p.GetNumber()):p for f in b.GetFootprints() for p in f.Pads()}
results={}
for pin,jpin in [('32','A7'),('33','A6')]:
 a=pads[('U1',pin)];z=pads[('J1',jpin)];net=a.GetNetCode();blocked,via=masks(net);blocked[1:]=True;via[:]=True
 r=astar(component_endpoints(a),component_endpoints(z),blocked,via);results[a.GetNetname()]=bool(r)
 if r:
  route,aa,zz=r;last=(route[0][1]*step,route[0][2]*step);track(aa,last,0,net)
  for u in route[1:]:
   q=(u[1]*step,u[2]*step);track(last,q,0,net);last=q
  track(last,zz,0,net)
  print('ROUTED FRONT',a.GetNetname(),len(route),flush=True)
 else:print('NO FRONT ROUTE',a.GetNetname(),flush=True)
x=drc();print('RESULT',len(x['violations']),len(x['unconnected_items']),flush=True)
(P/'usb-both-front-trial-result.json').write_text(json.dumps(dict(route_found=results,removed=removed,violations=len(x['violations']),unconnected=len(x['unconnected_items']),qualified=False),indent=2)+'\n')
