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
route_layers=[k.F_Cu,k.In2_Cu,k.In4_Cu,k.B_Cu,k.In1_Cu,k.In3_Cu]
plane_guards={}
for plane,adj in [(k.In1_Cu,[k.F_Cu,k.In2_Cu]),(k.In3_Cu,[k.In2_Cu,k.In4_Cu])]:
 plane_guards[plane]=[t.GetEffectiveShape(t.GetLayer())for t in b.GetTracks()if not isinstance(t,k.PCB_VIA)and t.GetLayer()in adj and(t.GetNetname().startswith('/PDM_')or t.GetNetname().startswith('/SD_')or t.GetNetname()in['/USB_DP','/USB_DM','/V3V3'])]
original_clear=clear
def clear(t,l):
 return original_clear(t,l)and not any(t.GetEffectiveShape(l).Collide(shape,k.FromMM(.2))for shape in plane_guards.get(l,[]))
a=(12.75,1.5);target=(21.3,1.9);step=.1
fast=[t.GetEffectiveShape(t.GetLayer())for t in b.GetTracks()if not isinstance(t,k.PCB_VIA)and t.GetLayer()in[k.F_Cu,k.In2_Cu]and(t.GetNetname().startswith('/PDM_')or t.GetNetname().startswith('/SD_')or t.GetNetname()in['/USB_DP','/USB_DM','/V3V3'])]
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
targets={l:[]for l in route_layers}
for t in b.GetTracks():
 if isinstance(t,k.PCB_VIA)or t.GetNetname()!='/BAT_TS' or t.GetLayer()not in targets:continue
 targets[t.GetLayer()].append(((k.ToMM(t.GetStart().x),k.ToMM(t.GetStart().y)),(k.ToMM(t.GetEnd().x),k.ToMM(t.GetEnd().y))))
def contact(pos,l):
 for s,e in targets[l]:
  dx,dy=e[0]-s[0],e[1]-s[1];den=dx*dx+dy*dy
  u=max(0.,min(1.,((pos[0]-s[0])*dx+(pos[1]-s[1])*dy)/den))if den else 0.
  c=(s[0]+u*dx,s[1]+u*dy)
  if math.dist(pos,c)<.35 and clear(track(pos,c,l),l):return c
 return None
rows=[]
for l,segments in targets.items():
 for s,e in segments:
  valid=[]
  for j in range(21):
   q=tuple(s[i]+(e[i]-s[i])*j/20 for i in range(2))
   if clear(track(q,q,l),l):valid.append(q)
  rows.append({'layer':b.GetLayerName(l),'start':s,'end':e,'valid_count':len(valid),'valid_points':valid})
r={'source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'screen_clearance_mm':.105,'rows':rows,'total_valid_points':sum(x['valid_count']for x in rows),'limits':['Point clearance screen only; no reachability proof.']}
(O/'power-guarded-target-access-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps({'total_valid_points':r['total_valid_points'],'rows':[{key:value for key,value in x.items()if key!='valid_points'}for x in rows]},indent=2))
