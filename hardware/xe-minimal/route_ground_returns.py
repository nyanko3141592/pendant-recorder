import pcbnew as k
import wx
app=wx.App(False)
import json,subprocess,shutil,math,hashlib
from pathlib import Path
O=Path(__file__).resolve().parent;cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli';src=O/'pendant-xe-minimal';out=O/'ground-return-candidate';trial=O/'ground-return-trial'
b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));fps={f.GetReference():f for f in b.GetFootprints()}
for base in [out,trial]:
 for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),base.with_suffix(ext))
jobs=json.loads((O/'remaining-ground-review.json').read_text())['deferred'];deferred_set={(j['ref'],j['pin']) for j in jobs};accepted=[];deferred=[]
for job in jobs:
 f=fps[job['ref']];p=next(p for p in f.Pads() if p.GetNumber()==job['pin']);a=p.GetPosition();layer=k.B_Cu if f.IsFlipped() else k.F_Cu
 targets=[]
 for g in b.GetFootprints():
  for q in g.Pads():
   if q.GetNetname()=='/GND' and q.IsOnLayer(layer) and (g.GetReference(),q.GetNumber()) not in deferred_set:targets.append((q.GetPosition(),g.GetReference()+'.'+q.GetNumber()))
 for v in b.GetTracks():
  if isinstance(v,k.PCB_VIA) and v.GetNetname()=='/GND':targets.append((v.GetPosition(),'existing GND via'))
 targets=sorted(targets,key=lambda q:math.hypot(q[0].x-a.x,q[0].y-a.y))[:6];success=False
 for c,label in targets:
  if math.hypot(c.x-a.x,c.y-a.y)>k.FromMM(6):continue
  for path in [[(a.x,a.y),(c.x,c.y)],[(a.x,a.y),(a.x,c.y),(c.x,c.y)],[(a.x,a.y),(c.x,a.y),(c.x,c.y)]]:
   tracks=[]
   for start,end in zip(path,path[1:]):
    if start==end:continue
    t=k.PCB_TRACK(b);t.SetStart(k.VECTOR2I(*start));t.SetEnd(k.VECTOR2I(*end));t.SetWidth(k.FromMM(.15));t.SetLayer(layer);t.SetNet(p.GetNet());b.AddNative(t);t.thisown=False;tracks.append(t)
   if not tracks:continue
   k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(trial.with_suffix('.kicad_pcb')),b)
   subprocess.run([cli,'pcb','drc',str(trial.with_suffix('.kicad_pcb')),'--format','json','--severity-all','-o',str(O/'ground-return-trial-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
   r=json.loads((O/'ground-return-trial-drc.json').read_text())
   if not r['violations']:
    accepted.append(dict(job,target=label));success=True;break
   for t in tracks:b.RemoveNative(t)
  if success:break
 if not success:deferred.append(job)
 print(job,'accepted' if success else 'deferred',flush=True)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out.with_suffix('.kicad_pcb')),b)
subprocess.run([cli,'pcb','drc',str(out.with_suffix('.kicad_pcb')),'--format','json','--severity-all','-o',str(O/'ground-return-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
r=json.loads((O/'ground-return-drc.json').read_text());assert not r['violations'];ground=[v for v in r['unconnected_items'] if any('[/GND]' in i['description'] for i in v['items'])]
(O/'ground-return-review.json').write_text(json.dumps({'status':'PARTIAL_ROUTING_NOT_RELEASED','accepted':accepted,'deferred':deferred,'unconnected_items':len(r['unconnected_items']),'ground_unconnected_items':len(ground),'physical_drc_violations':0,'board_sha256':hashlib.sha256(out.with_suffix('.kicad_pcb').read_bytes()).hexdigest(),'limitation':'Connectivity does not establish return inductance, EMC, thermal performance or completed power circuit.'},indent=2)+'\n');print('unconnected',len(r['unconnected_items']),'ground',len(ground),flush=True)
