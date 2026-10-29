import pcbnew as k,wx,json,shutil,subprocess
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;src=O/'pendant-xe-minimal';dst=O/'u13-clock-side-candidate'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
results=[]
for dx in [-.3,-.4,-.5,-.6,-.8,.4,.6]:
 b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));f=next(f for f in b.GetFootprints() if f.GetReference()=='U13');old={(p.GetPosition().x,p.GetPosition().y):p.GetNumber() for p in f.Pads()};f.SetPosition(f.GetPosition()+k.VECTOR2I(k.FromMM(dx),0));new={p.GetNumber():p.GetPosition() for p in f.Pads()}
 for t in b.GetTracks():
  if isinstance(t,k.PCB_VIA) or t.GetLayer()!=k.F_Cu:continue
  a,c=t.GetStart(),t.GetEnd()
  if (a.x,a.y) in old:t.SetStart(new[old[(a.x,a.y)]])
  if (c.x,c.y) in old:t.SetEnd(new[old[(c.x,c.y)]])
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
 subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'u13-clock-side-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 r=json.loads((O/'u13-clock-side-drc.json').read_text());ok=not r['violations'] and not r['schematic_parity'] and len(r['unconnected_items'])==62;results.append({'dx':dx,'accepted':ok,'violations':r['violations']});print(dx,len(r['violations']),ok,flush=True)
 if ok:break
(O/'u13-clock-side-review.json').write_text(json.dumps(results,indent=2)+'\n')
