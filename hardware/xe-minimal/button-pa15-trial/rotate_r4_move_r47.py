import pcbnew as k,wx,json,shutil,subprocess
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;src=O/'pa15-switch-layer-candidate';dst=O/'pa15-r4-r47-candidate';out=[]
for ext in ['.kicad_sch','.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
for dx,dy in [(0,1),(0,1.5),(-1,1),(-1.5,0),(-2,0),(0,2),(0,2.5)]:
 b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));fps={f.GetReference():f for f in b.GetFootprints()};f=fps['R4'];p=next(p for p in f.Pads() if p.GetNumber()=='1');old=p.GetPosition();f.SetOrientationDegrees(270);f.Move(old-p.GetPosition())
 f=fps['R47'];oldpads=[p.GetPosition() for p in f.Pads()];delta=k.VECTOR2I(round(dx*1e6),round(dy*1e6));f.Move(delta)
 for t in b.GetTracks():
  if isinstance(t,k.PCB_VIA) or t.GetLayer()!=k.F_Cu:continue
  if any(t.GetStart()==p for p in oldpads):t.SetStart(t.GetStart()+delta)
  if any(t.GetEnd()==p for p in oldpads):t.SetEnd(t.GetEnd()+delta)
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
 subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'pa15-r4-r47-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 r=json.loads((O/'pa15-r4-r47-drc.json').read_text());ok=not r['violations'] and not r['schematic_parity'] and len(r['unconnected_items'])==26;out.append({'r47_delta':[dx,dy],'accepted':ok,'violations':r['violations']});print(dx,dy,ok,len(r['violations']),flush=True)
 if ok:break
(O/'pa15-r4-r47-review.json').write_text(json.dumps(out,indent=2)+'\n')
