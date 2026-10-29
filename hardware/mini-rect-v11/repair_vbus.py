from pathlib import Path
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;b=k.LoadBoard(str(P/'route-trial.kicad_pcb'))
# Shift connected endpoints together; preserve nets and track widths.
for old,new in [((15.9319,8.2142),(15.9319,8.1842)),((15.8019,7.87),(15.8019,7.84)),((16.8682,7.87),(16.8682,7.84))]:
 a=k.VECTOR2I(k.FromMM(old[0]),k.FromMM(old[1]));z=k.VECTOR2I(k.FromMM(new[0]),k.FromMM(new[1]))
 for t in b.GetTracks():
  if isinstance(t,k.PCB_VIA):
   if (t.GetPosition()-a).EuclideanNorm()<k.FromMM(.0002):t.SetPosition(z)
  else:
   if (t.GetStart()-a).EuclideanNorm()<k.FromMM(.0002):t.SetStart(z)
   if (t.GetEnd()-a).EuclideanNorm()<k.FromMM(.0002):t.SetEnd(z)
k.SaveBoard(str(P/'route-trial.kicad_pcb'),b)
