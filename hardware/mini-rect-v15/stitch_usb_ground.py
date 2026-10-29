from pathlib import Path
import json,shutil,subprocess
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent;src=P/'usb-stitch-source.kicad_pcb';out=P/'usb-pair-connected.kicad_pcb';b=k.LoadBoard(str(src))
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),out.with_suffix(ext))
def drc():
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out),b);p=out.with_suffix('.drc.json');subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc','--format','json','--output',str(p),str(out)],check=True,stdout=subprocess.DEVNULL);return json.loads(p.read_text())
base=drc();attempts=[]
for x,y in [(14,16),(14,16.5),(13.5,16.5)]+[(x/2,y/2) for x in range(25,33) for y in range(30,38)]:
 t=k.PCB_VIA(b);t.SetPosition(k.VECTOR2I(k.FromMM(x),k.FromMM(y)));t.SetWidth(k.FromMM(.45));t.SetDrill(k.FromMM(.2));t.SetViaType(k.VIATYPE_THROUGH);t.SetLayerPair(k.F_Cu,k.B_Cu);t.SetNet(b.FindNet('/GND'));b.Add(t)
 r=drc();ok=not r['violations'] and len(r['unconnected_items'])<len(base['unconnected_items']);attempts.append(dict(x=x,y=y,violations=len(r['violations']),unconnected=len(r['unconnected_items']),accepted=ok));print(attempts[-1],flush=True)
 if ok:break
 b.DeleteNative(t)
else:r=drc()
(P/'usb-ground-stitch-review.json').write_text(json.dumps({'status':'NOT_RELEASED','attempts':attempts},indent=2)+'\n')
