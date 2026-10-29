from pathlib import Path
import shutil,json,subprocess
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;name='local-repair'
shutil.copy2(P/'r2-search-0.kicad_pro',P/(name+'.kicad_pro'))
b=k.LoadBoard(str(P/'r2-search-0.kicad_pcb'))
cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
for iteration in range(30):
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(P/(name+'.kicad_pcb')),b)
 subprocess.run([cli,'pcb','drc',str(P/(name+'.kicad_pcb')),'--format','json','-o',str(P/(name+'-drc.json'))],stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL,check=True)
 d=json.loads((P/(name+'-drc.json')).read_text())
 ids={i['uuid'] for v in d['violations'] if v['type'] in ['track_dangling','via_dangling'] for i in v['items'] if '[/V3V3]' in i['description'] or '[/NRST]' in i['description']}
 if not ids:break
 tracks=list(b.GetTracks())
 for t in tracks:
  if t.m_Uuid.AsString() in ids:b.DeleteNative(t)
 print('pruned obsolete R2 branch',len(ids),flush=True)
