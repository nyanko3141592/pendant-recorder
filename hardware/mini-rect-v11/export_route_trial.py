from pathlib import Path
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;b=k.LoadBoard(str(P/'pendant-mini-rect-v11.kicad_pcb'))
assert k.ExportSpecctraDSN(b,str(P/'route-trial.dsn'))
p=P/'route-trial.dsn';s=p.read_text().replace('(width 200)','(width 100)').replace('(clearance 200)','(clearance 100)').replace('Via[0-3]_600:300','Via[0-3]_350:150').replace('(circle F.Cu 600)','(circle F.Cu 350)').replace('(circle B.Cu 600)','(circle B.Cu 350)')
p.write_text(s)
