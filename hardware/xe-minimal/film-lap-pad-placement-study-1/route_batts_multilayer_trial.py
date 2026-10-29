"""Two-via local BAT_TS bypass candidate; full DRC decides geometric acceptance."""
from pathlib import Path
import wx,pcbnew as k,json,math,shutil,subprocess,hashlib,argparse
parser=argparse.ArgumentParser();parser.add_argument("--existing-via",action="store_true");parser.add_argument("--radius",type=float,default=1.2);parser.add_argument("--grid-step",type=float,default=.1);args=parser.parse_args()
app=wx.App(False);O=Path(__file__).resolve().parent;src=O/'pendant-xe-film-lap-r13-0201-trial.kicad_pcb';b=k.LoadBoard(str(src));net=b.FindNet('/BAT_TS')
if args.existing_via:
 for t in list(b.GetTracks()):
  if not isinstance(t,k.PCB_VIA) and t.GetNetname()=='/BAT_TS' and t.GetLayer()==k.B_Cu and max(k.ToMM(t.GetStart().y),k.ToMM(t.GetEnd().y))<4.4:b.RemoveNative(t);t.thisown=False
layers=[k.F_Cu,k.In1_Cu,k.In2_Cu,k.In3_Cu,k.In4_Cu,k.B_Cu];obs={l:[]for l in layers};pads=[]
for f in b.GetFootprints():
 for q in f.Pads():
  for l in layers:
   if q.IsOnLayer(l):
    shape=q.GetEffectiveShape(l);pads.append((l,shape))
    if q.GetNetname()!='/BAT_TS':obs[l].append(shape)
for t in b.GetTracks():
 if t.GetNetname()=='/BAT_TS':continue
 for l in layers:
  if t.IsOnLayer(l):obs[l].append(t.GetEffectiveShape(l))
def vec(p):return k.VECTOR2I(*(k.FromMM(x)for x in p))
def track(a,c,l):
 t=k.PCB_TRACK(b);t.SetStart(vec(a));t.SetEnd(vec(c));t.SetLayer(l);t.SetWidth(k.FromMM(.15));t.SetNet(net);return t
def clear(t,l):return not any(t.GetEffectiveShape(l).Collide(s,k.FromMM(.105))for s in obs[l])
def via(p):
 v=k.PCB_VIA(b);v.SetPosition(vec(p));v.SetWidth(k.FromMM(.35));v.SetDrill(k.FromMM(.15));v.SetViaType(k.VIATYPE_THROUGH);v.SetLayerPair(k.F_Cu,k.B_Cu);v.SetNet(net);return v
assert args.existing_via
import heapq, functools, collections
route_layers=[k.F_Cu,k.In2_Cu,k.In4_Cu,k.B_Cu]
a=(12.75,1.5);target=(21.3,1.9);step=.1
fast=[t.GetEffectiveShape(t.GetLayer())for t in b.GetTracks()if not isinstance(t,k.PCB_VIA)and t.GetLayer()in[k.F_Cu,k.In2_Cu]and(t.GetNetname().startswith('/PDM_')or t.GetNetname().startswith('/SD_')or t.GetNetname()in['/USB_DP','/USB_DM'])]
holes=[(k.ToMM(t.GetPosition().x),k.ToMM(t.GetPosition().y),.275+k.ToMM(t.GetDrill())/2)for t in b.GetTracks()if isinstance(t,k.PCB_VIA)]
def xy(q):return(round(q[0]*step,6),round(q[1]*step,6))
@functools.lru_cache(None)
def edge(q,n):return clear(track(xy(q),xy(n),route_layers[q[2]]),route_layers[q[2]])
@functools.lru_cache(None)
def can_via(x,y):
 pos=(round(x*step,6),round(y*step,6));v=via(pos)
 if any(math.dist(pos,(hx,hy))<r for hx,hy,r in holes):return False
 if any(not clear(v,l)for l in layers):return False
 if any(v.GetEffectiveShape(k.In1_Cu).Collide(s,k.FromMM(.2))for s in fast):return False
 return True
