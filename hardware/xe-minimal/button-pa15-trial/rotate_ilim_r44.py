import pcbnew as k,wx,json,shutil,subprocess
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;src=O/'pa15-ilim-square-escape-candidate';dst=O/'pa15-r44-rotate-candidate';out=[]
for ext in ['.kicad_sch','.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
for angle in [180,90,270]:
 dx=dy=0
 b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));f=next(f for f in b.GetFootprints() if f.GetReference()=='R44');old={p.GetNumber():p.GetPosition() for p in f.Pads()};delta=k.VECTOR2I(round(dx*1e6),round(dy*1e6));f.SetOrientationDegrees(angle)
 b.RemoveNative(next(t for t in b.GetTracks() if t.m_Uuid.AsString()=='31250e19-47da-4bc1-b31a-37cf64742543'))
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
 subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'pa15-r44-rotate-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 r=json.loads((O/'pa15-r44-rotate-drc.json').read_text());ok=all(v['type'] in ('via_dangling','track_dangling') for v in r['violations']) and not r['schematic_parity'] and len(r['unconnected_items'])<=26;out.append({'angle':angle,'accepted':ok,'violations':r['violations']});print(angle,ok,len(r['violations']),flush=True)
 if ok:break
(O/'pa15-r44-rotate-review.json').write_text(json.dumps(out,indent=2)+'\n')
