"""Route paired central In2 segment, with explicit unqualified fanouts; DRC all paths."""
import pcbnew as k
import wx
app=wx.App(False)
import json,math,subprocess,shutil,hashlib,itertools
from pathlib import Path
O=Path(__file__).resolve().parent;cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
src=O/'usb-main-fanout-candidate';out=O/'usb-main-pair-candidate';trial=O/'usb-main-pair-trial'
b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')))
for base in [out,trial]:
 for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),base.with_suffix(ext))
tracks=list(b.GetTracks());vias=[t for t in tracks if isinstance(t,k.PCB_VIA)]
netnames=['/USB_DP','/USB_DM'];ends=[];nets=[]
for name in netnames:
 vs=[v for v in vias if v.GetNetname()==name];assert len(vs)==2
 vs.sort(key=lambda v:v.GetPosition().x);ends.append([(k.ToMM(v.GetPosition().x),k.ToMM(v.GetPosition().y)) for v in vs]);nets.append(vs[0].GetNet())
# Conservative AABBs are only a prefilter; CLI DRC is authoritative.
obs=[]
for v in vias:
 if v.GetNetname() in netnames:continue
 pos=v.GetPosition();r=k.ToMM(v.GetWidth(k.In2_Cu))/2+.1+.1171/2;x=k.ToMM(pos.x);y=k.ToMM(pos.y);obs.append((x-r,y-r,x+r,y+r))
for f in b.GetFootprints():
 for p in f.Pads():
  if not p.IsOnLayer(k.In2_Cu):continue
  if p.GetNetname() in netnames:continue
  bb=p.GetBoundingBox();m=.1+.1171/2;obs.append((k.ToMM(bb.GetX())-m,k.ToMM(bb.GetY())-m,k.ToMM(bb.GetRight())+m,k.ToMM(bb.GetBottom())+m))
def hit(a,c,box):
 lo=0.;hi=1.
 for i in range(2):
  d=c[i]-a[i]
  if abs(d)<1e-10:
   if a[i]<box[i] or a[i]>box[i+2]:return False
  else:
   t1=(box[i]-a[i])/d;t2=(box[i+2]-a[i])/d;lo=max(lo,min(t1,t2));hi=min(hi,max(t1,t2))
   if lo>hi:return False
 return True
def length(path):return sum(math.dist(a,c) for a,c in zip(path,path[1:]))
candidates=[];screened=0
for x1,y1,x2,y2 in itertools.product([12.5,13.,13.5,14.,14.5,15.,15.5,16.],[14.,14.5,15.,15.5,16.,16.5,17.,17.5],[18.,18.5,19.,19.5,20.,20.5,21.],[9.,9.5,10.,10.5,11.,11.5,12.]):
 dx=x2-x1;dy=y2-y1;norm=math.hypot(dx,dy);ox=-dy/norm*.237;oy=dx/norm*.237
 paths=[[ends[0][0],(x1+ox,y1+oy),(x2+ox,y2+oy),ends[0][1]],[ends[1][0],(x1,y1),(x2,y2),ends[1][1]]];screened+=1
 if any(hit(a,c,box) for path in paths for a,c in zip(path,path[1:]) for box in obs):continue
 candidates.append((sum(length(p) for p in paths),paths))
candidates.sort(key=lambda c:c[0]);print('geometric candidates',len(candidates),'of',screened,flush=True)
failures=[];accepted=None
for count,(_,paths) in enumerate(candidates[:80],1):
 items=[]
 for net,path in zip(nets,paths):
  for a,c in zip(path,path[1:]):
   t=k.PCB_TRACK(b);t.SetStart(k.VECTOR2I(k.FromMM(a[0]),k.FromMM(a[1])));t.SetEnd(k.VECTOR2I(k.FromMM(c[0]),k.FromMM(c[1])));t.SetLayer(k.In2_Cu);t.SetWidth(k.FromMM(.1171));t.SetNet(net);b.AddNative(t);t.thisown=False;items.append(t)
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(trial.with_suffix('.kicad_pcb')),b)
 subprocess.run([cli,'pcb','drc',str(trial.with_suffix('.kicad_pcb')),'--format','json','--severity-all','-o',str(O/'usb-main-pair-trial-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 r=json.loads((O/'usb-main-pair-trial-drc.json').read_text())
 if not r['violations']:
  accepted={'paths_mm':paths,'inner_lengths_mm':[length(p) for p in paths],'tested':count};break
 failures.append({'trial':count,'types':sorted(set(v['type'] for v in r['violations']))})
 for t in items:b.RemoveNative(t)
 if count%10==0:print('tested',count,flush=True)
if accepted:k.SaveBoard(str(out.with_suffix('.kicad_pcb')),b)
review={'status':'PARTIAL_USB_PAIR_NOT_SI_QUALIFIED' if accepted else 'NO_ROUTE_ACCEPTED','source_sha256':hashlib.sha256(src.with_suffix('.kicad_pcb').read_bytes()).hexdigest(),'screened':screened,'geometric_candidates':len(candidates),'accepted':accepted,'failed_trials':failures,'limits':['Only central straight segment has 0.1199mm nominal edge gap; endpoint fanouts are uncoupled','Reference copper continuity, transition return vias, skew and impedance remain unqualified','Reuses entry vias; ESD branch topology requires review','No USB or ESD measured compliance claim']}
(O/'usb-main-pair-review.json').write_text(json.dumps(review,indent=2)+'\n');print(json.dumps(accepted),flush=True)
