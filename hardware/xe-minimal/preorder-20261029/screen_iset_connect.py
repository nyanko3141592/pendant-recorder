from pathlib import Path
import pcbnew as k,wx,math,json,collections
import os
excluded=set(filter(None,os.environ.get("ESCAPE_EXCLUDE", "").split(",")))
app=wx.App(False);w=Path(__file__).resolve().parent;b=k.LoadBoard(str(w/'pdm-tp6-routed.kicad_pcb'));result={}
for layer in [k.F_Cu,k.In2_Cu]:
 b=k.LoadBoard(str(w/'iset-ilim-routed.kicad_pcb'));a=k.VECTOR2I(k.FromMM(22.335),k.FromMM(14.785));net='/ISET';back=[];targets=[]
 for t in b.GetTracks():
  if not t.IsOnLayer(layer):continue
  if t.GetNetname()==net:
   if isinstance(t,k.PCB_VIA) and (t.GetPosition()-a).EuclideanNorm()<k.FromMM(.01):continue
   targets.append(t.GetEffectiveShape(layer))
  else:back.append((str(t.GetNetname()),t.GetEffectiveShape(layer)))
 for f in b.GetFootprints():
  for q in f.Pads():
   if q.IsOnLayer(layer):
    if q.GetNetname()==net:targets.append(q.GetEffectiveShape(layer))
    else:back.append((f.GetReference()+'.'+q.GetNumber(),q.GetEffectiveShape(layer)))
 import heapq
 start=(0,0);cost={start:0.};parent={};queue=[(0.,start)];found=[];tested=0
 def point(node):return k.VECTOR2I(a.x+k.FromMM(node[0]*.05),a.y+k.FromMM(node[1]*.05))
 while queue:
  distance,node=heapq.heappop(queue)
  if distance!=cost[node]:continue
  pt=point(node);tested+=1
  if any(shape.Collide(pt,0) for shape in targets):
   path=[node]
   while path[-1]!=start:path.append(parent[path[-1]])
   path.reverse();found.append({'length_mm':distance,'path_mm':[[k.ToMM(point(v).x),k.ToMM(point(v).y)] for v in path]});break
  for dx,dy in [(1,0),(-1,0),(0,1),(0,-1),(1,1),(1,-1),(-1,1),(-1,-1)]:
   nxt=(node[0]+dx,node[1]+dy)
   if max(abs(nxt[0]),abs(nxt[1]))>80:continue
   nd=distance+math.hypot(dx,dy)*.05
   if nd>=cost.get(nxt,float('inf')):continue
   if any(shape.Collide(k.SEG(pt,point(nxt)),k.FromMM(.1645)) for n,shape in back):continue
   cost[nxt]=nd;parent[nxt]=node;heapq.heappush(queue,(nd,nxt))
 result[b.GetLayerName(layer)]={'visited':tested,'paths':found}
 print(b.GetLayerName(layer),tested,len(found),flush=True)
(w/'iset-connect-screen.json').write_text(json.dumps(result,indent=2)+'\n')
