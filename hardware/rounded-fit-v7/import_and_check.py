from pathlib import Path
import wx,json
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;fn=P/'pendant-compact-100-v5.kicad_pcb';b=k.LoadBoard(str(fn))
for t in list(b.GetTracks()):b.Delete(t)
assert k.ImportSpecctraSES(b,str(P/'route.ses'))
for t in b.GetTracks():
 if not isinstance(t,k.PCB_VIA) and t.GetWidth()<k.FromMM(.1):t.SetWidth(k.FromMM(.1))
k.SaveBoard(str(fn),b)
print('Imported',len(list(b.GetTracks())),'tracks/vias')
