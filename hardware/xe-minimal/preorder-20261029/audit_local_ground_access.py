from pathlib import Path
import pcbnew as k,wx,json,heapq,hashlib
app=wx.App(False);w=Path(__file__).resolve().parent;src=w/'c32-short-bypass-trial.kicad_pcb';b=k.LoadBoard(str(src));fps={f.GetReference():f for f in b.GetFootprints()};tracks=[t for t in b.GetTracks() if t.GetNetname()=='/GND'];vias=[t for t in tracks if isinstance(t,k.PCB_VIA)];planes={z.GetLayer():z.GetFilledPolysList(z.GetLayer()) for z in b.Zones() if z.GetNetname()=='/GND' and not z.GetIsRuleArea()};rows=[]
for ref,num in [('U13','2'),('C32','2'),('C31','2'),('U3','5'),('U3','11'),('C13','2'),('C14','2'),('C15','2')]:
 pad=next(p for p in fps[ref].Pads() if p.GetNumber()==num);layer=fps[ref].GetLayer();pnt=pad.GetPosition();adj={};nodes={}
 def node(q):return(q.x,q.y)
 def link(a,z,length):
  a,z=node(a),node(z);adj.setdefault(a,[]).append((z,length));adj.setdefault(z,[]).append((a,length));nodes[a]=k.VECTOR2I(*a);nodes[z]=k.VECTOR2I(*z)
 local=[t for t in tracks if not isinstance(t,k.PCB_VIA) and t.IsOnLayer(layer)]
 for t in local:link(t.GetStart(),t.GetEnd(),k.ToMM(t.GetLength()))
 for via in vias:nodes[node(via.GetPosition())]=via.GetPosition()
 nodes[node(pnt)]=pnt
 # Include endpoints/via centers lying on same-layer track copper, including midsegment joins.
 for n,q in list(nodes.items()):
  for t in local:
   if t.GetEffectiveShape(layer).Collide(q):
    for end in [t.GetStart(),t.GetEnd()]:link(q,end,k.ToMM((q-end).EuclideanNorm()))
 for f in fps.values():
  for p in f.Pads():
   if p.GetNetname()!='/GND' or not p.IsOnLayer(layer):continue
   hit=[q for q in list(nodes.values()) if p.GetEffectiveShape(layer).Collide(q)]
   for q in hit:link(p.GetPosition(),q,0)
 targets={node(v.GetPosition()):v for v in vias if all(planes[l].Contains(v.GetPosition()) for l in [k.In1_Cu,k.In2_Cu])}
 start=node(pnt);dist={start:0};heap=[(0,start)];found=None
 while heap:
  d,n=heapq.heappop(heap)
  if d!=dist[n]:continue
  if n in targets:found=(n,d);break
  for z,c in adj.get(n,[]):
   nd=d+c
   if nd<dist.get(z,1e99):dist[z]=nd;heapq.heappush(heap,(nd,z))
 nearest=min(targets,key=lambda n:(n[0]-pnt.x)**2+(n[1]-pnt.y)**2)
 rows.append({'ref':ref,'pin':num,'side':b.GetLayerName(layer),'pad_mm':[k.ToMM(pnt.x),k.ToMM(pnt.y)],'nearest_both_plane_via_mm':[k.ToMM(x) for x in nearest],'nearest_euclidean_mm':k.ToMM((nodes[nearest]-pnt).EuclideanNorm()),'outer_track_path_to_plane_via_mm':found[1] if found else None,'path_target_via_mm':[k.ToMM(x) for x in found[0]] if found else None})
out={'source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'status':'GROUND_ACCESS_GEOMETRY_SCREEN_NOT_LOOP_QUALIFICATION','rows':rows,'limitations':['Filled-plane containment at via centers does not prove low inductance or plane path width','Track copper joins represented by point-to-end distances; zero length within pads','Ground plane path between access vias excluded','Manufacturing/thermal/transient qualification absent'],'release_allowed':False};(w/'local-ground-access.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2),flush=True)
