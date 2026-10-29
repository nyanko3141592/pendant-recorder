from pathlib import Path
import wx,json,shutil,subprocess
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;name='pofv-connected'
shutil.copy2(P/'pofv-clean.kicad_pro',P/(name+'.kicad_pro'))
b=k.LoadBoard(str(P/'pofv-clean.kicad_pcb'))
d=json.loads((P/'pofv-clean-drc.json').read_text())
for n in range(30):
 ids={i['uuid'] for v in d['violations'] if v['type'] in ['track_dangling','via_dangling'] for i in v['items']}
 if not ids:break
 for t in list(b.GetTracks()):
  if t.m_Uuid.AsString() in ids:b.DeleteNative(t)
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(P/(name+'.kicad_pcb')),b)
 subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(P/(name+'.kicad_pcb')),'--format','json','-o',str(P/(name+'-drc.json'))],check=True,stdout=subprocess.DEVNULL)
 d=json.loads((P/(name+'-drc.json')).read_text());print(n,len(d['violations']),len(d['unconnected_items']),flush=True)
 if d['unconnected_items']:raise RuntimeError('Pruning produced gap: candidate not accepted')
