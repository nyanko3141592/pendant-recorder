import pcbnew as k,wx
app=wx.App(False)
import json,shutil,subprocess,math
from pathlib import Path
O=Path(__file__).resolve().parent;src=O/'pendant-xe-minimal';dst=O/'c13-short-ground-candidate'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
rows=[]
for delta in [180,90,270]:
 b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')))
 for t in list(b.GetTracks()):
  if t.m_Uuid.AsString() in ['26d13b35-2afb-46ac-80f3-19134ec87a88','2a800260-58ef-4d26-90d1-c903e88343b1','30aa3d77-32f9-4934-93fb-405cc17d0839','b6f38fe1-8eda-488b-a7fa-481b645603e7']:b.RemoveNative(t)
 f=next(f for f in b.GetFootprints() if f.GetReference()=='C13');p=next(p for p in f.Pads() if p.GetNumber()=='1');old=p.GetPosition();f.SetOrientationDegrees(f.GetOrientationDegrees()+delta);f.Move(old-p.GetPosition());g=next(p for p in f.Pads() if p.GetNumber()=='2');a=g.GetPosition()
 vias=sorted((t for t in b.GetTracks() if isinstance(t,k.PCB_VIA) and t.GetNetname()=='/GND'),key=lambda v:math.hypot(v.GetPosition().x-a.x,v.GetPosition().y-a.y))[:4]
 for v in vias:
  t=k.PCB_TRACK(b);t.SetStart(a);t.SetEnd(v.GetPosition());t.SetLayer(k.B_Cu);t.SetWidth(k.FromMM(.25));t.SetNet(g.GetNet());b.AddNative(t);t.thisown=False
  k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
  subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'c13-short-ground-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
  r=json.loads((O/'c13-short-ground-drc.json').read_text());ok=not r['violations'] and not r['schematic_parity'] and len(r['unconnected_items'])==35
  rows.append({'delta':delta,'ground_mm':[k.ToMM(a.x),k.ToMM(a.y)],'via_mm':[k.ToMM(v.GetPosition().x),k.ToMM(v.GetPosition().y)],'length_mm':k.ToMM(t.GetLength()),'accepted':ok,'violations':r['violations']});print(delta,ok,len(r['violations']),flush=True)
  if ok:break
  b.RemoveNative(t)
 if rows[-1]['accepted']:break
(O/'c13-short-ground-review.json').write_text(json.dumps(rows,indent=2)+'\n')
