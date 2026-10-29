from pathlib import Path
import wx,json,math,heapq,subprocess,shutil,numpy as np
app=wx.App(False)
import pcbnew as k
from scipy.ndimage import distance_transform_edt
P=Path(__file__).parent;fn=P/'resume-extra-scan.kicad_pcb';cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli';shutil.copyfile(P/'pb1-rejected-SD_EN.kicad_pcb',fn)
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(P/('pb1-rejected-SD_EN'+ext),fn.with_suffix(ext))
b=k.LoadBoard(str(fn));layers=[k.F_Cu,k.In1_Cu,k.In2_Cu,k.In3_Cu,k.In4_Cu,k.B_Cu];step=.05;nx,ny=521,581
X,Y=np.meshgrid(np.arange(nx)*step,np.arange(ny)*step,indexing='ij')
def pt(x,y):return k.VECTOR2I(k.FromMM(x),k.FromMM(y))
def xy(p):return k.ToMM(p.x),k.ToMM(p.y)
def drc():
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(fn),b)
 subprocess.run([cli,'pcb','drc',str(fn),'--format','json','-o',str(P/'resume-extra-scan.drc.json')],stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 return json.loads((P/'resume-extra-scan.drc.json').read_text())

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
   pos=xy(t.GetPosition());r=k.ToMM(t.GetWidth(k.F_Cu))/2;blocked|=cap(pos,pos,r+.152)[None,:,:];via|=cap(pos,pos,r+.306)
  else:
   a,z=xy(t.GetStart()),xy(t.GetEnd());r=k.ToMM(t.GetWidth())/2;blocked[layers.index(t.GetLayer())]|=cap(a,z,r+.152);via|=cap(a,z,r+.306)
 for f in b.GetFootprints():
  for p in f.Pads():
   if p.GetNetCode()==net:continue
   q=p.GetBoundingBox();a,c,w,h=[k.ToMM(v) for v in [q.GetX(),q.GetY(),q.GetWidth(),q.GetHeight()]]
   if p.GetAttribute()==k.PAD_ATTRIB_NPTH:
    axy=xy(p.GetPosition());blocked|=cap(axy,axy,k.ToMM(p.GetDrillSize().x)/2+.27)[None,:,:];via|=cap(axy,axy,k.ToMM(p.GetDrillSize().x)/2+.39);continue
   for j,l in enumerate(layers):
    if p.IsOnLayer(l):blocked[j]|=(X>a-.152)&(X<a+w+.152)&(Y>c-.152)&(Y<c+h+.152)
   via|=(X>a-.306)&(X<a+w+.306)&(Y>c-.306)&(Y<c+h+.306)
 if net!=b.FindNet("/GND").GetNetCode():blocked[1]=True;blocked[3]=True
 # Actual footprint rule areas; conservative bounding rectangles after transform.
 for f in b.GetFootprints():
  for z in f.Zones():
   if not z.GetIsRuleArea():continue
   q=z.GetBoundingBox();a,c,w,h=[k.ToMM(v) for v in [q.GetX(),q.GetY(),q.GetWidth(),q.GetHeight()]]
   if z.GetDoNotAllowVias():via|=(X>a-.206)&(X<a+w+.206)&(Y>c-.206)&(Y<c+h+.206)
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


u=next(f for f in b.GetFootprints() if f.GetReference()=='U1');pads={p.GetNumber():p for p in u.Pads()};net=b.FindNet('/USB_RESUME_PULSE').GetNetCode();old=pads['19'];old.SetNetCode(0)
seed=next(t for t in b.GetTracks() if t.m_Uuid.AsString()=='b99e67b2-7d78-44a2-875e-beea591566e4');base=drc();results=[]
for pin in ['6','5','2']:
 pad=pads[pin];assert pad.GetNetCode()==0;pad.SetNetCode(net)
 blocked,via=masks(net);r=astar(component_endpoints(pad),component_endpoints(seed),blocked,via);print('PIN',pin,'PATH',bool(r),flush=True)
 if not r:pad.SetNetCode(0);continue
 route,a,z=r;before={t.m_Uuid.AsString() for t in b.GetTracks()};last=(route[0][1]*step,route[0][2]*step);track(a,last,route[0][0],net)
 for u,v in zip(route,route[1:]):
  q=(v[1]*step,v[2]*step)
  if u[0]!=v[0]:
   vv=k.PCB_VIA(b);vv.SetPosition(pt(*q));vv.SetWidth(k.FromMM(.4));vv.SetDrill(k.FromMM(.2));vv.SetViaType(k.VIATYPE_THROUGH);vv.SetLayerPair(k.F_Cu,k.B_Cu);vv.SetNetCode(net);b.Add(vv)
  else:track(last,q,u[0],net)
  last=q
 track(last,z,route[-1][0],net)
 check=drc();accepted=not check['violations'] and len(check['unconnected_items'])<=len(base['unconnected_items'])
 entry=dict(pin=pin,accepted=accepted,violations=len(check['violations']),remaining=len(check['unconnected_items']));results.append(entry);print(entry,flush=True)
 if accepted:break
 k.SaveBoard(str(P/('resume-extra-rejected-pin'+pin+'.kicad_pcb')),b)
 (P/('resume-extra-rejected-pin'+pin+'.drc.json')).write_text(json.dumps(check,indent=2))
 for t in list(b.GetTracks()):
  if t.m_Uuid.AsString() not in before:b.DeleteNative(t)
 pad.SetNetCode(0)
else:old.SetNetCode(net)
final=drc();(P/'resume-extra-scan-review.json').write_text(json.dumps(dict(status='EXPERIMENTAL_PINMAP_NOT_SYNCHRONIZED',attempts=results,violations=len(final['violations']),remaining=len(final['unconnected_items'])),indent=2)+'\n')
