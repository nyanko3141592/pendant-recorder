from pathlib import Path
import wx,shutil,subprocess,json
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;name='usb-return-trial';b=k.LoadBoard(str(P/'pofv-final-trial.kicad_pcb'))
for ext in ['kicad_pro','kicad_sch']:shutil.copy2(P/('pofv-final-trial.'+ext),P/(name+'.'+ext))
v=k.PCB_VIA(b);v.SetPosition(k.VECTOR2I(k.FromMM(11.65),k.FromMM(16.45)));v.SetWidth(k.FromMM(.4));v.SetDrill(k.FromMM(.2));v.SetViaType(k.VIATYPE_THROUGH);v.SetLayerPair(k.F_Cu,k.B_Cu);v.SetNetCode(b.FindNet('/GND').GetNetCode());b.Add(v)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(P/(name+'.kicad_pcb')),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(P/(name+'.kicad_pcb')),'--schematic-parity','--format','json','-o',str(P/(name+'-drc.json'))],check=True)
d=json.loads((P/(name+'-drc.json')).read_text());print([(v['type'],v['description']) for v in d['violations']]);print('unconnected',len(d['unconnected_items']))
