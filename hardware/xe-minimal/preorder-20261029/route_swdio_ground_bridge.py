from pathlib import Path
import pcbnew as k,wx,json,math,heapq,collections,shutil,hashlib,time
app=wx.App(False);w=Path(__file__).resolve().parent;src=w/'usb-ground-bridge-open.kicad_pcb';b=k.LoadBoard(str(src));d=json.loads((w/'usb-island-local-open-drc.json').read_text());xy=lambda p:[k.ToMM(p.x),k.ToMM(p.y)];layers=[k.F_Cu,k.B_Cu,k.In2_Cu];critical=set(json.loads((w/'pdm-tp6-preparation.json').read_text())['critical_nets_outer_only'])|{'/USB_DP','/USB_DM'};report=[]
for item in d['unconnected_items']:
 start,end=[[v['pos']['x'],v['pos']['y']] for v in item['items']];net=item['items'][0]['description'].split('[')[1].split(']')[0];width=.15 if net=='/BAT' else .127;startlayers=layers if 'ビア' in item['items'][0]['description'] else [k.B_Cu if 'B.Cu' in item['items'][0]['description'] else k.F_Cu];endlayers=layers if 'ビア' in item['items'][1]['description'] else [k.B_Cu if 'B.Cu' in item['items'][1]['description'] else k.F_Cu]
 if net=='/VBUS_CHARGER':start=[8.8595,4.3486];startlayers=layers # Existing via connected by the verified F.Cu branch.
 start=[9.2276,1.4586];end=[21.1103,9.3077];startlayers=layers;endlayers=layers # Existing vias at the ends of the removed L3 connected component.
 obs={};bins={};rules={};viapads=[];viaobs=[];protected=[]
 existingvias=[t for t in b.GetTracks() if isinstance(t,k.PCB_VIA)]
 for layer in layers:
  obs[layer]=[];bins[layer]=collections.defaultdict(list)
  def add(shape,bb):
   ix=len(obs[layer]);obs[layer].append(shape);m=width/2+.101
   for x in range(math.floor(k.ToMM(bb.GetLeft())-m),math.floor(k.ToMM(bb.GetRight())+m)+1):
    for y in range(math.floor(k.ToMM(bb.GetTop())-m),math.floor(k.ToMM(bb.GetBottom())+m)+1):bins[layer][x,y].append(ix)
  for t in b.GetTracks():
   if t.IsOnLayer(layer) and t.GetNetname()!=net:add(t.GetEffectiveShape(layer),t.GetBoundingBox())
  for f in b.GetFootprints():
   for p in f.Pads():
    if p.IsOnLayer(layer) and p.GetNetname()!=net:add(p.GetEffectiveShape(layer),p.GetBoundingBox())
  rules[layer]=[z.Outline() for z in b.Zones() if z.GetIsRuleArea() and z.IsOnLayer(layer) and z.GetDoNotAllowTracks()]
 for t in b.GetTracks():
  if t.GetNetname()!=net:
   for l in [k.F_Cu,k.In1_Cu,k.In2_Cu,k.B_Cu]:
    if t.IsOnLayer(l):viaobs.append(t.GetEffectiveShape(l))
  if not isinstance(t,k.PCB_VIA) and t.GetNetname() in critical:protected.append(t.GetEffectiveShape(t.GetLayer()))
 for f in b.GetFootprints():
  for p in f.Pads():
   for l in [k.F_Cu,k.B_Cu]:
    if p.IsOnLayer(l):
     viapads.append((p.GetEffectiveShape(l),.101 if p.GetNetname()==net else .301))
     if p.GetNetname()!=net:viaobs.append(p.GetEffectiveShape(l))
 def point(n):return k.VECTOR2I(k.FromMM(start[0]+n[0]*.05),k.FromMM(start[1]+n[1]*.05))
 def clear(a,c,l):
  ids=set();seg=k.SEG(a,c)
  for x in range(math.floor(min(k.ToMM(a.x),k.ToMM(c.x))),math.floor(max(k.ToMM(a.x),k.ToMM(c.x)))+1):
   for y in range(math.floor(min(k.ToMM(a.y),k.ToMM(c.y))),math.floor(max(k.ToMM(a.y),k.ToMM(c.y)))+1):ids.update(bins[l][x,y])
  return not any(obs[l][i].Collide(seg,k.FromMM(width/2+.101)) for i in ids) and not any(r.Collide(seg,k.FromMM(width/2+.001)) for r in rules[l])
 vc={}
 def via_ok(n):
  key=n[:2]
  if key in vc:return vc[key]
  p=point(n);good=not any((p-v.GetPosition()).EuclideanNorm()<k.FromMM(.1+.251)+v.GetDrillValue()/2 for v in existingvias) and not any(s.Collide(p,k.FromMM(.326)) for s in viaobs) and not any(s.Collide(p,k.FromMM(r)) for s,r in viapads) and not any(s.Collide(p,k.FromMM(.426)) for s in protected)
  vc[key]=good;return good
 def h(n):p=point(n);return math.hypot(k.ToMM(p.x)-end[0],k.ToMM(p.y)-end[1])
 target=k.VECTOR2I(k.FromMM(end[0]),k.FromMM(end[1]));queue=[];cost={};parent={};rootset=set()
 for l in startlayers:
  n=(0,0,l);cost[n]=0;rootset.add(n);heapq.heappush(queue,(h(n),0.,n))
 vis=0;answer=None;began=time.time()
 while queue and vis<400000:
  _,distance,node=heapq.heappop(queue)
  if distance!=cost[node]:continue
  vis+=1;p=point(node);l=node[2]
  if vis%50000==0:print(net,'nodes',vis,'seconds',round(time.time()-began),flush=True)
  if l in endlayers and h(node)<.08 and clear(p,target,l):
   answer=[node]
   while answer[-1] not in rootset:answer.append(parent[answer[-1]])
   answer.reverse();break
  choices=[]
  for dx,dy in [(1,0),(-1,0),(0,1),(0,-1),(1,1),(1,-1),(-1,1),(-1,-1)]:
   q=(node[0]+dx,node[1]+dy,l);nd=distance+math.hypot(dx,dy)*.05
   if nd>=cost.get(q,float('inf')):continue
   pt=point(q)
   if not(k.FromMM(.5)<pt.x<k.FromMM(27) and k.FromMM(0)<pt.y<k.FromMM(26.5)):continue
   if clear(p,pt,l):choices.append((q,nd))
  if node[0]%4==0 and node[1]%4==0 and via_ok(node):
   for nl in layers:
    q=(node[0],node[1],nl);nd=distance+4
    if nl!=l and nd<cost.get(q,float('inf')) and clear(p,p,nl):choices.append((q,nd))
  for q,nd in choices:cost[q]=nd;parent[q]=node;heapq.heappush(queue,(nd+h(q),nd,q))
 row={'net':net,'visited':vis,'seconds':time.time()-began,'found':answer is not None,'termination':'found' if answer else 'node_limit' if queue else 'exhausted','new_vias':0}
 if answer:
  for a,c in zip(answer,answer[1:]):
   if a[2]!=c[2]:
    v=k.PCB_VIA(b);v.SetPosition(point(a));v.SetWidth(k.FromMM(.45));v.SetDrill(k.FromMM(.2));v.SetViaType(k.VIATYPE_THROUGH);v.SetLayerPair(k.F_Cu,k.B_Cu);v.SetNetCode(b.FindNet(net).GetNetCode());b.AddNative(v);v.thisown=False;row['new_vias']+=1
   else:
    t=k.PCB_TRACK(b);t.SetStart(point(a));t.SetEnd(point(c));t.SetLayer(a[2]);t.SetWidth(k.FromMM(width));t.SetNetCode(b.FindNet(net).GetNetCode());b.AddNative(t);t.thisown=False
  if point(answer[-1])!=target:
   t=k.PCB_TRACK(b);t.SetStart(point(answer[-1]));t.SetEnd(target);t.SetLayer(answer[-1][2]);t.SetWidth(k.FromMM(width));t.SetNetCode(b.FindNet(net).GetNetCode());b.AddNative(t);t.thisown=False
  row['path']=[[*xy(point(n)),b.GetLayerName(n[2])] for n in answer]
 report.append(row);print({k:v for k,v in row.items() if k!='path'},flush=True)
 out=w/'swdio-ground-bridge-repair.kicad_pcb';k.SaveBoard(str(out),b);(w/'swdio-ground-bridge-repair-routing.json').write_text(json.dumps({'source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'routes':report,'grid_mm':.05,'via_site_grid_mm':.2,'via_transition_cost_mm':4,'release_allowed':False},indent=2)+'\n')
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copy2(src.with_suffix(ext),out.with_suffix(ext))
