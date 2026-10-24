#!/usr/bin/env python3
"""Deterministic post-route cleanup and ground pours; DRC must still be run."""
import pcbnew as p
from pathlib import Path
out=Path(__file__).resolve().parents[1]/'rev-c';b=p.LoadBoard(str(out/'pendant-rev-c.kicad_pcb'))
for t in list(b.GetTracks()):
 if t.GetNetname().startswith('unconnected-'):b.RemoveNative(t)
 elif t.GetClass()=='PCB_TRACK' and t.GetWidth()<p.FromMM(.1):t.SetWidth(p.FromMM(.1))
for layer in (p.F_Cu,p.B_Cu):
 if any(not z.GetIsRuleArea() and z.GetLayer()==layer for z in b.Zones()):continue
 z=p.ZONE(b);z.SetLayer(layer);z.SetNetCode((b.FindNet('GND') or b.FindNet('/GND')).GetNetCode());z.SetLocalClearance(p.FromMM(.2));z.SetPadConnection(p.ZONE_CONNECTION_FULL)
 o=z.Outline();o.NewOutline()
 for x,y in [(100.3,100.3),(120.7,100.3),(120.7,130.7),(100.3,130.7)]:o.Append(p.FromMM(x),p.FromMM(y))
 b.Add(z)
p.ZONE_FILLER(b).Fill(b.Zones());p.SaveBoard(str(out/'pendant-rev-c.kicad_pcb'),b)
