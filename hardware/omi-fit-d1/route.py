import sys
if '--discard-routing' not in sys.argv:
 raise SystemExit('Historical placement/router utility. Refusing to overwrite routed D1; use an isolated copy or explicitly pass --discard-routing.')
from pathlib import Path
import math,sys
import pcbnew as p
P=Path(__file__).resolve().parent;b=p.LoadBoard(str(P/'omi-fit-d1.kicad_pcb'))
if sys.argv[1]=='export':
 n=b.GetDesignSettings().m_NetSettings.GetDefaultNetclass();n.SetClearance(p.FromMM(.125));n.SetTrackWidth(p.FromMM(.125))
 if not list(b.Zones()):
  z=p.ZONE(b);z.SetLayer(p.In1_Cu);z.SetNetCode(b.FindNet('/GND').GetNetCode());z.SetLocalClearance(p.FromMM(.15));z.SetPadConnection(p.ZONE_CONNECTION_FULL);o=z.Outline();o.NewOutline()
  for i in range(128):
   a=i*2*math.pi/128;o.Append(p.FromMM(100+11.2*math.cos(a)),p.FromMM(100+11.2*math.sin(a)))
  b.Add(z)
 p.ZONE_FILLER(b).Fill(b.Zones());p.SaveBoard(str(P/'omi-fit-d1.kicad_pcb'),b);assert p.ExportSpecctraDSN(b,str(P/'routing/input.dsn'))
else:
 assert p.ImportSpecctraSES(b,str(P/'routing/trial.ses'));p.ZONE_FILLER(b).Fill(b.Zones());p.SaveBoard(str(P/'omi-fit-d1.kicad_pcb'),b)