cost={};prev={};queue=[];closed=set();end=None;transitions=set()
for li,l in enumerate(route_layers):
 for x in range(125,131):
  for y in range(13,18):
   q=(x,y,li)
   if clear(track(a,xy(q),l),l):cost[q]=math.dist(a,xy(q));prev[q]=None;heapq.heappush(queue,(cost[q]+math.dist(xy(q),target),q))
while queue:
 _,q=heapq.heappop(queue)
 if q in closed:continue
 closed.add(q)
 if len(closed)%1000==0:print('visited',len(closed),'via sites',len(transitions),flush=True)
 if math.dist(xy(q),target)<.5 and clear(track(xy(q),target,route_layers[q[2]]),route_layers[q[2]]):end=q;break
 neighbors=[]
 for dx,dy in [(1,0),(-1,0),(0,1),(0,-1),(1,1),(1,-1),(-1,1),(-1,-1)]:
  n=(q[0]+dx,q[1]+dy,q[2])
  if 4<=n[0]<=236 and 4<=n[1]<=266 and n not in closed and edge(q,n):neighbors.append((n,step*math.hypot(dx,dy)))
 if can_via(q[0],q[1]):
  transitions.add(q[:2]);neighbors += [((q[0],q[1],li),3.)for li in range(len(route_layers))if li!=q[2]]
 for n,delta in neighbors:
  nc=cost[q]+delta
  if nc<cost.get(n,1e99):cost[n]=nc;prev[n]=q;heapq.heappush(queue,(nc+math.dist(xy(n),target),n))
r={'status':'MULTILAYER_SEARCH_NO_ROUTE','source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'start_mm':a,'target_mm':target,'visited':len(closed),'transition_sites_count':len(transitions),'transition_sites_mm':[[x*step,y*step]for x,y in sorted(transitions)],'bounds_mm':[.4,23.6,.4,26.6],'step_mm':step,'limits':['Grid routing with through vias only; no blind vias or existing-track reroutes.','Fast-signal projection screen is not SI acceptance.','Film sensor and R13 substitutions remain unadopted.','No schematic parity, physical assembly or runtime qualification.']}
if end is not None:
 states=[];q=end
 while q is not None:states.append(q);q=prev[q]
 states.reverse();groups=[];current=[a];li=states[0][2];via_points=[a]
 for q in states:
  if q[2]!=li:groups.append((li,current));via_points.append(xy(q));current=[xy(q)];li=q[2]
  elif xy(q)!=current[-1]:current.append(xy(q))
 current.append(target);groups.append((li,current));routes=[];items=[]
 for li,path in groups:
  simple=[path[0]];i=0;l=route_layers[li]
  while i<len(path)-1:
   j=len(path)-1
   while j>i+1 and not clear(track(path[i],path[j],l),l):j-=1
   if math.dist(simple[-1],path[j])>1e-8:simple.append(path[j])
   i=j
  routes.append({'layer':b.GetLayerName(l),'path_mm':simple});items += [track(s,e,l)for s,e in zip(simple,simple[1:])]
 items += [via(p)for p in via_points]
 for t in items:b.AddNative(t);t.thisown=False
 out=O/'pendant-xe-film-lap-multilayer-trial.kicad_pcb'
 for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),out.with_suffix(ext))
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out),b)
 drcp=O/'multilayer-trial-drc.json';subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(out),'--format','json','--severity-all','-o',str(drcp)],check=True,capture_output=True)
 drc=json.loads(drcp.read_text());r.update(status='ROUTED_CANDIDATE_REQUIRES_REVIEW',routes=routes,new_vias_mm=via_points,unconnected=len(drc['unconnected_items']),violation_types=dict(collections.Counter(v['type']for v in drc['violations'])),candidate_sha256=hashlib.sha256(out.read_bytes()).hexdigest())
(O/'batts-multilayer-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2),flush=True)
