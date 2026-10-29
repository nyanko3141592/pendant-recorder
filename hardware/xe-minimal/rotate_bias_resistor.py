import pcbnew as k,wx
app=wx.App(False)
from pathlib import Path
import json,shutil,subprocess
O=Path(__file__).resolve().parent;src=O/'pendant-xe-minimal';dst=O/'bias-rotation-candidate'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
results=[]
for angle in [0,180,270]:
 b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));f=next(f for f in b.GetFootprints() if f.GetReference()=='R12');pad2=next(p for p in f.Pads() if p.GetNumber()=='2');anchor=pad2.GetPosition();anchor=k.VECTOR2I(anchor.x,anchor.y)
 f.SetOrientationDegrees(angle);now=pad2.GetPosition();pos=f.GetPosition();f.SetPosition(k.VECTOR2I(pos.x+anchor.x-now.x,pos.y+anchor.y-now.y));assert pad2.GetPosition()==anchor
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
 subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'bias-rotation-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 r=json.loads((O/'bias-rotation-drc.json').read_text());ok=not r['violations'] and not r['schematic_parity'] and len(r['unconnected_items'])==79
 results.append({'angle':angle,'accepted':ok,'violations':len(r['violations'])})
 if ok:break
(O/'bias-rotation-review.json').write_text(json.dumps(results,indent=2)+'\n');print(results)
