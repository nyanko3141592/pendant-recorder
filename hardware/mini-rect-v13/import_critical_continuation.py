from pathlib import Path
import shutil,wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;b=k.LoadBoard(str(P/'critical-first.kicad_pcb'))
assert k.ImportSpecctraSES(b,str(P/'critical-continuation.ses'))
changed=0
for t in b.GetTracks():
 if not isinstance(t,k.PCB_VIA) and t.GetWidth()<k.FromMM(.1):t.SetWidth(k.FromMM(.1));changed+=1
k.ZONE_FILLER(b).Fill(b.Zones())
k.SaveBoard(str(P/'critical-continuation.kicad_pcb'),b)
shutil.copy2(P/'critical-first.kicad_pro',P/'critical-continuation.kicad_pro')
print('Corrected narrow tracks',changed)
