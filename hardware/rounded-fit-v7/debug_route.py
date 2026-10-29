from pathlib import Path
import wx,json,math,heapq,subprocess,shutil,numpy as np
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;fn=P/'pendant-compact-100-v5.kicad_pcb';cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli';b=k.LoadBoard(str(fn));layers=[k.F_Cu,k.In1_Cu,k.In2_Cu,k.In3_Cu,k.In4_Cu,k.B_Cu];step=.05;nx,ny=481,541
X,Y=np.meshgrid(np.arange(nx)*step,np.arange(ny)*step,indexing='ij')
def pt(x,y):return k.VECTOR2I(k.FromMM(x),k.FromMM(y))
def xy(p):return k.ToMM(p.x),k.ToMM(p.y)
def drc():
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(fn),b);shutil.copyfile(P.parent/'compact-100-v5'/fn.with_suffix('.kicad_pro').name,fn.with_suffix('.kicad_pro'))
 subprocess.run([cli,'pcb','drc',str(fn),'--format','json','--schematic-parity','-o',str(P/'drc.json')],stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 return json.loads((P/'drc.json').read_text())

def masks(net):
 qx=np.abs(X-12)-8;qy=np.abs(Y-12.5)-10.5
 edge=(np.hypot(np.maximum(qx,0),np.maximum(qy,0))+np.minimum(np.maximum(qx,qy),0)>3.64)|(Y<.36)
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
    if p.IsOnLayer(l):blocked[j]|=(X>a-.17)&(X<a+w+.151)&(Y>c-.17)&(Y<c+h+.151)
   via|=(X>a-.29)&(X<a+w+.29)&(Y>c-.29)&(Y<c+h+.29)
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

from PIL import Image,ImageDraw
for netname in ['/USB_DP_MCU','/MIC_WAKE']:
 net=b.FindNet(netname).GetNetCode();blocked,via=masks(net);arr=np.ones((ny,nx,3),dtype=np.uint8)*255;arr[~via.T]=[180,220,255];arr[blocked[0].T]=[40,40,40];im=Image.fromarray(arr).resize((nx*3,ny*3));draw=ImageDraw.Draw(im)
 for f in b.GetFootprints():
  for p in f.Pads():
   if p.GetNetCode()==net:
    xx,yy=xy(p.GetPosition());xx=xx/step*3;yy=yy/step*3;draw.ellipse((xx-8,yy-8,xx+8,yy+8),outline='red',width=3);draw.text((xx+8,yy),f.GetReference()+'.'+p.GetNumber(),fill='red')
 im.save(str(P/(netname[1:]+'-obstacles.png')))
