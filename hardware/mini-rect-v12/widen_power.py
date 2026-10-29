"""Widen power copper where KiCad clearance checks permit; preserve baseline."""
from pathlib import Path
import json,shutil,subprocess,wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;name='power-width-candidate';src='connected-candidate'
for ext in ['kicad_pro','kicad_sch']:shutil.copy2(P/(src+'.'+ext),P/(name+'.'+ext))
b=k.LoadBoard(str(P/(src+'.kicad_pcb')));changed={};nets={'/V3V3','/SYS','/VBUS','/BAT','/SD_V3','/VDDA','/VCAP'}
for t in b.GetTracks():
 if not isinstance(t,k.PCB_VIA) and t.GetNetname() in nets and t.GetWidth()<k.FromMM(.25):
  changed[t.m_Uuid.AsString()]={'track':t,'old':t.GetWidth(),'net':t.GetNetname(),'length_mm':k.ToMM(t.GetLength())};t.SetWidth(k.FromMM(.25))
initial=len(changed);reverted=[]
for attempt in range(30):
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(P/(name+'.kicad_pcb')),b)
 subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(P/(name+'.kicad_pcb')),'--schematic-parity','--format','json','-o',str(P/(name+'-drc.json'))],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 d=json.loads((P/(name+'-drc.json')).read_text());print(attempt,len(d['violations']),len(d['unconnected_items']),flush=True)
 if not d['violations'] and not d['unconnected_items']:break
 ids={i['uuid'] for v in d['violations'] for i in v['items']} & changed.keys()
 # KiCad can report only one segment per colliding chain. Revert nearby widened segments together.
 anchors=[changed[u]['track'].GetStart() for u in ids]
 ids |= {u for u,q in changed.items() if any((q['track'].GetStart()-a).EuclideanNorm()<k.FromMM(.5) for a in anchors)}
 if not ids:raise RuntimeError('Unresolved violation unrelated to width changes')
 for uid in ids:
  q=changed.pop(uid);q['track'].SetWidth(q['old']);reverted.append({'uuid':uid,'net':q['net'],'width_mm':k.ToMM(q['old']),'length_mm':q['length_mm']})
else:raise RuntimeError('No clean candidate')
r={'source':src,'candidate':name,'attempted_segments':initial,'widened_segments':len(changed),'widened_length_mm':sum(q['length_mm'] for q in changed.values()),'retained_narrow_segments':reverted,'scope':'Clearance-aware width improvement only; power integrity, decoupling loops and current/thermal qualification remain pending.'}
(P/'power-width-review.json').write_text(json.dumps(r,indent=2)+'\n');print('Widened',len(changed),'segments',r['widened_length_mm'],'mm',flush=True)
