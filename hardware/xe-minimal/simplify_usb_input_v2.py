#!/usr/bin/env python3
"""Adopt BQ25185's qualified ILIM100 path and remove the obsolete USB limiter latch.

This is intentionally a one-shot, assertion-heavy migration of the current XE board.
It updates design.json, regenerates the schematic/BOM, and performs the matching PCB
net/footprint/copper changes.  The direct VBUS bridge follows the former U13 IN/OUT
pad centres after its footprint and unused pad stubs are removed.
"""
from __future__ import annotations

import json
import subprocess
from pathlib import Path

import pcbnew as k
import wx


ROOT = Path(__file__).resolve().parent
DESIGN = ROOT / "design.json"
BOARD = ROOT / "pendant-xe-minimal.kicad_pcb"
PYTHON = Path("/Applications/KiCad/KiCad.app/Contents/Frameworks/Python.framework/Versions/Current/bin/python3")

REMOVE_REFS = {
    "U13", "U14", "U15", "Q5", "Q6", "Q7",
    "R44", "R45", "R46", "R47", "C31", "C32", "C33",
}
OBSOLETE_NETS = {
    "/USB_ILIM_SET", "/USB_INPUT_ON", "/USB_LATCH_CLEAR_N",
    "/USB_LATCH_CLOCK", "/USB_HIGH_BUDGET_DRAIN", "/USB_HIGH_BUDGET",
    "/USB_SUSPEND_PULSE", "/USB_RESUME_PULSE",
}
OBSOLETE_LOGICAL_NETS = {name.removeprefix("/") for name in OBSOLETE_NETS}


def update_design() -> None:
    data = json.loads(DESIGN.read_text())
    before = {part["ref"] for part in data["parts"]}
    assert not (REMOVE_REFS - before) or not (REMOVE_REFS & before)
    data["parts"] = [part for part in data["parts"] if part["ref"] not in REMOVE_REFS]

    by_ref = {part["ref"]: part for part in data["parts"]}
    u3 = by_ref["U3"]
    r42 = by_ref["R42"]
    next(pin for pin in u3["pins"] if pin["number"] == "10")["net"] = "VBUS"
    u3["note"] = (
        "BQ25185 Rev.B hardware setting: 4.2V battery regulation and ILIM100. "
        "TI specifies 80/90/98mA min/typ/max total IN current at 5V. "
        "Charge current remains approximately 44.12mA; physical qualification pending."
    )
    r42["value"] = "24k 1%"
    r42["note"] = (
        "BQ25185 Rev.B Table 6-1: 24k selects 4.2V and ILIM100. "
        "TI electrical limit is 80/90/98mA min/typ/max at VIN=5V."
    )

    for part in data["parts"]:
        for pin in part["pins"]:
            if pin.get("net") in OBSOLETE_LOGICAL_NETS:
                pin["net"] = None

    DESIGN.write_text(json.dumps(data, ensure_ascii=False, indent=2) + "\n")


def update_board() -> None:
    app = wx.App(False)
    board = k.LoadBoard(str(BOARD))
    footprints = {fp.GetReference(): fp for fp in board.GetFootprints()}
    assert REMOVE_REFS <= footprints.keys()
    u13 = footprints["U13"]
    p_out_raw = u13.FindPadByNumber("1").GetPosition()
    p_in_raw = u13.FindPadByNumber("5").GetPosition()
    p_out = k.VECTOR2I(p_out_raw.x, p_out_raw.y)
    p_in = k.VECTOR2I(p_in_raw.x, p_in_raw.y)

    # Remove obsolete signal copper and short component stubs terminating at removed pads.
    removed_pad_points = {
        (pad.GetPosition().x, pad.GetPosition().y)
        for ref in REMOVE_REFS
        for pad in footprints[ref].Pads()
        if not (ref == "U13" and pad.GetNumber() in {"1", "5"})
    }

    vbus = board.FindNet("/VBUS")
    limited = board.FindNet("/VBUS_LIMITED")
    assert vbus and limited
    for ref in list(footprints):
        if ref in REMOVE_REFS:
            continue
        fp = board.FindFootprintByReference(ref)
        assert fp
        for pad in fp.Pads():
            if pad.GetNetname() == "/VBUS_LIMITED":
                pad.SetNet(vbus)
            elif pad.GetNetname() in OBSOLETE_NETS:
                pad.SetNetCode(0)

    for ref in REMOVE_REFS:
        fp = board.FindFootprintByReference(ref)
        assert fp
        board.Delete(fp)

    for item in list(board.GetTracks()):
        endpoints = {
            (item.GetStart().x, item.GetStart().y),
            (item.GetEnd().x, item.GetEnd().y),
        }
        if item.GetNetname() in OBSOLETE_NETS or endpoints & removed_pad_points:
            board.Delete(item)

    for item in board.GetTracks():
        if item.GetNetname() == "/VBUS_LIMITED":
            item.SetNet(vbus)

    bridge = k.PCB_TRACK(board)
    bridge.SetStart(p_out)
    bridge.SetEnd(p_in)
    bridge.SetLayer(k.F_Cu)
    bridge.SetWidth(k.FromMM(0.30))
    bridge.SetNet(vbus)
    board.Add(bridge)

    k.SaveBoard(str(BOARD), board)
    del app


def main() -> None:
    update_design()
    update_board()
    subprocess.run([str(PYTHON), str(ROOT / "generate_schematic.py"), "xe-minimal", str(ROOT)], check=True)


if __name__ == "__main__":
    main()
