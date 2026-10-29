from pathlib import Path
import json,shutil,subprocess,pcbnew as k,wx
app=wx.App(False);D=Path(__file__).resolve().parent/'tps22950-placement';src='resistor-best';dst='near-resistor'
for ext in ['kicad_pro','kicad_sch','kicad_dru']:shutil.copyfile(D/(src+'.'+ext),D/(dst+'.'+ext))
b=k.LoadBoard(str(D/(src+'.kicad_pcb')));f=next(f for f in b.GetFootprints()if f.GetReference()=='R44');f.SetOrientationDegrees(0);f.SetPosition(k.VECTOR2I(k.FromMM(16.4),k.FromMM(.9)))
v=next(t for t in b.GetTracks()if isinstance(t,k.PCB_VIA) and t.GetNetname()=='/CHG_ALLOW' and abs(k.ToMM(t.GetPosition().x)-16.826043)<.00001);old=v.GetPosition();new=k.VECTOR2I(old.x,k.FromMM(1.5))
for t in b.GetTracks():
 if not isinstance(t,k.PCB_VIA) and t.GetNetname()==v.GetNetname():
  if t.GetStart()==old:t.SetStart(new)
  if t.GetEnd()==old:t.SetEnd(new)
v.SetPosition(new)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(D/(dst+'.kicad_pcb')),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(D/(dst+'.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(D/(dst+'-drc.json'))],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
x=json.loads((D/(dst+'-drc.json')).read_text());print({a:len(x[a])for a in ['violations','unconnected_items','schematic_parity']})
for v in x['violations']:print(v['type'],[(i['description'],i['pos'])for i in v['items']])
