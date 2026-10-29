from pathlib import Path
import shutil,wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent
b=k.LoadBoard(str(P/'mic-ground-route.kicad_pcb'))
for t in list(b.GetTracks()):
 if t.GetNetname()!='/GND':b.DeleteNative(t)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(P/'critical-first.kicad_pcb'),b)
shutil.copy2(P/'mic-ground-route.kicad_pro',P/'critical-first.kicad_pro')
