from pathlib import Path
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;b=k.LoadBoard(str(P/'critical-first.kicad_pcb'))
for t in b.GetTracks():t.SetLocked(True)
k.SaveBoard(str(P/'critical-first.kicad_pcb'),b)
assert k.ExportSpecctraDSN(b,str(P/'critical-first.dsn'))
f=P/'critical-first.dsn';f.write_text(f.read_text().replace('(circuit\n','(circuit\n        (use_layer F.Cu In2.Cu B.Cu)\n'))
