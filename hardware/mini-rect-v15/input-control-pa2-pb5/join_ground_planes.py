from pathlib import Path
import json,shutil,subprocess
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent;src=P/'mcu-reconnected.kicad_pcb';out=P/'ground-planes-joined.kicad_pcb';attempts=[]
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),out.with_suffix(ext))
for layer,a,z in [(k.In1_Cu,(20.3,20),(21,20)),(k.In3_Cu,(20.3,20),(21,20)),(k.In1_Cu,(20.3,10),(21,10)),(k.In1_Cu,(10,23.8),(10,24.3))]:
 b=k.LoadBoard(str(src));t=k.PCB_TRACK(b);t.SetStart(k.VECTOR2I(k.FromMM(a[0]),k.FromMM(a[1])));t.SetEnd(k.VECTOR2I(k.FromMM(z[0]),k.FromMM(z[1])));t.SetWidth(k.FromMM(.25));t.SetLayer(layer);t.SetNet(b.FindNet('/GND'));b.Add(t);k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out),b);report=out.with_suffix('.drc.json');subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(out),'-o',str(report),'--format','json'],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL);d=json.loads(report.read_text());ok=not d['violations'] and not d['unconnected_items'];r=dict(layer=b.GetLayerName(layer),start=a,end=z,accepted=ok,violations=len(d['violations']),remaining=len(d['unconnected_items']));attempts.append(r);print(r,flush=True)
 if ok:break
(P/'ground-planes-joined-review.json').write_text(json.dumps(attempts,indent=2)+'\n')
