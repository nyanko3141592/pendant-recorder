#!/usr/bin/env python3
"""Route the right-edge TPS22917 candidate without touching the canonical PCB."""
from pathlib import Path
import os
import math
import pcbnew as k

ROOT = Path(__file__).resolve().parent
BOARD = ROOT / "u10-sot23-candidate" / "pendant-xe-minimal.kicad_pcb"

def mm(v): return int(round(v * 1_000_000))
def pt(x, y): return k.VECTOR2I(mm(x), mm(y))

b = k.LoadBoard(str(BOARD))
nets = {n.GetNetname(): n for n in b.GetNetInfo().NetsByName().values()}

# Delete two obsolete V3V3 remnants left by moving C1/C4 from the old BGA
# cluster.  Both are reported dangling after the new trunk is complete.
for item in list(b.Tracks()):
    if item.GetNetname() != "/V3V3":
        continue
    if isinstance(item, k.PCB_VIA):
        p = item.GetPosition()
        if p.x == mm(22.0) and p.y == mm(6.0):
            b.Remove(item)
    elif item.GetLayer() == k.B_Cu:
        a, z = item.GetStart(), item.GetEnd()
        if math.hypot(a.x / 1e6 - 19.6025, a.y / 1e6 - 2.83) < .01 and math.hypot(z.x / 1e6 - 20.15, z.y / 1e6 - 2.9) < .01:
            b.Remove(item)
        elif math.hypot(a.x / 1e6 - 19.6025, a.y / 1e6 - 2.83) < .01 and math.hypot(z.x / 1e6 - 21.6, z.y / 1e6 - 3.6) < .01:
            b.Remove(item)
    if not isinstance(item, k.PCB_VIA) and item.GetLayer() == k.In4_Cu:
        a, z = item.GetStart(), item.GetEnd()
        if min(math.hypot(a.x / 1e6 - 22.0, a.y / 1e6 - 6.0), math.hypot(z.x / 1e6 - 22.0, z.y / 1e6 - 6.0)) < .01:
            b.Remove(item)

def add_track(net, layer, points, width=0.15):
    for a, z in zip(points, points[1:]):
        track = k.PCB_TRACK(b)
        track.SetNet(nets[net]); track.SetLayer(layer); track.SetWidth(mm(width))
        track.SetStart(pt(*a)); track.SetEnd(pt(*z)); b.Add(track)

def add_via(net, xy, diameter=0.45, drill=0.20):
    via = k.PCB_VIA(b)
    via.SetNet(nets[net]); via.SetPosition(pt(*xy))
    via.SetWidth(mm(diameter)); via.SetDrill(mm(drill)); via.SetLayerPair(k.F_Cu, k.B_Cu)
    b.Add(via)

# V3V3 trunk and surface fanout.  No via is placed in an SMD pad.
add_via("/V3V3", (26.80, 4.50))
add_track("/V3V3", k.In4_Cu, [(22.40, 2.60), (24.20, 4.00), (26.80, 4.50)], .20)
add_track("/V3V3", k.F_Cu, [(26.80, 4.50), (26.80, 6.80), (26.275, 7.50)], .20)
add_track("/V3V3", k.F_Cu, [(26.80, 4.50), (27.00, 3.50), (27.00, 1.00), (25.30, 1.48)], .20)
add_track("/V3V3", k.B_Cu, [(26.80, 4.50), (26.15, 3.6375)], .20)
add_track("/V3V3", k.B_Cu, [(26.80, 4.50), (27.00, 5.50), (25.80, 6.50), (23.80, 6.68)], .20)

# Ground for the switch and moved capacitors.
add_via("/GND", (24.70, 5.80))
add_track("/GND", k.B_Cu, [(24.25, 3.6375), (24.25, 5.35), (24.70, 5.80)], .20)
add_track("/GND", k.F_Cu, [(24.70, 5.80), (24.725, 7.50)], .20)
add_track("/GND", k.B_Cu, [(24.70, 5.80), (23.80, 5.72)], .20)
add_track("/GND", k.B_Cu, [(23.80, 5.72), (23.18, 6.19)], .20)
add_track("/GND", k.F_Cu, [(23.38, 1.055), (23.80, 1.30), (24.20, 1.30), (24.20, 0.52), (25.30, 0.52)], .20)

# SD output rail: short bottom escape, then In2 back to its existing trunk.
add_track("/SD_V3", k.B_Cu, [(26.15, 1.3625), (25.20, 1.3625), (26.60, 2.00), (26.60, 2.40), (24.00, 2.40), (22.50, 3.60), (21.50, 3.10)], .20)

# Enable: escape below the package and join the existing In4 control route.
add_via("/SD_EN", (25.20, 4.80))
add_track("/SD_EN", k.B_Cu, [(25.20, 3.6375), (25.20, 4.80)], .15)
add_track("/SD_EN", k.In1_Cu, [(21.50, 2.40), (22.15, 2.35), (25.20, 4.80)], .15)

k.SaveBoard(str(BOARD), b)
os._exit(0)
