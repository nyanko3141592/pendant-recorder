"""Import corrected DSN candidate without overwriting released/baseline boards."""
from pathlib import Path
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent
b=k.LoadBoard(str(P/'plane6-trial.kicad_pcb'))
assert k.ImportSpecctraSES(b,str(P/'plane6-fixedvia.ses'))
for t in b.GetTracks():
 if not isinstance(t,k.PCB_VIA) and t.GetWidth()<k.FromMM(.1):
  t.SetWidth(k.FromMM(.1))
k.ZONE_FILLER(b).Fill(b.Zones())
k.SaveBoard(str(P/'plane6-fixedvia.kicad_pcb'),b)
print(len(b.GetTracks()),'tracks/vias; candidate only, DRC/review required')
