from pathlib import Path
import json,hashlib,heapq,math
import wx,pcbnew as k
app=wx.App(False);w=Path(__file__).resolve().parent;p=w/'l3-ground-011-trial.kicad_pcb';b=k.LoadBoard(str(p));fps={f.GetReference():f for f in b.GetFootprints()};layers=[k.F_Cu,k.In1_Cu,k.In2_Cu,k.B_Cu]
rows=[]
for ur,cr in [('U3','C13'),('U3','C14'),('U3','C15'),('U13','C31'),('U13','C32'),('U14','C33')]:
 if cr not in fps:continue
 for cp in fps[cr].Pads():
  net=cp.GetNetname()
  if net.lstrip('/')=='GND' or not net:continue
  for up in fps[ur].Pads():
   if up.GetNetname()!=net:continue
   adj={};edges={}
   def node(v,l):return(v.x,v.y,l)
   def link(a,c,length,width,via=False):
    adj.setdefault(a,[]).append((c,length));adj.setdefault(c,[]).append((a,length));edges[(a,c)]=edges[(c,a)]={'length_mm':length,'width_mm':width,'via':via}
   tracks=[t for t in b.GetTracks() if t.GetNetname()==net]
   for t in tracks:
    if isinstance(t,k.PCB_VIA):
     for l,z in zip(layers,layers[1:]):link(node(t.GetPosition(),l),node(t.GetPosition(),z),0,None,True)
    else:link(node(t.GetStart(),t.GetLayer()),node(t.GetEnd(),t.GetLayer()),k.ToMM(t.GetLength()),k.ToMM(t.GetWidth()))
   # Pad interior joins all trace endpoints touching its copper; zero distance inside pads.
   for fp in fps.values():
    for pad in fp.Pads():
     if pad.GetNetname()!=net:continue
     for l in layers:
      if not pad.IsOnLayer(l):continue
      shape=pad.GetEffectiveShape(l);touch=[n for n in list(adj) if n[2]==l and shape.Collide(k.VECTOR2I(n[0],n[1]))]
      center=node(pad.GetPosition(),l)
      for n in touch:link(center,n,0,None)
   starts=[node(up.GetPosition(),l) for l in layers if up.IsOnLayer(l)];ends={node(cp.GetPosition(),l) for l in layers if cp.IsOnLayer(l)};dist={s:0 for s in starts};q=[(0,s) for s in starts];heapq.heapify(q);prev={};goal=None
   while q:
    d,n=heapq.heappop(q)
    if d!=dist[n]:continue
    if n in ends:goal=n;break
    for z,c in adj.get(n,[]):
     nd=d+c
     if nd<dist.get(z,1e99):dist[z]=nd;prev[z]=n;heapq.heappush(q,(nd,z))
   path=[]
   if goal:
    n=goal
    while n in prev:path.append(edges[(prev[n],n)]);n=prev[n]
   widths=[e['width_mm'] for e in path if e['width_mm'] is not None]
   rows.append({'ic':ur,'pin':up.GetNumber(),'capacitor':cr,'cap_pin':cp.GetNumber(),'net':net,'pad_center_distance_mm':k.ToMM((up.GetPosition()-cp.GetPosition()).EuclideanNorm()),'graph_track_length_mm':dist[goal] if goal else None,'minimum_track_width_mm':min(widths) if widths else None,'layer_transition_edges':sum(e['via'] for e in path),'graph_path_found':goal is not None})
out={'pcb_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'status':'LOCAL_POWER_TRACE_SCREEN_NOT_LOOP_QUALIFICATION','connections':rows,'limitations':['No ground return path or loop area measurement','Exact endpoint graph includes pad-interior joins; midsegment intersections and filled zones omitted','Via vertical length and in-pad lengths omitted; not a resistance or voltage-drop model','No path means graph incomplete or connection absent; compare full DRC before concluding','No datasheet-layout compliance or physical startup/thermal qualification claimed'],'release_allowed':False}
(w/'local-power-path-audit.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2))
