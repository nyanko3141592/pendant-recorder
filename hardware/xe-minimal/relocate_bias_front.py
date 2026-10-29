import pcbnew as k,wx
app=wx.App(False)
from pathlib import Path
import json,shutil,subprocess
O=Path(__file__).resolve().parent;src=O/'pendant-xe-minimal';dst=O/'bias-front-candidate'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
results=[]
for dx,dy in [(0,0),(.5,0),(-.5,0),(0,.5),(0,-.5),(1,0),(-1,0)]:
 for angle in [90,0,180,270]:
  b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));f=next(f for f in b.GetFootprints() if f.GetReference()=='R12');p=next(p for p in f.Pads() if p.GetNumber()=='2');old=k.VECTOR2I(p.GetPosition().x,p.GetPosition().y)
  stub=next(t for t in b.GetTracks() if not isinstance(t,k.PCB_VIA) and t.GetNetname()==p.GetNetname() and (t.GetStart()==old or t.GetEnd()==old));v=stub.GetEnd() if stub.GetStart()==old else stub.GetStart();v=k.VECTOR2I(v.x,v.y);b.RemoveNative(stub)
  f.Flip(f.GetPosition(),k.FLIP_DIRECTION_LEFT_RIGHT);f.SetOrientationDegrees(angle);pos=f.GetPosition();now=p.GetPosition();f.SetPosition(k.VECTOR2I(pos.x+old.x-now.x+k.FromMM(dx),pos.y+old.y-now.y+k.FromMM(dy)))
  t=k.PCB_TRACK(b);t.SetStart(p.GetPosition());t.SetEnd(v);t.SetWidth(k.FromMM(.15));t.SetLayer(k.F_Cu);t.SetNet(p.GetNet());b.AddNative(t);t.thisown=False
  k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
  subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'bias-front-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
  r=json.loads((O/'bias-front-drc.json').read_text());ok=not r['violations'] and not r['schematic_parity'] and len(r['unconnected_items'])==79
  results.append({'offset':[dx,dy],'angle':angle,'accepted':ok,'violations':len(r['violations'])})
  if ok:break
 if ok:break
(O/'bias-front-review.json').write_text(json.dumps(results,indent=2)+'\n');print(results[-1],flush=True)
