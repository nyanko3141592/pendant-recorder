from pathlib import Path
import wx,json,shutil,subprocess
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;name='lse-via-probe'
b=k.LoadBoard(str(P/'usb-lse-repair.kicad_pcb'))
d=json.loads((P/'usb-lse-repair-drc.json').read_text());ids={i['uuid'] for v in d['violations'] if v['type'] in ['track_dangling','via_dangling'] for i in v['items']}
for t in list(b.GetTracks()):
 if t.m_Uuid.AsString() in ids:b.DeleteNative(t)
for f in b.GetFootprints():
 if f.GetReference()!='U1':continue
 for p in f.Pads():
  if p.GetNetname() not in ['/LSE_IN']:continue
  v=k.PCB_VIA(b);v.SetPosition(p.GetPosition());v.SetWidth(k.FromMM(.35));v.SetDrill(k.FromMM(.15));v.SetViaType(k.VIATYPE_THROUGH);v.SetLayerPair(k.F_Cu,k.B_Cu);v.SetNetCode(p.GetNetCode());b.Add(v)
shutil.copy2(P/'usb-lse-repair.kicad_pro',P/(name+'.kicad_pro'))
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(P/(name+'.kicad_pcb')),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(P/(name+'.kicad_pcb')),'--format','json','-o',str(P/(name+'.json'))],check=True)
