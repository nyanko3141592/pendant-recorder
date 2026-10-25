from pathlib import Path
import wx,heapq,math,json,subprocess,hashlib
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent
if json.loads((P/'order-status.json').read_text()).get('unconnected_items')==0:raise SystemExit('Already connected: refusing to duplicate routing')
fn=P/'pendant-compact-100-v5.kicad_pcb';b=k.LoadBoard(str(fn));original=fn.read_text()
step=.1;NX,NY=241,271
nets={n.GetNetname():n.GetNetCode() for n in b.GetNetsByNetcode().values()}
def xy(p):return (k.ToMM(p.x),k.ToMM(p.y))
def pt(p):return k.VECTOR2I(k.FromMM(p[0]),k.FromMM(p[1]))
def tr(a,z,layer,net):
 if a==z:return
 t=k.PCB_TRACK(b);t.SetStart(pt(a));t.SetEnd(pt(z));t.SetWidth(k.FromMM(.1));t.SetLayer(layer);t.SetNetCode(nets[net]);b.Add(t)
extra_jobs=[]
for name in ['/STATUS_LED','/MIC_THSEL']:
 vv=[xy(t.GetPosition()) for t in b.GetTracks() if isinstance(t,k.PCB_VIA) and t.GetNetname()==name]
 print(name,vv,flush=True)
 assert len(vv)==2
 extra_jobs.append((name,vv[0],vv[1],[k.In4_Cu,k.In1_Cu,k.In2_Cu,k.In3_Cu]))
for t in list(b.GetTracks()):
 if t.GetNetname() in ['/PDM_CLK','/BOOT0','/STATUS_LED','/MIC_THSEL'] and not isinstance(t,k.PCB_VIA) and t.GetLayer() not in [k.F_Cu,k.B_Cu]:b.Delete(t)
for p in [(10.155,8.2397),(13.175,13.575)]:
 v=k.PCB_VIA(b);v.SetPosition(pt(p));v.SetWidth(k.FromMM(.35));v.SetDrill(k.FromMM(.15));v.SetViaType(k.VIATYPE_THROUGH);v.SetLayerPair(k.F_Cu,k.B_Cu);v.SetNetCode(nets['/PDM_DATA']);b.Add(v)
