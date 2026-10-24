import pcbnew as p,shutil
from pathlib import Path
P=Path(__file__).resolve().parent
b=p.LoadBoard(str(P/'candidate6pre-grid.kicad_pcb'))
for tr in b.GetTracks():tr.SetLocked(True)
p.SaveBoard(str(P/'candidate6pre-grid.kicad_pcb'),b)
for e in ['kicad_sch','kicad_pro']:shutil.copyfile(P/('candidate6pre.'+e),P/('candidate6pre-grid.'+e))
assert p.ExportSpecctraDSN(b,str(P/'candidate6pre-grid.dsn'))
