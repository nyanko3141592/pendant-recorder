from pathlib import Path
import json,subprocess
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parents[1]/'charge-guard-v4';board=P/'pendant-charge-guard-v4.kicad_pcb';cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
b=k.LoadBoard(str(board))
for t in list(b.GetTracks()):b.Delete(t)
assert k.ImportSpecctraSES(b,str(P/'route.ses'))
for t in b.GetTracks():
 if not isinstance(t,k.PCB_VIA) and t.GetWidth()<k.FromMM(.1):t.SetWidth(k.FromMM(.1))
def drc():
 k.SaveBoard(str(board),b)
 subprocess.run([cli,'pcb','drc',str(board),'--format','json','--schematic-parity','-o',str(P/'drc.json')],check=True)
 return json.loads((P/'drc.json').read_text())
x=drc();bad={i['uuid'] for v in x['violations'] if v['type']=='via_dangling' for i in v['items']}
for t in list(b.GetTracks()):
 if isinstance(t,k.PCB_VIA) and t.m_Uuid.AsString() in bad:b.Delete(t)
drc()
