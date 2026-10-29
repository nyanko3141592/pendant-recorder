"""Copper-only shortest path extraction, no silicon-internal shortcut assumption."""
from pathlib import Path
import wx,json,math,heapq,sys,hashlib
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;src=Path(sys.argv[1]).resolve() if len(sys.argv)>1 else P/'usb-surface-planes.kicad_pcb';b=k.LoadBoard(str(src));rows=[]
def xy(p):return (p.x,p.y)
for name,startref,startpin,endref,endpin in [('/BAT','J2','1','U3','2'),('/SYS','U3','1','U4','1'),('/V3V3','U4','5','U10','A2'),('/SD_V3','U10','A1','J4','4'),('/VBUS','J1','A4','U3','10'),('/V3V3','U4','5','U1','24')]:
 ts=[t for t in b.GetTracks() if t.GetNetname()==name];pads=[(f.GetReference(),p) for f in b.GetFootprints() for p in f.Pads() if p.GetNetname()==name];nodes=set();g={}
 def edge(a,c,w,kind):
  g.setdefault(a,[]).append((c,w,kind));g.setdefault(c,[]).append((a,w,kind))
 for t in ts:
  if isinstance(t,k.PCB_VIA):
   for layer in [k.F_Cu,k.In1_Cu,k.In2_Cu,k.B_Cu]:nodes.add((*xy(t.GetPosition()),layer))
  else:
   nodes.add((*xy(t.GetStart()),t.GetLayer()));nodes.add((*xy(t.GetEnd()),t.GetLayer()))
 for t in ts:
  if isinstance(t,k.PCB_VIA):
   nn=[(*xy(t.GetPosition()),l) for l in [k.F_Cu,k.In1_Cu,k.In2_Cu,k.B_Cu]]
   for i,a in enumerate(nn):
    for c in nn[i+1:]:edge(a,c,.000001,'via')
  else:
   a,c=xy(t.GetStart()),xy(t.GetEnd());dx,dy=c[0]-a[0],c[1]-a[1];den=dx*dx+dy*dy
   if den==0:continue
   hits=[]
   for q in nodes:
    if q[2]!=t.GetLayer():continue
    u=((q[0]-a[0])*dx+(q[1]-a[1])*dy)/den
    if -.000001<=u<=1.000001 and math.hypot(q[0]-a[0]-u*dx,q[1]-a[1]-u*dy)<10:hits.append((u,q))
   hits.sort()
   for (_,q),(_,r) in zip(hits,hits[1:]):edge(q,r,math.hypot(q[0]-r[0],q[1]-r[1])/1e6,b.GetLayerName(t.GetLayer())+':'+str(k.ToMM(t.GetWidth())))
 for ref,pad in pads:
  key=(ref,pad.GetNumber())
  for q in nodes:
   if pad.IsOnLayer(q[2]) and pad.HitTest(k.VECTOR2I(q[0],q[1])):edge(key,q,0,'pad')
 start=(startref,startpin);end=(endref,endpin);dist={start:0};prev={};queue=[(0,0,start)];serial=0
 while queue:
  cost,_,u=heapq.heappop(queue)
  if cost>dist[u]:continue
  if u==end:break
  for v,w,kind in g.get(u,[]):
   nc=cost+w
   if nc<dist.get(v,float('inf')):
    dist[v]=nc;prev[v]=(u,w,kind);serial+=1;heapq.heappush(queue,(nc,serial,v))
 if end not in dist:rows.append(dict(net=name,status='NO_GRAPH_PATH'));continue
 u=end;path=[]
 while u!=start:
  v,w,kind=prev[u];path.append(dict(start=v,end=u,length_mm=w,kind=kind));u=v
 path.reverse();layers={};vias=[]
 for e in path:
  if e['kind']=='via':vias.append([e['start'][0]/1e6,e['start'][1]/1e6])
  elif e['kind']!='pad':layers[e['kind']]=layers.get(e['kind'],0)+e['length_mm']
 resistance=sum(length*.01724/(float(key.split(':')[1])*(.035 if key.split(':')[0] in ['F.Cu','B.Cu'] else .0152))/1000 for key,length in layers.items())
 rows.append(dict(source=start,target=end,copper_resistance_ohm=round(resistance,5),drop_mv_at_hypothetical_current={str(ma):round(resistance*ma,3) for ma in [10,50,200]},net=name,status='COPPER_PATH_FOUND',track_length_mm=round(sum(layers.values()),3),via_transitions=len(vias),via_xy_mm=vias,layers_mm={x:round(y,3) for x,y in layers.items()},path=path))
r=dict(source_sha256=hashlib.sha256(src.read_bytes()).hexdigest(),rows=rows,limitations=['Shortest copper-length graph path; resistivity0.01724ohm mm2/m at20C, outer35um inner15.2um assumed from JLC option, not selected stackup','Pad copper treated equipotential; internal protection-diode connections not modeled','Vias, solder, connectors, silicon, return path and temperature rise excluded; not full power integrity or battery current qualification'])
src.with_suffix('.power-paths.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps([{k:v for k,v in x.items() if k!='path'} for x in rows],indent=2))
