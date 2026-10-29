"""Build a non-canonical STM32U585CIT6 LQFP48 placement feasibility board."""

from __future__ import annotations

import hashlib
import json
import shutil
import subprocess
from pathlib import Path

import pcbnew
import wx


HERE = Path(__file__).resolve().parent
SOURCE = HERE / "pendant-xe-minimal.kicad_pcb"
OUT_DIR = HERE / "u1-lqfp48-feasibility"
BOARD = OUT_DIR / "pendant-xe-minimal.kicad_pcb"
DRC = OUT_DIR / "drc.json"
FOOTPRINT_DIR = Path(
    "/Applications/KiCad/KiCad.app/Contents/SharedSupport/footprints/Package_QFP.pretty"
)
KICAD = "/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli"


app = wx.App(False)
board = pcbnew.LoadBoard(str(SOURCE))
old = board.FindFootprintByReference("U1")
assert old is not None
assert len([pad for pad in old.Pads() if pad.GetNumber()]) == 49
# The QFN also contains unnumbered paste-only apertures; ignore them here.

pad_nets = {pad.GetNumber(): pad.GetNet() for pad in old.Pads() if pad.GetNumber() != "49"}
position = old.GetPosition()
orientation = old.GetOrientation()

new = pcbnew.FootprintLoad(str(FOOTPRINT_DIR), "LQFP-48_7x7mm_P0.5mm")
assert new is not None and len(list(new.Pads())) == 48
new.SetReference("U1")
new.SetValue("STM32U585CIT6")
new.SetPosition(position)
new.SetOrientation(orientation)
for pad in new.Pads():
    pad.SetNet(pad_nets[pad.GetNumber()])

board.Remove(old)
board.Add(new)
OUT_DIR.mkdir(exist_ok=True)
pcbnew.SaveBoard(str(BOARD), board)
for suffix in (".kicad_sch", ".kicad_pro", ".kicad_dru"):
    source_companion = SOURCE.with_suffix(suffix)
    if source_companion.exists():
        shutil.copyfile(source_companion, OUT_DIR / source_companion.name)

subprocess.run(
    [
        KICAD,
        "pcb",
        "drc",
        str(BOARD),
        "--schematic-parity",
        "--format",
        "json",
        "--severity-all",
        "-o",
        str(DRC),
    ],
    check=True,
    stdout=subprocess.DEVNULL,
)
drc = json.loads(DRC.read_text())

report = {
    "status": "PLACEMENT_FEASIBILITY_ONLY_NOT_ADOPTED",
    "source_board_sha256": hashlib.sha256(SOURCE.read_bytes()).hexdigest(),
    "candidate_board_sha256": hashlib.sha256(BOARD.read_bytes()).hexdigest(),
    "mcu": {
        "source": "STM32U585CIU6 / UFQFPN48",
        "candidate": "STM32U585CIT6 / LQFP48 7x7 P0.5",
        "same_48_numbered_signal_pads": True,
        "qfn_exposed_ground_pad_removed": "pad 49",
    },
    "drc": {
        "violations": len(drc["violations"]),
        "schematic_parity": len(drc["schematic_parity"]),
        "unconnected_items": len(drc["unconnected_items"]),
    },
    "decision_rule": (
        "Do not adopt unless the LQFP candidate can be fully routed with DRC/parity/unconnected zero, "
        "ordinary through vias, confirmed JLC procurement, and unchanged safety/runtime functions."
    ),
    "limitations": [
        "The footprint was swapped at the same center without moving neighboring parts or rerouting copper.",
        "This result measures redesign scope; it is not a manufacturable candidate.",
        "JLC public-stock availability for STM32U585CIT6 is not confirmed.",
    ],
}
(OUT_DIR / "review.json").write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n")
print(json.dumps(report, ensure_ascii=False))
