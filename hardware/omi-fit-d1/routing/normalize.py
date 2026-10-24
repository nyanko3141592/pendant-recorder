import pcbnew as p
from pathlib import Path
P=Path(__file__).resolve().parents[1];b=p.LoadBoard(str(P/'omi-fit-d1.kicad_pcb'))
for t in b.GetTracks():
 if not isinstance(t,p.PCB_VIA) and t.GetWidth()<p.FromMM(.1):t.SetWidth(p.FromMM(.1))
p.ZONE_FILLER(b).Fill(b.Zones());p.SaveBoard(str(P/'omi-fit-d1.kicad_pcb'),b)
