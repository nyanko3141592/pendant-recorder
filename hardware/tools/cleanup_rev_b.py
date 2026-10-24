#!/usr/bin/env python3
"""Reviewed cleanup after candidate stitching; does not bypass any DRC checks."""
import math
from pathlib import Path
import pcbnew as p
P=Path(__file__).resolve().parents[1]/'rev-b/pendant-rev-b.kicad_pcb';b=p.LoadBoard(str(P));g=b.FindNet('GND').GetNetCode();mm=p.FromMM
for t in list(b.GetTracks()):
 if t.GetClass()!='PCB_VIA':continue
 x,y=p.ToMM(t.GetPosition().x),p.ToMM(t.GetPosition().y)
 if (t.GetNetname()=='GND' and math.hypot(x-110.4,y-105.2)<.01) or (t.GetNetname()=='USB_DM_MCU' and math.hypot(x-116.555,y-115.995)<.01):b.RemoveNative(t)
x,y=115.042106,116.5505
if not any(t.GetClass()=='PCB_VIA' and math.hypot(p.ToMM(t.GetPosition().x)-x,p.ToMM(t.GetPosition().y)-y)<.01 for t in b.GetTracks()):
 v=p.PCB_VIA(b);v.SetPosition(p.VECTOR2I(mm(x),mm(y)));v.SetWidth(mm(.6));v.SetDrill(mm(.3));v.SetLayerPair(p.F_Cu,p.B_Cu);v.SetViaType(p.VIATYPE_THROUGH);v.SetNetCode(g);b.Add(v)
p.ZONE_FILLER(b).Fill(b.Zones());p.SaveBoard(str(P),b)
