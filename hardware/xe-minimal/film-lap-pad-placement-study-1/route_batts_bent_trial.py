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
via_stages=[];escape_paths={};reused_vias=set()
existing_batts_vias=[(k.ToMM(t.GetStart().x),k.ToMM(t.GetStart().y))for t in b.GetTracks()if isinstance(t,k.PCB_VIA)and t.GetNetname()=="/BAT_TS"]
def candidates(a):
 import heapq
 step=args.grid_step;radius=round(args.radius/step);points={};cost={};prev={};queue=[];closed=set();out=[]
 for ix in range(-radius,radius+1):
  for iy in range(-radius,radius+1):
   p=(round(a[0]+ix*step,6),round(a[1]+iy*step,6))
   if .4<=p[0]<=23.6 and .4<=p[1]<=26.6 and clear(track(p,p,k.B_Cu),k.B_Cu):points[(ix,iy)]=p
 for q in sorted(points,key=lambda q:math.dist(points[q],a))[:20]:
  if clear(track(a,points[q],k.B_Cu),k.B_Cu):cost[q]=math.dist(a,points[q]);prev[q]=None;heapq.heappush(queue,(cost[q],q))
 while queue:
  _,q=heapq.heappop(queue)
  if q in closed:continue
  closed.add(q);p=points[q];v=via(p)
  reuse=next((g for g in existing_batts_vias if math.dist(p,g)<.3 and clear(track(p,g,k.B_Cu),k.B_Cu)),None)
  if reuse is not None or all(clear(v,l)for l in layers) and not any(v.GetEffectiveShape(l).Collide(shape,k.FromMM(.1))for l,shape in pads):
   path=[];u=q
   while u is not None:path.append(points[u]);u=prev[u]
   path.append(a);path.reverse()
   if reuse is not None:path.append(reuse);p=reuse;reused_vias.add(p)
   simple=[path[0]];i=0
   while i<len(path)-1:
    j=len(path)-1
    while j>i+1 and not clear(track(path[i],path[j],k.B_Cu),k.B_Cu):j-=1
    if math.dist(simple[-1],path[j])>1e-8:simple.append(path[j])
    i=j
   escape_paths[p]=simple;out.append(p)
   if reuse is not None or len(out)>=30:break
  for dx,dy in [(1,0),(-1,0),(0,1),(0,-1),(1,1),(1,-1),(-1,1),(-1,-1)]:
   n=(q[0]+dx,q[1]+dy)
   if n not in points or n in closed:continue
   c=cost[q]+step*math.hypot(dx,dy)
   if c>=cost.get(n,1e99) or not clear(track(p,points[n],k.B_Cu),k.B_Cu):continue
   cost[n]=c;prev[n]=q;heapq.heappush(queue,(c,n))
 via_stages.append({'start_mm':a,'grid_step_mm':step,'clear_grid_nodes':len(points),'visited':len(closed),'reachable_vias':len(out),'candidate_cap':30})
 print(via_stages[-1],flush=True);return out
a=(12.75,1.5);z=(21.3,1.9);A=candidates(a);Z=[z]if args.existing_via else candidates(z);print('via candidates',len(A),len(Z),flush=True);candidates=[]
for v in A:
 if v in reused_vias:
  candidates.append((sum(math.dist(s,e)for s,e in zip(escape_paths[v],escape_paths[v][1:])),v,v,k.B_Cu));continue
 for w in Z:
  for l in [k.In4_Cu,k.In2_Cu,k.In3_Cu,k.In1_Cu,k.F_Cu]:
   if clear(track(v,w,l),l):candidates.append((sum(math.dist(s,e)for s,e in zip(escape_paths[v],escape_paths[v][1:]))+math.dist(v,w)+math.dist(w,z),v,w,l))
candidates.sort(key=lambda row:row[0]);accepted=None;attempts=[];out=O/('pendant-xe-film-lap-batts-bent-trial.kicad_pcb' if args.existing_via else 'pendant-xe-film-lap-batts-trial.kicad_pcb')
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),out.with_suffix(ext))
for length,v,w,l in candidates[:30]:
 assert args.existing_via
 items=([]if v in reused_vias else[via(v),track(v,w,l)])+[track(s,e,k.B_Cu)for s,e in zip(escape_paths[v],escape_paths[v][1:])]
 for item in items:b.AddNative(item);item.thisown=False
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out),b)
 subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(out),'--format','json','--severity-all','-o',str(O/('batts-bent-drc.json'if args.existing_via else 'batts-bent-drc.json'))],check=True,capture_output=True)
 r=json.loads((O/('batts-bent-drc.json'if args.existing_via else 'batts-bent-drc.json')).read_text());bad=[x for x in r['violations']if x['type']not in ['lib_footprint_issues','missing_courtyard','silk_edge_clearance','silk_over_copper','silk_overlap']];row={'reused_existing_via':v in reused_vias,'vias_mm':[v,w],'layer':b.GetLayerName(l),'escape_path_mm':escape_paths[v],'added_length_mm':length,'unconnected':len(r['unconnected_items']),'non_library_courtyard_silk_violations':[x['type']for x in bad]};attempts.append(row)
 if not bad and not r['unconnected_items']:accepted=row;break
 for item in items:b.RemoveNative(item)
 print('rejected',row,flush=True)
r={'status':'BYPASS_CANDIDATE_NOT_MANUFACTURING_RELEASE','source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'search_radius_mm':args.radius,'via_search_stages':via_stages,'via_candidates_at_ends':[len(A),len(Z)],'escape_candidates':[{'via_mm':v,'path_mm':escape_paths[v]}for v in A],'straight_inner_candidates':len(candidates),'accepted_geometrically':accepted,'attempts':attempts,'limits':['Acceptance excludes documented footprint-library/courtyard/silk issues, which still require repair.','New through vias are standard design hypotheses; no supplier approval or SI qualification.','No schematic/BOM substitution, real solder process, harness or runtime qualification.']};(O/('batts-bent-review.json'if args.existing_via else 'batts-bent-review.json')).write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2),flush=True)
