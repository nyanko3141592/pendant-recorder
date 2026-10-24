#!/usr/bin/env python3
"""Export router input or import a trial. Routing success is NOT manufacturing release."""
from pathlib import Path
import sys
import pcbnew as p
out=Path(__file__).resolve().parents[1]/'rev-b';b=p.LoadBoard(str(out/'pendant-rev-b.kicad_pcb'))
if sys.argv[1]=='export':
 n=b.GetDesignSettings().m_NetSettings.GetDefaultNetclass();n.SetClearance(p.FromMM(.15));n.SetTrackWidth(p.FromMM(.15))
 # Continuous inner reference plane; the router must preserve antenna keepouts.
 if not any(not z.GetIsRuleArea() for z in b.Zones()):
  z=p.ZONE(b);z.SetLayer(p.In1_Cu);z.SetNetCode(b.FindNet('GND').GetNetCode());z.SetLocalClearance(p.FromMM(.2));z.SetPadConnection(p.ZONE_CONNECTION_FULL)
  o=z.Outline();o.NewOutline()
  for x,y in [(100.3,104.8),(121.7,104.8),(121.7,143.2),(100.3,143.2)]:o.Append(p.FromMM(x),p.FromMM(y))
  b.Add(z)
 p.ZONE_FILLER(b).Fill(b.Zones());p.SaveBoard(str(out/'pendant-rev-b.kicad_pcb'),b)
 assert p.ExportSpecctraDSN(b,str(out/'routing/input.dsn'))
elif sys.argv[1]=='import':
 assert p.ImportSpecctraSES(b,str(out/'routing/trial.ses'))
 p.ZONE_FILLER(b).Fill(b.Zones());p.SaveBoard(str(out/'pendant-rev-b.kicad_pcb'),b)
else:raise ValueError('export or import required')
print('Track/via objects:',len(b.GetTracks()))
