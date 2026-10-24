import pcbnew as p
from pathlib import Path
P=Path(__file__).resolve().parents[1];b=p.LoadBoard(str(P/'omi-fit-d1.kicad_pcb'));n=b.GetDesignSettings().m_NetSettings.GetDefaultNetclass();n.SetClearance(p.FromMM(.1));n.SetTrackWidth(p.FromMM(.1));n.SetViaDiameter(p.FromMM(.5));n.SetViaDrill(p.FromMM(.2))
for t in b.GetTracks():
 if isinstance(t,p.PCB_VIA):t.SetWidth(p.FromMM(.5));t.SetDrill(p.FromMM(.2))
 else:t.SetWidth(p.FromMM(.1))
p.ZONE_FILLER(b).Fill(b.Zones());p.SaveBoard(str(P/'routing/refine-base.kicad_pcb'),b);assert p.ExportSpecctraDSN(b,str(P/'routing/refine.dsn'))
