import pcbnew as k,wx
app=wx.App(False)
from pathlib import Path
import json,shutil,subprocess
O=Path(__file__).resolve().parent;src=O/'pendant-xe-minimal';dst=O/'r13-rotate-candidate'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
results=[]
for angle in [270,90,180]:
 b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));f=next(f for f in b.GetFootprints() if f.GetReference()=='R13');pad2=next(p for p in f.Pads() if p.GetNumber()=='1');anchor=pad2.GetPosition();anchor=k.VECTOR2I(anchor.x,anchor.y)
 f.SetOrientationDegrees(angle);now=pad2.GetPosition();pos=f.GetPosition();f.SetPosition(k.VECTOR2I(pos.x+anchor.x-now.x,pos.y+anchor.y-now.y));assert pad2.GetPosition()==anchor
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
 subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'r13-rotate-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 r=json.loads((O/'r13-rotate-drc.json').read_text());ok=not r['violations'] and not r['schematic_parity'] and len(r['unconnected_items'])==66
 results.append({'angle':angle,'accepted':ok,'violations':len(r['violations'])})
 if ok:break
(O/'r13-rotate-review.json').write_text(json.dumps(results,indent=2)+'\n');print(results)
