import pcbnew as k,wx
app=wx.App(False)
import json,shutil,subprocess
from pathlib import Path
O=Path(__file__).resolve().parent;src=O/'pendant-xe-minimal';dst=O/'c7-rotated-candidate'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
rows=[]
for delta in [180,90,270]:
 b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));f=next(f for f in b.GetFootprints() if f.GetReference()=='C7');g=next(p for p in f.Pads() if p.GetNumber()=='2');old=g.GetPosition();f.SetOrientationDegrees(f.GetOrientationDegrees()+delta);f.Move(old-g.GetPosition());assert g.GetPosition()==old
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
 subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'c7-rotated-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 r=json.loads((O/'c7-rotated-drc.json').read_text());ok=not r['violations'] and not r['schematic_parity'] and len(r['unconnected_items'])==40;rows.append({'delta':delta,'accepted':ok,'violations':r['violations']});print(delta,ok,len(r['violations']),flush=True)
 if ok:break
(O/'c7-rotated-review.json').write_text(json.dumps(rows,indent=2)+'\n')
