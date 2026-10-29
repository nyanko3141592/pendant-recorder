"""Move the unconnected BAT probe pad near existing copper; validate every candidate."""
import pcbnew as k,wx
app=wx.App(False)
from pathlib import Path
import json,math,shutil,subprocess
O=Path(__file__).resolve().parent;src=O/'pendant-xe-minimal';dst=O/'battery-tp1-front-candidate'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')))
via_positions=[(k.ToMM(t.GetPosition().x),k.ToMM(t.GetPosition().y)) for t in b.GetTracks() if isinstance(t,k.PCB_VIA) and t.GetNetname()=='/BAT']
results=[];accepted=None
for vx,vy in via_positions:
 for angle in range(0,360,45):
  x,y=vx+1.0*math.cos(math.radians(angle)),vy+1.0*math.sin(math.radians(angle))
  if not (1<x<23 and 1<y<26):continue
  b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));f=next(f for f in b.GetFootprints() if f.GetReference()=='TP1');f.Flip(f.GetPosition(),k.FLIP_DIRECTION_LEFT_RIGHT);p=next(iter(f.Pads()));old=p.GetPosition();pos=f.GetPosition()
  target=k.VECTOR2I(k.FromMM(x),k.FromMM(y));f.SetPosition(pos+target-old)
  t=k.PCB_TRACK(b);t.SetStart(target);t.SetEnd(k.VECTOR2I(k.FromMM(vx),k.FromMM(vy)));t.SetLayer(k.F_Cu);t.SetWidth(k.FromMM(.15));t.SetNet(p.GetNet());b.AddNative(t);t.thisown=False
  k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
  subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'battery-tp1-front-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
  r=json.loads((O/'battery-tp1-front-drc.json').read_text());ok=not r['violations'] and not r['schematic_parity'] and len(r['unconnected_items'])==72
  result={'pad_mm':[x,y],'via_mm':[vx,vy],'physical':len(r['violations']),'parity':len(r['schematic_parity']),'unconnected':len(r['unconnected_items']),'accepted':ok};results.append(result);print(result,flush=True)
  if ok:accepted=result;break
 if accepted:break
(O/'battery-tp1-front-review.json').write_text(json.dumps({'accepted':accepted,'trials':results,'scope':'BAT test pad moved with 1 mm F.Cu branch; fixture access and enclosure clearance still require mechanical qualification'},indent=2)+'\n')