tr((10.155,8.9675),(10.155,8.2397),k.F_Cu,'/PDM_DATA');tr((13.175,13.575),(13.725,13.575),k.F_Cu,'/PDM_DATA')
def path(a,z,layer,net):
 blocked=set()
 def capsule(a,z,r):
  ax,ay=a;zx,zy=z;dx=zx-ax;dy=zy-ay;den=dx*dx+dy*dy
  for ix in range(max(0,int((min(ax,zx)-r)/step)),min(NX,int((max(ax,zx)+r)/step)+2)):
   for iy in range(max(0,int((min(ay,zy)-r)/step)),min(NY,int((max(ay,zy)+r)/step)+2)):
    x=ix*step;y=iy*step;t=max(0,min(1,((x-ax)*dx+(y-ay)*dy)/den)) if den else 0
    if (x-ax-t*dx)**2+(y-ay-t*dy)**2<=r*r:blocked.add((ix,iy))
 for t in b.GetTracks():
  if t.GetNetname()==net:continue
  if isinstance(t,k.PCB_VIA):capsule(xy(t.GetPosition()),xy(t.GetPosition()),k.ToMM(t.GetWidth(k.F_Cu))/2+.17)
  elif t.GetLayer()==layer:capsule(xy(t.GetStart()),xy(t.GetEnd()),k.ToMM(t.GetWidth())/2+.17)
 for f in b.GetFootprints():
  for p in f.Pads():
   if p.GetNetname()==net:continue
   if p.GetDrillSize().x>0:
    q=p.GetBoundingBox();x=k.ToMM(q.GetX());y=k.ToMM(q.GetY());w=k.ToMM(q.GetWidth());h=k.ToMM(q.GetHeight())
    if p.GetAttribute()==k.PAD_ATTRIB_NPTH:rad=k.ToMM(p.GetDrillSize().x)/2+.27;capsule(xy(p.GetPosition()),xy(p.GetPosition()),rad)
    else:
     for ix in range(max(0,int((x-.2)/step)),min(NX,int((x+w+.2)/step)+2)):
      for iy in range(max(0,int((y-.2)/step)),min(NY,int((y+h+.2)/step)+2)):blocked.add((ix,iy))
 start=tuple(round(v/step) for v in a);end=tuple(round(v/step) for v in z)
 if start in blocked or end in blocked:return None
 queue=[(0,0,start)];cost={start:0};prev={};dirs=[(i,j) for i in [-1,0,1] for j in [-1,0,1] if i or j]
 while queue:
  _,g,u=heapq.heappop(queue)
  if g>cost[u]+1e-8:continue
  if u==end:
   points=[u]
   while u in prev:u=prev[u];points.append(u)
   points.reverse();simple=[points[0]]
   for i in range(1,len(points)-1):
    if (points[i][0]-points[i-1][0],points[i][1]-points[i-1][1])!=(points[i+1][0]-points[i][0],points[i+1][1]-points[i][1]):simple.append(points[i])
   simple.append(points[-1]);return [a]+[(x*step,y*step) for x,y in simple]+[z]
  for dx,dy in dirs:
   v=(u[0]+dx,u[1]+dy)
   if not(3<=v[0]<NX-3 and 3<=v[1]<NY-3) or v in blocked:continue
   if dx and dy and ((u[0]+dx,u[1]) in blocked or (u[0],u[1]+dy) in blocked):continue
   ng=g+math.hypot(dx,dy)
   if ng<cost.get(v,1e99):cost[v]=ng;prev[v]=u;heapq.heappush(queue,(ng+math.hypot(v[0]-end[0],v[1]-end[1]),ng,v))
 return None
for net,a,z,layers in [('/PDM_DATA',(10.155,8.2397),(13.175,13.575),[k.In2_Cu,k.In4_Cu,k.In1_Cu,k.In3_Cu]),('/BOOT0',(8.155,8.2463),(23.5192,18.4408),[k.In1_Cu,k.In4_Cu,k.In2_Cu,k.In3_Cu]),('/PDM_CLK',(13.5864,12.7886),(5.8424,19.3893),[k.In3_Cu,k.In4_Cu,k.In2_Cu,k.In1_Cu])]+extra_jobs:
 for layer in layers:
  points=path(a,z,layer,net)
  if points:
   for a,z in zip(points,points[1:]):tr(a,z,layer,net)
   print('Routed',net,layer,len(points),flush=True);break
 else:raise RuntimeError('No path '+net)
k.SaveBoard(str(fn),b);cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli';subprocess.run([cli,'pcb','drc',str(fn),'--format','json','--schematic-parity','-o',str(P/'drc.json')],stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL);x=json.loads((P/'drc.json').read_text());print('RESULT',len(x['violations']),len(x['unconnected_items']),flush=True)
(P/'route-last-attempt-drc.json').write_text(json.dumps(x,indent=2))
if x['violations'] or x['unconnected_items']:
 (P/'route-last-attempt.kicad_pcb').write_text(fn.read_text());fn.write_text(original);subprocess.run([cli,'pcb','drc',str(fn),'--format','json','--schematic-parity','-o',str(P/'drc.json')],stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
else:
 d=json.loads((P/'order-status.json').read_text());d.update(drc_violations=0,unconnected_items=0,schematic_parity=0,tracks_and_vias=len(list(b.GetTracks())),pcb_sha256=hashlib.sha256(fn.read_bytes()).hexdigest());d['blockers']=[s for s in d['blockers'] if not s.startswith('PDM_DATA')];(P/'order-status.json').write_text(json.dumps(d,indent=2)+'\n')
