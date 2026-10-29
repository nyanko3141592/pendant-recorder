"""Move cold-reference resistors near comparator; candidate only, DRC each placement."""
import pcbnew as k
import wx
app=wx.App(False)
from pathlib import Path
import json,math,shutil,subprocess
P=Path(__file__).resolve().parent;src=P/'pendant-xe-minimal';out=P/'guard-hot-cluster-candidate';trial=P/'guard-hot-cluster-trial';cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
for base in [out,trial]:
 for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),base.with_suffix(ext))
b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));result=[]
for ref in ['R40','R41']:
 fps={f.GetReference():f for f in b.GetFootprints()};f=fps[ref];old=f.GetPosition();oldmm=[k.ToMM(old.x),k.ToMM(old.y)];oldflip=f.IsFlipped();oldangle=f.GetOrientationDegrees();removed=[]
 for t in list(b.GetTracks()):
  if isinstance(t,k.PCB_VIA):continue
  if any(p.IsOnLayer(t.GetLayer()) and p.GetNetname()==t.GetNetname() and (p.HitTest(t.GetStart()) or p.HitTest(t.GetEnd())) for p in f.Pads()):removed.append(t);b.RemoveNative(t)
 if not f.IsFlipped():f.Flip(old,k.FLIP_DIRECTION_LEFT_RIGHT)
 target=next(p.GetPosition() for p in fps['U12'].Pads() if p.GetNumber()=='6');candidates=[(x/4,y/4,angle) for x in range(68,93,1) for y in range(64,105,1) for angle in [0,90,180,270]];candidates.sort(key=lambda v:math.hypot(v[0]-k.ToMM(target.x),v[1]-k.ToMM(target.y)));accepted=None;tested=0
 for x,y,angle in candidates:
  f.SetOrientationDegrees(angle);f.SetPosition(k.VECTOR2I(k.FromMM(x),k.FromMM(y)));box=f.GetBoundingBox(False,False)
  if box.GetX()<k.FromMM(.3) or box.GetY()<k.FromMM(.3) or box.GetRight()>k.FromMM(23.7) or box.GetBottom()>k.FromMM(26.7):continue
  if any(g!=f and g.IsFlipped() and box.Intersects(g.GetBoundingBox(False,False)) for g in b.GetFootprints()):continue
  k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(trial.with_suffix('.kicad_pcb')),b);tested+=1
  subprocess.run([cli,'pcb','drc',str(trial.with_suffix('.kicad_pcb')),'--format','json','--severity-all','-o',str(P/'guard-hot-cluster-trial-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
  r=json.loads((P/'guard-hot-cluster-trial-drc.json').read_text())
  if not r['violations']:accepted={'ref':ref,'old_position_mm':oldmm,'new_position_mm':[x,y],'new_side':'B','rotation':angle,'removed_tracks':len(removed),'tested':tested};break
 if not accepted:
  f.SetPosition(old)
  if f.IsFlipped()!=oldflip:f.Flip(old,k.FLIP_DIRECTION_LEFT_RIGHT)
  f.SetOrientationDegrees(oldangle)
  for t in removed:b.AddNative(t)
 result.append(accepted or {'ref':ref,'deferred':True,'tested':tested});print(result[-1],flush=True)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out.with_suffix('.kicad_pcb')),b)
(P/'guard-hot-cluster-review.json').write_text(json.dumps({'status':'PLACEMENT_CANDIDATE_NOT_ROUTED','changes':result,'limits':['Ground connection on moved resistor must be restored','Reference network still needs complete routing and thermal/noise validation','Front/back assembly and battery clearances remain unqualified']},indent=2)+'\n')
