from pathlib import Path
import json,shutil,subprocess,pcbnew as k,wx
app=wx.App(False);D=Path(__file__).resolve().parent/'tps22950-placement';src='out-routed';dst='local-resistor'
for ext in ['kicad_sch','kicad_pro','kicad_dru']:shutil.copyfile(D/(src+'.'+ext),D/(dst+'.'+ext))
b=k.LoadBoard(str(D/(src+'.kicad_pcb')))
for t in list(b.GetTracks()):
 if t.GetNetname()=='/USB_ILIM_SET':b.RemoveNative(t)
f=next(f for f in b.GetFootprints()if f.GetReference()=='R44');f.SetPosition(k.VECTOR2I(k.FromMM(16.15),k.FromMM(.85)))
paths=[('/USB_ILIM_SET',[(14.95,1.05),(15.64,.85)]),('/GND',[(16.66,.85),(17.3025,1.029999)])]
for net,path in paths:
 for a,c in zip(path,path[1:]):
  t=k.PCB_TRACK(b);t.SetStart(k.VECTOR2I(k.FromMM(a[0]),k.FromMM(a[1])));t.SetEnd(k.VECTOR2I(k.FromMM(c[0]),k.FromMM(c[1])));t.SetWidth(k.FromMM(.15));t.SetLayer(k.F_Cu);t.SetNet(b.FindNet(net));b.AddNative(t);t.thisown=False
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(D/(dst+'.kicad_pcb')),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(D/(dst+'.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(D/(dst+'-drc.json'))],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
x=json.loads((D/(dst+'-drc.json')).read_text());print({a:len(x[a])for a in ['violations','unconnected_items','schematic_parity']})
for v in x['violations']:print(v['type'],[(i['description'],i['pos'])for i in v['items']])
