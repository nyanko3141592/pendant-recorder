from pathlib import Path
import wx,json,subprocess,shutil
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;fn=P/'pendant-compact-100-v5.kicad_pcb';b=k.LoadBoard(str(fn));cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
for turn in range(30):
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(fn),b);shutil.copyfile(P.parent/'compact-100-v5'/fn.with_suffix('.kicad_pro').name,fn.with_suffix('.kicad_pro'))
 subprocess.run([cli,'pcb','drc',str(fn),'--format','json','--schematic-parity','-o',str(P/'drc.json')],stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 d=json.load(open(P/'drc.json'));bad={i['uuid'] for v in d['violations'] if v['type'] in ['track_dangling','via_dangling'] for i in v['items']}
 print(turn,len(d['violations']),len(d['unconnected_items']),len(bad),flush=True)
 if not bad:break
 for t in list(b.GetTracks()):
  if t.m_Uuid.AsString() in bad:b.Delete(t)
