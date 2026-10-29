"""Add close GND transition vias only when unchanged rules pass."""
from pathlib import Path
import json,subprocess,shutil
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent;src=P/'usb-pair-connected.kicad_pcb';out=P/'usb-return-candidate.kicad_pcb';b=k.LoadBoard(str(src))
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),out.with_suffix(ext))
def drc():
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out),b);p=out.with_suffix('.drc.json');subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc','--format','json','--output',str(p),str(out)],check=True,stdout=subprocess.DEVNULL);return json.loads(p.read_text())
rows=[]
for group,coords in [('connector',[(9.4,22.4),(11.4,22.4),(9.5,22.4)]),('MCU',[(16.9,8.4),(16.8,8.1),(17,8),(16.7,7.9),(16.9,7.9)])]:
 for x,y in coords:
  t=k.PCB_VIA(b);t.SetPosition(k.VECTOR2I(k.FromMM(x),k.FromMM(y)));t.SetWidth(k.FromMM(.45));t.SetDrill(k.FromMM(.2));t.SetViaType(k.VIATYPE_THROUGH);t.SetLayerPair(k.F_Cu,k.B_Cu);t.SetNet(b.FindNet('/GND'));b.Add(t)
  r=drc();ok=not r['violations'] and not r['unconnected_items'];rows.append(dict(group=group,x=x,y=y,accepted=ok,violations=len(r['violations']),unconnected=len(r['unconnected_items'])))
  if ok:break
  b.DeleteNative(t)
r=drc();(P/'usb-return-via-review.json').write_text(json.dumps({'status':'GEOMETRY_PASS_NOT_SI_APPROVAL','attempts':rows,'final_drc':len(r['violations']),'final_unconnected':len(r['unconnected_items'])},indent=2)+'\n');print(rows)
