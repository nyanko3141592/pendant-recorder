"""Try short local same-side paths; accept only paths that pass physical DRC."""
import pcbnew
import wx
app=wx.App(False)
import json,subprocess,shutil,math,hashlib
from pathlib import Path
O=Path(__file__).resolve().parent;cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
src=O/'pendant-xe-minimal';dst=O/'rtc-routing-candidate';trial=O/'rtc-route-trial'
b=pcbnew.LoadBoard(str(src.with_suffix('.kicad_pcb')));fps={f.GetReference():f for f in b.GetFootprints()}
for base in [dst,trial]:
 for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),base.with_suffix(ext))
def pad(ref,n):return next(p for p in fps[ref].Pads() if p.GetNumber()==n)
jobs=[('Y1','1','U1','3'),('Y1','2','U1','4'),('C11','1','Y1','1'),('C12','1','Y1','2')]
accepted=[];rejected=[]
for r,n,t,k in jobs:
 p,q=pad(r,n),pad(t,k);assert p.GetNetname()==q.GetNetname();a,c=p.GetPosition(),q.GetPosition();paths=[[(a.x,a.y),(c.x,c.y)],[(a.x,a.y),(a.x,c.y),(c.x,c.y)],[(a.x,a.y),(c.x,a.y),(c.x,c.y)]];success=False
 for path in paths:
  tracks=[]
  for start,end in zip(path,path[1:]):
   if start==end:continue
   tr=pcbnew.PCB_TRACK(b);tr.SetStart(pcbnew.VECTOR2I(*start));tr.SetEnd(pcbnew.VECTOR2I(*end));tr.SetWidth(pcbnew.FromMM(.15));tr.SetLayer(pcbnew.B_Cu if fps[r].IsFlipped() else pcbnew.F_Cu);tr.SetNet(p.GetNet());b.AddNative(tr);tr.thisown=False;tracks.append(tr)
  pcbnew.ZONE_FILLER(b).Fill(b.Zones());pcbnew.SaveBoard(str(trial.with_suffix('.kicad_pcb')),b)
  result=subprocess.run([cli,'pcb','drc',str(trial.with_suffix('.kicad_pcb')),'--format','json','--severity-all','-o',str(O/'rtc-route-trial-drc.json')],stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
  if result.returncode!=0:raise RuntimeError('DRC failed to execute')
  report=json.loads((O/'rtc-route-trial-drc.json').read_text())
  if not report['violations']:
   accepted.append({'from':[r,n],'to':[t,k],'net':p.GetNetname(),'segments':len(tracks)});success=True;break
  for tr in tracks:b.RemoveNative(tr)
 if not success:rejected.append({'from':[r,n],'to':[t,k],'reason':'Direct and two orthogonal short paths fail physical DRC; requires obstacle-aware routing.'})
pcbnew.ZONE_FILLER(b).Fill(b.Zones());pcbnew.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
subprocess.run([cli,'pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--format','json','--severity-all','-o',str(O/'rtc-routing-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
final=json.loads((O/'rtc-routing-drc.json').read_text());assert not final['violations']
summary={'status':'PARTIAL_LOCAL_ROUTING_NOT_RELEASED','accepted':accepted,'unrouted_local_jobs':rejected,'physical_drc_violations':0,'unconnected_items':len(final['unconnected_items']),'board_sha256':hashlib.sha256(dst.with_suffix('.kicad_pcb').read_bytes()).hexdigest(),'limits':['Clock drive margin, load capacitance and oscillator startup remain unverified','0.15mm local traces are not qualification of whole power path','No via or differential-pair routing in this pass','Power architecture, battery fit and runtime remain unqualified']}
(O/'rtc-routing-review.json').write_text(json.dumps(summary,indent=2)+'\n');print('accepted',len(accepted),'deferred',len(rejected),'unconnected',summary['unconnected_items'],flush=True)
