import pcbnew as k,wx
app=wx.App(False)
import json,shutil,subprocess
from pathlib import Path
O=Path(__file__).resolve().parent;src=O/'pendant-xe-minimal';dst=O/'iset-ground-clearance-candidate';cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
results=[]
for y in [22.5,22.6,22.7,22.8]:
 b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')))
 v=next(t for t in b.GetTracks() if t.m_Uuid.AsString()=='ae2cc60a-2570-428d-89c8-5e3181c85f18');old=v.GetPosition();new=k.VECTOR2I(k.FromMM(y),old.y);updates=[]
 for t in b.GetTracks():
  if isinstance(t,k.PCB_VIA) or t.GetNetname()!=v.GetNetname():continue
  if t.GetStart()==old:t.SetStart(new);updates.append(t.m_Uuid.AsString())
  if t.GetEnd()==old:t.SetEnd(new);updates.append(t.m_Uuid.AsString())
 assert len(updates)==1
 v.SetPosition(new);k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
 subprocess.run([cli,'pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'iset-ground-clearance-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 r=json.loads((O/'iset-ground-clearance-drc.json').read_text());ok=not r['violations'] and not r['schematic_parity'] and len(r['unconnected_items'])==37
 results.append({'x_mm':y,'accepted':ok,'violations':r['violations'],'unconnected':len(r['unconnected_items']),'tracks_updated':updates});print(y,ok,len(r['violations']),flush=True)
 if ok:break
(O/'iset-ground-clearance-review.json').write_text(json.dumps(results,indent=2)+'\n')
