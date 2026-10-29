"""Import corrected DSN candidate without overwriting released/baseline boards."""
from pathlib import Path
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent
import shutil
shutil.copy2(P/'pendant-mini-rect-v12.kicad_pro',P/'route-trial.kicad_pro')
b=k.LoadBoard(str(P/'pendant-mini-rect-v12.kicad_pcb'))
assert k.ImportSpecctraSES(b,str(P/'route-trial.ses'))
for t in b.GetTracks():
 if not isinstance(t,k.PCB_VIA) and t.GetWidth()<k.FromMM(.1):
  t.SetWidth(k.FromMM(.1))
k.ZONE_FILLER(b).Fill(b.Zones())
k.SaveBoard(str(P/'route-trial.kicad_pcb'),b)
print(len(b.GetTracks()),'tracks/vias; candidate only, DRC/review required')
