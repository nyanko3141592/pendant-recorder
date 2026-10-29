#!/usr/bin/env python3
"""Try relocating whole connected In1 route components; accept only clean DRC."""
import pcbnew as k,wx
from pathlib import Path
import math,json,subprocess,shutil
app=wx.App(False)
D=Path(__file__).resolve().parent/'costdown/HW-V1.4-EVT-4LAYER-27P5/route';P=D/'hw-v1.4-evt-4layer-27p5-routed-candidate.kicad_pcb';W=D/'manual-refinement';T=W/'reference-clearance-trial.kicad_pcb'
for ext in ('.kicad_pro','.kicad_dru'):shutil.copy2(P.with_suffix(ext),T.with_suffix(ext))
b=k.LoadBoard(str(P))
def point(v):return(v.x,v.y)
# Only connected components with direct geometric overlap to USB main corridor.
tracks=[t for t in b.GetTracks() if not isinstance(t,k.PCB_VIA) and t.GetLayer()==k.In1_Cu];components=[]
while tracks:
 group=[tracks.pop()];ends={point(group[0].GetStart()),point(group[0].GetEnd())};changed=True
 while changed:
  changed=False
  for t in list(tracks):
   if t.GetNetCode()==group[0].GetNetCode() and (point(t.GetStart()) in ends or point(t.GetEnd()) in ends):
    tracks.remove(t);group.append(t);ends.update([point(t.GetStart()),point(t.GetEnd())]);changed=True
 # USB corridor roughly x+y=29.1..30, x=12..21.2; broaden for plane margin.
 if any(11.8<k.ToMM(t.GetStart().x)<21.3 and 28.5<k.ToMM(t.GetStart().x+t.GetStart().y)<30.6 or 11.8<k.ToMM(t.GetEnd().x)<21.3 and 28.5<k.ToMM(t.GetEnd().x+t.GetEnd().y)<30.6 for t in group):components.append((str(group[0].GetNetname()),[t.m_Uuid.AsString() for t in group]))
results=[]
for name,ids in components:
 for layer in (k.In2_Cu,k.F_Cu,k.B_Cu):
  b=k.LoadBoard(str(P));ts={t.m_Uuid.AsString():t for t in b.GetTracks()}
  for uid in ids:ts[uid].SetLayer(layer)
  k.SaveBoard(str(T),b)
  subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc','--refill-zones','--save-board','--format','json','--severity-all','--output',str(W/'reference-clearance-drc.json'),str(T)],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
  drc=json.loads((W/'reference-clearance-drc.json').read_text());bad=[v for v in drc['violations'] if v['type']!='lib_footprint_issues'];ok=not bad and not drc['unconnected_items']
  results.append({'net':name,'segments':len(ids),'target_layer':b.GetLayerName(layer),'violations':len(bad),'unconnected':len(drc['unconnected_items']),'accepted':ok})
  if ok:shutil.copy2(T,P);break
 print(name,results[-1],flush=True)
(W/'reference-relocation-review.json').write_text(json.dumps(results,indent=2)+'\n')
