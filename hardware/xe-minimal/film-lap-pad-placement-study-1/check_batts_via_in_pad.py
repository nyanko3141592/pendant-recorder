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
f=next(f for f in b.GetFootprints()if f.GetReference()=='TH1');p=next(p for p in f.Pads()if p.GetNumber()=='1');assert p.GetNetname()=='/BAT_TS'
fast=[(t.GetNetname(),t.GetEffectiveShape(t.GetLayer()))for t in b.GetTracks()if not isinstance(t,k.PCB_VIA)and t.GetLayer()in[k.F_Cu,k.In2_Cu]and(t.GetNetname().startswith('/PDM_')or t.GetNetname().startswith('/SD_')or t.GetNetname()in['/USB_DP','/USB_DM'])]
rows=[]
for ix in range(252,259):
 for iy in range(17,44):
  pos=(ix*.05,iy*.05);v=via(pos);blocked=[b.GetLayerName(l)for l in layers if not clear(v,l)]
  hole_conflicts=[]
  for t in b.GetTracks():
   if isinstance(t,k.PCB_VIA):
    c=t.GetPosition();d=math.dist(pos,(k.ToMM(c.x),k.ToMM(c.y)));limit=.2+.075+k.ToMM(t.GetDrill())/2
    if d<limit:hole_conflicts.append(t.m_Uuid.AsString())
  projections=[name for name,shape in fast if v.GetEffectiveShape(k.In1_Cu).Collide(shape,k.FromMM(.2))]
  rows.append({'via_mm':pos,'blocked_layers':blocked,'hole_conflicts':hole_conflicts,'fast_projection_conflicts':projections,'clear_copper_holes_and_reference_screen':not blocked and not hole_conflicts and not projections})
clear_rows=[r for r in rows if r['clear_copper_holes_and_reference_screen']];clear_rows.sort(key=lambda r:math.dist(r['via_mm'],[12.75,1.5]))
r={'status':'FILLED_CAPPED_VIA_IN_WIRE_PAD_SCREEN_NOT_MANUFACTURING_APPROVAL','source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'via_diameter_mm':.35,'drill_mm':.15,'candidate_count':len(rows),'clear_candidates':clear_rows,'rows':rows,'limits':['Requires filled and copper-capped planar solder surface; tenting alone does not meet this hypothesis.','No supplier acceptance, cap thickness/flatness or wire solder-process validation.','Other-net copper screen on all six layers; hole distances checked for vias only.','Reference projection clearance is a geometric screen, not signal qualification.','A clear via position alone does not prove an inner-layer connection route.']};(O/'batts-via-in-pad-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps({'clear_count':len(clear_rows),'nearest':clear_rows[:5]},indent=2))
