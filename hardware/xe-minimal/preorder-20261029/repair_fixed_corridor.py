from pathlib import Path
import pcbnew as k,wx,json,math,heapq,collections,shutil,hashlib
app=wx.App(False);w=Path(__file__).resolve().parent;src=w/'fixed-critical-corridor-routed.kicad_pcb';b=k.LoadBoard(str(src));d=json.loads((w/'fixed-critical-corridor-drc.json').read_text());xy=lambda p:[k.ToMM(p.x),k.ToMM(p.y)];tasks=[]
for row in d['unconnected_items']:
 items=row['items'];net=items[0]['description'].split('[')[1].split(']')[0];layers=[k.F_Cu,k.B_Cu,k.In2_Cu] if all('ビア' in i['description'] for i in items) else [k.F_Cu]
 tasks.append((net,[[i['pos']['x'],i['pos']['y']] for i in items],layers))
for t in list(b.GetTracks()):
 if str(t.m_Uuid.AsString())=='fbef8b78-159d-452d-a8ab-18d1f540678e':
  tasks.append(('/BAT_TS',[xy(t.GetStart()),xy(t.GetEnd())],[k.F_Cu,k.B_Cu,k.In2_Cu]));b.RemoveNative(t)
report=[]
for net,(start,end),layers in tasks:
 width=.15 if net=='/BAT' else .127;row={'net':net,'start':start,'end':end,'attempts':[]};solution=None
 for layer in layers:
  bins=collections.defaultdict(list);obs=[];margin=width/2+.101
  def add(shape,bb):
   ix=len(obs);obs.append(shape)
   for x in range(math.floor(k.ToMM(bb.GetLeft())-margin),math.floor(k.ToMM(bb.GetRight())+margin)+1):
    for y in range(math.floor(k.ToMM(bb.GetTop())-margin),math.floor(k.ToMM(bb.GetBottom())+margin)+1):bins[x,y].append(ix)
  for t in b.GetTracks():
   if t.IsOnLayer(layer) and t.GetNetname()!=net:add(t.GetEffectiveShape(layer),t.GetBoundingBox())
  for f in b.GetFootprints():
   for p in f.Pads():
    if p.IsOnLayer(layer) and p.GetNetname()!=net:add(p.GetEffectiveShape(layer),p.GetBoundingBox())
  rules=[z.Outline() for z in b.Zones() if z.GetIsRuleArea() and z.IsOnLayer(layer) and z.GetDoNotAllowTracks()]
  def point(v):return k.VECTOR2I(k.FromMM(start[0]+v[0]*.05),k.FromMM(start[1]+v[1]*.05))
  target=k.VECTOR2I(k.FromMM(end[0]),k.FromMM(end[1]));rad=k.FromMM(margin)
  def clear(a,c):
   seg=k.SEG(a,c);ids=set()
   for x in range(math.floor(min(k.ToMM(a.x),k.ToMM(c.x))),math.floor(max(k.ToMM(a.x),k.ToMM(c.x)))+1):
    for y in range(math.floor(min(k.ToMM(a.y),k.ToMM(c.y))),math.floor(max(k.ToMM(a.y),k.ToMM(c.y)))+1):ids.update(bins[x,y])
   if any(obs[i].Collide(seg,rad) for i in ids):return False
   if any(r.Collide(seg,k.FromMM(width/2+.001)) for r in rules):return False
   return True
  def h(v):p=point(v);return math.hypot(k.ToMM(p.x)-end[0],k.ToMM(p.y)-end[1])
  queue=[(h((0,0)),0.,(0,0))];cost={(0,0):0.};parents={};vis=0;path=None
  while queue:
   _,distance,node=heapq.heappop(queue)
   if distance!=cost[node]:continue
   vis+=1;pt=point(node)
   if h(node)<.08 and clear(pt,target):
    nodes=[node]
    while nodes[-1]!=(0,0):nodes.append(parents[nodes[-1]])
    path=[xy(point(v)) for v in reversed(nodes)]+[end];break
   for dx,dy in [(1,0),(-1,0),(0,1),(0,-1),(1,1),(1,-1),(-1,1),(-1,-1)]:
    nxt=(node[0]+dx,node[1]+dy);nd=distance+math.hypot(dx,dy)*.05
    if nd>=cost.get(nxt,float('inf')):continue
    q=point(nxt)
    if not(k.FromMM(.4)<q.x<k.FromMM(27.1) and k.FromMM(-.1)<q.y<k.FromMM(26.6)):continue
    if not clear(pt,q):continue
    cost[nxt]=nd;parents[nxt]=node;heapq.heappush(queue,(nd+h(nxt),nd,nxt))
  row['attempts'].append({'layer':b.GetLayerName(layer),'visited':vis,'found':path is not None});print(net,b.GetLayerName(layer),vis,path is not None,flush=True)
  if path:
   # Preserve only direction changes; final exact endpoint retained.
   keep=[path[0]]
   for i in range(1,len(path)-1):
    a,c,e=path[i-1:i+2]
    if abs((c[0]-a[0])*(e[1]-c[1])-(c[1]-a[1])*(e[0]-c[0]))>1e-9:keep.append(c)
   keep.append(path[-1]);length=0
   for a,c in zip(keep,keep[1:]):
    if a==c:continue
    t=k.PCB_TRACK(b);t.SetStart(k.VECTOR2I(k.FromMM(a[0]),k.FromMM(a[1])));t.SetEnd(k.VECTOR2I(k.FromMM(c[0]),k.FromMM(c[1])));t.SetLayer(layer);t.SetWidth(k.FromMM(width));t.SetNetCode(b.FindNet(net).GetNetCode());b.AddNative(t);t.thisown=False;length+=math.dist(a,c)
   row['route']={'layer':b.GetLayerName(layer),'length_mm':length,'path':keep};solution=path;break
 report.append(row)
 out=w/'fixed-corridor-manual.kicad_pcb';k.SaveBoard(str(out),b)
 (w/'fixed-corridor-manual-routing.json').write_text(json.dumps({'source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'routes':report,'release_allowed':False},indent=2)+'\n')
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copy2(src.with_suffix(ext),out.with_suffix(ext))
