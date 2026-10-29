"""Search a local connected via displacement, accept only full DRC improvement."""
from pathlib import Path
import json,subprocess
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;source=P/'route-trial.kicad_pcb';cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
original=source.read_bytes();old=(15.9319,8.2142)
for dx,dy in [(x,y) for y in [-.015,-.02,-.025,-.03] for x in [.02,.04,.06,-.02,-.04]]:
 b=k.LoadBoard(str(source));a=k.VECTOR2I(k.FromMM(old[0]),k.FromMM(old[1]));z=k.VECTOR2I(k.FromMM(old[0]+dx),k.FromMM(old[1]+dy))
 for t in b.GetTracks():
  if isinstance(t,k.PCB_VIA):
   if (t.GetPosition()-a).EuclideanNorm()<k.FromMM(.0002):t.SetPosition(z)
  else:
   if (t.GetStart()-a).EuclideanNorm()<k.FromMM(.0002):t.SetStart(z)
   if (t.GetEnd()-a).EuclideanNorm()<k.FromMM(.0002):t.SetEnd(z)
 test=P/'via-search.kicad_pcb';k.SaveBoard(str(test),b)
 (P/'via-search.kicad_pro').write_bytes((P/'route-trial.kicad_pro').read_bytes())
 subprocess.run([cli,'pcb','drc','--format','json','-o',str(P/'via-search-drc.json'),str(test)],stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL,check=True)
 d=json.loads((P/'via-search-drc.json').read_text());print(dx,dy,len(d['violations']),len(d['unconnected_items']),flush=True)
 if not d['violations'] and not d['unconnected_items']:
  assert source.read_bytes()==original
  source.write_bytes(test.read_bytes());(P/'route-trial-drc.json').write_bytes((P/'via-search-drc.json').read_bytes());break
else:print('No acceptable local displacement; original preserved')
