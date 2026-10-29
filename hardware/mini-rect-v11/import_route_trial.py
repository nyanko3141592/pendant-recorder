from pathlib import Path
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;b=k.LoadBoard(str(P/'pendant-mini-rect-v11.kicad_pcb'))
assert k.ImportSpecctraSES(b,str(P/'route-trial.ses'))
for t in b.GetTracks():
 if not isinstance(t,k.PCB_VIA) and t.GetWidth()<k.FromMM(.1):t.SetWidth(k.FromMM(.1))
k.SaveBoard(str(P/'route-trial.kicad_pcb'),b)
print(len(b.GetTracks()),'tracks/vias, trial only')
