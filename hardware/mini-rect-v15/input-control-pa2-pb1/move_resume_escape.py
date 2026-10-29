from pathlib import Path
import json,shutil,subprocess
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent;src=P/'ground-island-routes.kicad_pcb';out=P/'resume-escape-space.kicad_pcb';results=[]
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),out.with_suffix(ext))
for dx in [.05,.075,.1,.025,-.05]:
 b=k.LoadBoard(str(src));v=next(t for t in b.GetTracks() if isinstance(t,k.PCB_VIA) and t.GetNetname()=='/CHG_ALLOW' and abs(k.ToMM(t.GetPosition().x)-12.8422)<.0001 and abs(k.ToMM(t.GetPosition().y)-3.6978)<.0001);a=v.GetPosition();z=k.VECTOR2I(a.x+k.FromMM(dx),a.y);v.SetPosition(z)
 for t in b.GetTracks():
  if isinstance(t,k.PCB_VIA) or t.GetNetname()!='/CHG_ALLOW':continue
  if t.GetStart()==a:t.SetStart(z)
  if t.GetEnd()==a:t.SetEnd(z)
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out),b);report=out.with_suffix('.drc.json');subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(out),'-o',str(report),'--format','json'],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL);r=json.loads(report.read_text());ok=not r['violations'] and len(r['unconnected_items'])<=5;entry=dict(dx=dx,accepted=ok,violations=len(r['violations']),remaining=len(r['unconnected_items']));results.append(entry);print(entry,flush=True)
 if ok:break
(P/'resume-escape-space-review.json').write_text(json.dumps(results,indent=2)+'\n')
