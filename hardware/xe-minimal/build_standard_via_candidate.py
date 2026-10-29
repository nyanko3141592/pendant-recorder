"""Move the four remaining hole-over-pad vias to ordinary dogbone positions."""
from __future__ import annotations

from pathlib import Path

import pcbnew as k
import wx


app = wx.App(False)
here = Path(__file__).resolve().parent
source = here / "pendant-xe-minimal.kicad_pcb"
output = here / "standard-via-candidate.kicad_pcb"
board = k.LoadBoard(str(source))

# Positions were selected outward from the relevant component body/pad row.
# Every attached segment endpoint follows the via, preserving its prior layer
# and net. V3V3 was a direct via-in-pad with no B.Cu dogbone, so add one.
moves_mm = {
    "58d8777e-5726-406c-9002-92c3cbdf22de": (21.05, 10.60),  # U1.36 V3V3
    "d5f838d5-49c4-4b63-814d-c51369fbaf3e": (18.10, 11.85),  # U1.40 PDM_DATA
    "c2faa17a-0df5-46e8-b7e0-a5c8f86431a4": (12.70, 5.95),  # U1.10 VBUS_N
    "cd6f76be-442e-464d-affc-2baf7a4eb158": (22.05, 15.20),  # U3.9 CHG_N
}

vias = {
    item.m_Uuid.AsString(): item
    for item in board.GetTracks()
    if isinstance(item, k.PCB_VIA)
}
assert set(moves_mm) <= set(vias)

for uuid, destination_mm in moves_mm.items():
    via = vias[uuid]
    old = via.GetPosition()
    new = k.VECTOR2I(k.FromMM(destination_mm[0]), k.FromMM(destination_mm[1]))
    attached = []
    for track in board.GetTracks():
        if isinstance(track, k.PCB_TRACK) and not isinstance(track, k.PCB_VIA):
            if track.GetNetCode() != via.GetNetCode():
                continue
            if track.GetStart() == old:
                track.SetStart(new)
                attached.append(track)
            if track.GetEnd() == old:
                track.SetEnd(new)
                attached.append(track)
    via.SetPosition(new)

    if uuid == "58d8777e-5726-406c-9002-92c3cbdf22de":
        dogbone = k.PCB_TRACK(board)
        dogbone.SetLayer(k.B_Cu)
        dogbone.SetNet(via.GetNet())
        dogbone.SetWidth(k.FromMM(0.15))
        dogbone.SetStart(k.VECTOR2I(k.FromMM(20.70), k.FromMM(10.60)))
        dogbone.SetEnd(new)
        board.Add(dogbone)

k.SaveBoard(str(output), board)
print(output)
