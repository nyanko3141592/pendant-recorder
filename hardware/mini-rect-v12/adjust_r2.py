from pathlib import Path
import shutil
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent
shutil.copy2(P/'route-repair.kicad_pro',P/'placement-fix.kicad_pro')
b=k.LoadBoard(str(P/'route-repair.kicad_pcb'))
r=next(f for f in b.GetFootprints() if f.GetReference()=='R2')
r.Move(k.VECTOR2I(0,k.FromMM(-1)))
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(P/'placement-fix.kicad_pcb'),b)
