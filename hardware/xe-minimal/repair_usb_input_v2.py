#!/usr/bin/env python3
"""Finalize net identity, routing clearance, and zones after USB-input simplification."""
import json
import subprocess
from pathlib import Path

import pcbnew as k
import wx

ROOT = Path(__file__).resolve().parent
DESIGN = ROOT / "design.json"
BOARD = ROOT / "pendant-xe-minimal.kicad_pcb"
PYTHON = "/Applications/KiCad/KiCad.app/Contents/Frameworks/Python.framework/Versions/Current/bin/python3"


def update_design():
    data = json.loads(DESIGN.read_text())
    for part in data["parts"]:
        if part["ref"] in {"C13", "R12"}:
            for pin in part["pins"]:
                if pin.get("net") == "VBUS_LIMITED":
                    pin["net"] = "VBUS"
    DESIGN.write_text(json.dumps(data, ensure_ascii=False, indent=2) + "\n")
    subprocess.run([PYTHON, str(ROOT / "generate_schematic.py"), "xe-minimal", str(ROOT)], check=True)


def main():
    update_design()
    app = wx.App(False)
    board = k.LoadBoard(str(BOARD))
    vbus = board.FindNet("/VBUS")
    assert vbus

    r42 = board.FindFootprintByReference("R42")
    r42.SetValue("24k 1%")

    # Match KiCad's explicit per-pin no-connect net identities used by parity DRC.
    nc = {
        ("R48", "2"): "unconnected-(R48-Pad2)",
        ("R49", "1"): "unconnected-(R49-Pad1)",
        ("R50", "1"): "unconnected-(R50-Pad1)",
        ("U1", "12"): "unconnected-(U1-PA2-Pad12)",
        ("U1", "19"): "unconnected-(U1-PB1-Pad19)",
        ("U1", "42"): "unconnected-(U1-PB6-Pad42)",
    }
    for (ref, number), name in nc.items():
        net = board.FindNet(name)
        if not net:
            net = k.NETINFO_ITEM(board, name)
            board.Add(net)
        board.FindFootprintByReference(ref).FindPadByNumber(number).SetNet(net)

    # Replace the temporary former-U13 top-layer bridge.  The old input and output
    # branches already reach vias; join those vias on In2.Cu so PDM_DATA is not crossed.
    start = k.VECTOR2I(k.FromMM(12.7375), k.FromMM(1.05))
    end = k.VECTOR2I(k.FromMM(15.0125), k.FromMM(2.0))
    dogleg = {
        (k.FromMM(12.7375), k.FromMM(1.05)),
        (k.FromMM(12.9), k.FromMM(0.45)),
        (k.FromMM(14.8), k.FromMM(0.45)),
        (k.FromMM(15.0125), k.FromMM(2.0)),
    }
    stale_endpoints = {
        (k.FromMM(22.2), k.FromMM(9.8)),
        (k.FromMM(3.925), k.FromMM(20.175)),
        (k.FromMM(8.8), k.FromMM(22.3)),
        (k.FromMM(5.4), k.FromMM(19.7)),
        (k.FromMM(5.3), k.FromMM(21.5)),
        (k.FromMM(19.265), k.FromMM(0.795)),
        (k.FromMM(12.7375), k.FromMM(2.0)),
        (k.FromMM(17.7225), k.FromMM(2.2)),
    }
    for track in list(board.GetTracks()):
        endpoints = {
            (track.GetStart().x, track.GetStart().y),
            (track.GetEnd().x, track.GetEnd().y),
        }
        if endpoints <= dogleg or endpoints & stale_endpoints:
            board.Delete(track)
    stale_vias = {
        (k.FromMM(7.062084), k.FromMM(21.999999)),
        (k.FromMM(9.039213), k.FromMM(23.089213)),
    }
    for track in list(board.GetTracks()):
        if isinstance(track, k.PCB_VIA) and (track.GetPosition().x, track.GetPosition().y) in stale_vias:
            board.Delete(track)

    a = k.VECTOR2I(k.FromMM(11.5375), k.FromMM(1.249999))
    b = k.VECTOR2I(k.FromMM(16.7625), k.FromMM(3.399999))
    for old in list(board.GetTracks()):
        if old.GetLayer() == k.In2_Cu and {
            (old.GetStart().x, old.GetStart().y), (old.GetEnd().x, old.GetEnd().y)
        } == {(a.x, a.y), (b.x, b.y)}:
            board.Delete(old)
    route = [a, k.VECTOR2I(k.FromMM(11.5), k.FromMM(0.22)),
             k.VECTOR2I(k.FromMM(17.15), k.FromMM(0.22)), b]
    for a0, b0 in zip(route, route[1:]):
        track = k.PCB_TRACK(board)
        track.SetStart(a0); track.SetEnd(b0); track.SetLayer(k.B_Cu)
        track.SetWidth(k.FromMM(0.30)); track.SetNet(vbus); board.Add(track)

    filler = k.ZONE_FILLER(board)
    filler.Fill(board.Zones())
    k.SaveBoard(str(BOARD), board)
    del app


if __name__ == "__main__":
    main()
