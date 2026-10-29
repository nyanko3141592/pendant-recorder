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
# Protect projected fast-signal references in In1 in addition to same-layer copper.
reference_obstacles=[t.GetEffectiveShape(t.GetLayer())for t in b.GetTracks()if not isinstance(t,k.PCB_VIA)and t.GetLayer()in[k.F_Cu,k.In2_Cu]and(t.GetNetname().startswith('/PDM_')or t.GetNetname().startswith('/SD_')or t.GetNetname()in['/USB_DP','/USB_DM'])]
base_clear=clear
def clear(t,l):
 return base_clear(t,l)and(l!=k.In1_Cu or not any(t.GetEffectiveShape(l).Collide(shape,k.FromMM(.2))for shape in reference_obstacles))

import heapq,functools,collections
assert args.existing_via
saved=O/'batts-bent-review.json';escape_review=json.loads(saved.read_text());assert escape_review['source_sha256']==hashlib.sha256(src.read_bytes()).hexdigest()
out=O/'pendant-xe-film-lap-reference-guarded-trial.kicad_pcb'
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),out.with_suffix(ext))
accepted=None;attempts=[];z=(21.3,1.9)
for l in [k.In1_Cu]:
 step=.1
 @functools.lru_cache(None)
 def segment_clear(s,e):return clear(track(s,e,l),l)
 points={(i,j):(round(i*step,6),round(j*step,6))for i in range(105,224)for j in range(4,81)if segment_clear((round(i*step,6),round(j*step,6)),(round(i*step,6),round(j*step,6)))}
 print('layer',b.GetLayerName(l),'clear nodes',len(points),flush=True)
 for escape in escape_review['escape_candidates']:
  a=tuple(escape['via_mm']);cost={};prev={};queue=[];closed=set();end=None
  goals={q for q in sorted(points,key=lambda q:math.dist(points[q],z))[:24]if segment_clear(points[q],z)}
  for q in sorted(points,key=lambda q:math.dist(points[q],a))[:24]:
   if segment_clear(a,points[q]):cost[q]=math.dist(a,points[q]);prev[q]=None;heapq.heappush(queue,(cost[q]+math.dist(points[q],z),q))
  while queue:
   _,q=heapq.heappop(queue)
   if q in closed:continue
   closed.add(q)
   if q in goals:end=q;break
   for dx,dy in [(1,0),(-1,0),(0,1),(0,-1),(1,1),(1,-1),(-1,1),(-1,-1)]:
    n=(q[0]+dx,q[1]+dy)
    if n not in points or n in closed:continue
    c=cost[q]+step*math.hypot(dx,dy)
    if c>=cost.get(n,1e99)or not segment_clear(points[q],points[n]):continue
    cost[n]=c;prev[n]=q;heapq.heappush(queue,(c+math.dist(points[n],z),n))
  row={'layer':b.GetLayerName(l),'via_mm':a,'visited':len(closed),'found':end is not None};attempts.append(row);print(row,flush=True)
  if end is None:continue
  path=[z];q=end
  while q is not None:path.append(points[q]);q=prev[q]
  path.append(a);path.reverse();simple=[path[0]];i=0
  while i<len(path)-1:
   j=len(path)-1
   while j>i+1 and not segment_clear(path[i],path[j]):j-=1
   if math.dist(simple[-1],path[j])>1e-8:simple.append(path[j])
   i=j
  items=[via(a)]+[track(tuple(s),tuple(e),k.B_Cu)for s,e in zip(escape['path_mm'],escape['path_mm'][1:])]+[track(s,e,l)for s,e in zip(simple,simple[1:])]
  for t in items:b.AddNative(t);t.thisown=False
  k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out),b)
  subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(out),'--format','json','--severity-all','-o',str(O/'reference-guarded-trial-drc.json')],check=True,capture_output=True)
  drc=json.loads((O/'reference-guarded-trial-drc.json').read_text());bad=[v for v in drc['violations']if v['type']not in ['lib_footprint_issues','missing_courtyard','silk_edge_clearance','silk_over_copper','silk_overlap']]
  row.update(path_mm=simple,bottom_escape_mm=escape['path_mm'],unconnected=len(drc['unconnected_items']),violation_types=dict(collections.Counter(v['type']for v in drc['violations'])))
  if not bad and not drc['unconnected_items']:accepted=row;break
  for t in items:b.RemoveNative(t)
 if accepted:break
r={'status':'CONNECTED_GEOMETRY_CANDIDATE_NOT_RELEASE'if accepted else'INNER_ROUTE_SEARCH_INCOMPLETE','source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'escape_source_sha256':hashlib.sha256(saved.read_bytes()).hexdigest(),'reference_projection_clearance_mm':.2,'reference_projection_obstacle_count':len(reference_obstacles),'accepted':accepted,'attempts':attempts,'limits':['Schematic parity and thermistor/R13 substitutions remain unresolved.','Library/courtyard/silk violations are not accepted for manufacturing and must be repaired.','No runtime, thermal, SI, solder process or case-fit qualification.']};(O/'batts-reference-guarded-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2),flush=True)
