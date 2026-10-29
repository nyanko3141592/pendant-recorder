import pcbnew as k,wx,json,shutil,subprocess
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;src=O/'pendant-xe-minimal';dst=O/'pa3-r13-shift-candidate';out=[]
for ext in ['.kicad_sch','.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
for dx,dy in [(-.5,0),(-.75,0),(-1,0),(-.5,-.5),(-.5,.5)]:
 b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));f=next(f for f in b.GetFootprints() if f.GetReference()=='R13');old={p.GetNumber():p.GetPosition() for p in f.Pads()};delta=k.VECTOR2I(round(dx*1e6),round(dy*1e6));f.Move(delta)
 for t in b.GetTracks():
  if isinstance(t,k.PCB_VIA):continue
  if t.GetLayer()!=k.B_Cu:continue
  if any(t.GetStart()==v for v in old.values()):t.SetStart(t.GetStart()+delta)
  if any(t.GetEnd()==v for v in old.values()):t.SetEnd(t.GetEnd()+delta)
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
 subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'pa3-r13-shift-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 r=json.loads((O/'pa3-r13-shift-drc.json').read_text());ok=not r['violations'] and not r['schematic_parity'] and len(r['unconnected_items'])==27;out.append({'delta':[dx,dy],'accepted':ok,'violations':r['violations']});print(dx,dy,ok,len(r['violations']),flush=True)
 if ok:break
(O/'pa3-r13-shift-review.json').write_text(json.dumps(out,indent=2)+'\n')
