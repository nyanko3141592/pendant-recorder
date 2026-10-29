from pathlib import Path
import json,shutil,subprocess
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent;src=P/'u10-reconnected.kicad_pcb';out=P/'mcu-ground-bridge.kicad_pcb'
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),out.with_suffix(ext))
b=k.LoadBoard(str(src));removed=0
for t in list(b.GetTracks()):
 if t.GetNetname()=='/SD_DAT1':b.DeleteNative(t);removed+=1
q=k.VECTOR2I(k.FromMM(9.825),k.FromMM(11.925));net=b.FindNet('/GND');via=k.PCB_VIA(b);via.SetPosition(q);via.SetWidth(k.FromMM(.35));via.SetDrill(k.FromMM(.15));via.SetViaType(k.VIATYPE_THROUGH);via.SetLayerPair(k.F_Cu,k.B_Cu);via.SetNet(net);b.Add(via)
pad=next(p for f in b.GetFootprints() if f.GetReference()=='U1' for p in f.Pads() if p.GetNumber()=='47');t=k.PCB_TRACK(b);t.SetStart(pad.GetPosition());t.SetEnd(q);t.SetWidth(k.FromMM(.1));t.SetLayer(k.B_Cu);t.SetNet(net);b.Add(t)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out),b);report=out.with_suffix('.drc.json');subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(out),'-o',str(report),'--format','json'],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL);d=json.loads(report.read_text());print('removed SD_DAT1',removed,'DRC',len(d['violations']),'remaining',len(d['unconnected_items']));print(json.dumps(d['violations'],ensure_ascii=False))
