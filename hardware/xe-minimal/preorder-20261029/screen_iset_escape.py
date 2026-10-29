from pathlib import Path
import pcbnew as k,wx,math,json,collections
import os
excluded=set(filter(None,os.environ.get("ESCAPE_EXCLUDE", "").split(",")))
app=wx.App(False);w=Path(__file__).resolve().parent;b=k.LoadBoard(str(w/'pdm-tp6-routed.kicad_pcb'));result={}
for number in ['8']:
 p=next(p for f in b.GetFootprints() if f.GetReference()=='U3' for p in f.Pads() if p.GetNumber()==number);a=p.GetPosition();net=str(p.GetNetname());layers=[k.F_Cu,k.In1_Cu,k.In2_Cu,k.B_Cu];copper=[];back=[];pads=[]
 for t in b.GetTracks():
  if t.GetNetname()==net or str(t.GetNetname()) in excluded:continue
  for layer in layers:
   if t.IsOnLayer(layer):
    shape=t.GetEffectiveShape(layer);entry=(str(t.GetNetname()),shape)
    copper.append(entry)
    if layer==k.B_Cu:back.append(entry)
 for f in b.GetFootprints():
  for q in f.Pads():
   for layer in [k.F_Cu,k.B_Cu]:
    if not q.IsOnLayer(layer):continue
    shape=q.GetEffectiveShape(layer);pads.append((str(q.GetNetname()),shape))
    if q.GetNetname()!=net:
     copper.append((f.GetReference()+'.'+q.GetNumber(),shape))
     if layer==k.B_Cu:back.append((f.GetReference()+'.'+q.GetNumber(),shape))
 # Bounded 8-neighbour search permits bends; retains all existing copper.
 import heapq
 start=(0,0);cost={start:0.};parent={};queue=[(0.,start)];found=[];tested=0
 def point(node):return k.VECTOR2I(a.x+k.FromMM(node[0]*.05),a.y+k.FromMM(node[1]*.05))
 while queue:
  distance,node=heapq.heappop(queue)
  if distance!=cost[node]:continue
  pt=point(node);tested+=1
  if distance>=.35 and not any(s.Collide(pt,k.FromMM(.326)) for n,s in copper) and not any(s.Collide(pt,k.FromMM(.101 if n==net else .301)) for n,s in pads):
   path=[node]
   while path[-1]!=start:path.append(parent[path[-1]])
   path.reverse();found.append({'length_mm':distance,'path_mm':[[k.ToMM(point(v).x),k.ToMM(point(v).y)] for v in path]});break
  for dx,dy in [(1,0),(-1,0),(0,1),(0,-1),(1,1),(1,-1),(-1,1),(-1,-1)]:
   nxt=(node[0]+dx,node[1]+dy)
   if max(abs(nxt[0]),abs(nxt[1]))>60:continue
   nd=distance+math.hypot(dx,dy)*.05
   if nd>=cost.get(nxt,float('inf')):continue
   seg=k.SEG(pt,point(nxt))
   if any(s.Collide(seg,k.FromMM(.127/2+.101)) for n,s in back):continue
   cost[nxt]=nd;parent[nxt]=node;heapq.heappush(queue,(nd,nxt))
 result[net]={'pin':number,'visited':tested,'escapes':found,'excluded_track_nets':sorted(excluded),'scope':'3mm square radius, .05mm grid, .127 track, .45/.2 through via; pads remain fixed'}
 print(net,tested,len(found),flush=True)
(w/('iset-bent-escape-'+('-'.join(sorted(excluded)).replace('/','') or 'fixed')+'.json')).write_text(json.dumps(result,indent=2)+'\n')
