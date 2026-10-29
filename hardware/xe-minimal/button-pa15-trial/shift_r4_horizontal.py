import pcbnew as k,wx,json,shutil,subprocess
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;src=O/'pa15-switch-layer-candidate';dst=O/'pa15-r4-horizontal-candidate';out=[]
for ext in ['.kicad_sch','.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
for shift in [.3,.4,.5,.6]:
 angle=0
 b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));f=next(f for f in b.GetFootprints() if f.GetReference()=='R4');p=next(p for p in f.Pads() if p.GetNumber()=='1');old=p.GetPosition();f.SetOrientationDegrees(angle);f.Move(old-p.GetPosition());delta=k.VECTOR2I(-round(shift*1e6),0);f.Move(delta)
 for t in b.GetTracks():
  if isinstance(t,k.PCB_VIA) or t.GetLayer()!=k.F_Cu:continue
  if t.GetStart()==old:t.SetStart(old+delta)
  if t.GetEnd()==old:t.SetEnd(old+delta)
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
 subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'pa15-r4-horizontal-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 r=json.loads((O/'pa15-r4-horizontal-drc.json').read_text());ok=not r['violations'] and not r['schematic_parity'] and len(r['unconnected_items'])==26;out.append({'shift_left_mm':shift,'accepted':ok,'violations':r['violations']});print(shift,ok,len(r['violations']),flush=True)
 if ok:break
(O/'pa15-r4-horizontal-review.json').write_text(json.dumps(out,indent=2)+'\n')
