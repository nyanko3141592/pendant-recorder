from pathlib import Path
import json,shutil,subprocess,os,pcbnew as k,wx
app=wx.App(False);D=Path(__file__).resolve().parent/'tps22950-placement';src='out-routed';dst='ilim-via'
for ext in ['kicad_pro','kicad_sch','kicad_dru']:shutil.copyfile(D/(src+'.'+ext),D/(dst+'.'+ext))
b=k.LoadBoard(str(D/(src+'.kicad_pcb')));net=b.FindNet('/USB_ILIM_SET')
v=k.PCB_VIA(b);v.SetPosition(k.VECTOR2I(k.FromMM(float(os.environ.get("TPS_VIA_X","14.95"))),k.FromMM(.75)));v.SetWidth(k.FromMM(.4));v.SetDrill(k.FromMM(.2));v.SetViaType(k.VIATYPE_THROUGH);v.SetLayerPair(k.F_Cu,k.B_Cu);v.SetNet(net);b.AddNative(v);v.thisown=False
t=k.PCB_TRACK(b);t.SetStart(k.VECTOR2I(k.FromMM(14.95),k.FromMM(1.05)));t.SetEnd(v.GetPosition());t.SetWidth(k.FromMM(.15));t.SetLayer(k.F_Cu);t.SetNet(net);b.AddNative(t);t.thisown=False
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(D/(dst+'.kicad_pcb')),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(D/(dst+'.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(D/(dst+'-drc.json'))],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
x=json.loads((D/(dst+'-drc.json')).read_text());print({a:len(x[a])for a in ['violations','unconnected_items','schematic_parity']});print([v['type']for v in x['violations']])
