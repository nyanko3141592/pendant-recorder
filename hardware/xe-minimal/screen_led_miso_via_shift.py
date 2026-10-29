import pcbnew as k,wx,json,shutil,subprocess
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;dst=O/'led-miso-shift-candidate';cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile((O/'pendant-xe-minimal').with_suffix(ext),dst.with_suffix(ext))
rows=[]
for dx,dy in [(-.05,0),(-.1,0),(-.15,0),(0,-.05),(0,-.1),(-.1,-.1)]:
 b=k.LoadBoard(str(O/'pendant-xe-minimal.kicad_pcb'));v=next(t for t in b.GetTracks() if t.m_Uuid.AsString()=='04cd1f40-0c78-4f3a-bc9d-ffe5c9d268c9');old=v.GetPosition();new=k.VECTOR2I(old.x+round(dx*1e6),old.y+round(dy*1e6))
 for t in b.GetTracks():
  if isinstance(t,k.PCB_VIA) or t.GetNetname()!='/SD_MISO':continue
  if t.GetStart()==old:t.SetStart(new)
  if t.GetEnd()==old:t.SetEnd(new)
 v.SetPosition(new);k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
 subprocess.run([cli,'pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'led-miso-shift-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 r=json.loads((O/'led-miso-shift-drc.json').read_text());ok=not r['violations'] and not r['schematic_parity'] and len(r['unconnected_items'])==15;rows.append({'dx':dx,'dy':dy,'accepted':ok,'violations':r['violations']});print(dx,dy,ok,flush=True)
 if ok:break
(O/'led-miso-shift-review.json').write_text(json.dumps(rows,indent=2)+'\n')
