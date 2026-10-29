from pathlib import Path
import pcbnew as k,wx,subprocess,json,shutil
app=wx.App(False);O=Path(__file__).resolve().parent/'top-led-trial';src=O/'pendant-xe-minimal';dst=O/'pad-via-screen'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')))
f=next(f for f in b.GetFootprints()if f.GetReference()=='D6')
for p in f.Pads():
 v=k.PCB_VIA(b);v.SetPosition(p.GetPosition());v.SetWidth(k.FromMM(.35));v.SetDrill(k.FromMM(.15));v.SetViaType(k.VIATYPE_THROUGH);v.SetLayerPair(k.F_Cu,k.B_Cu);v.SetNet(p.GetNet());b.AddNative(v);v.thisown=False
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'pad-via-screen-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
j=json.loads((O/'pad-via-screen-drc.json').read_text());print([(v['type'],[(i['description'],i['pos'])for i in v['items']])for v in j['violations']])
