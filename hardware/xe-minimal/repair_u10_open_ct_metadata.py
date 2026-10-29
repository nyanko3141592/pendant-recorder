"""Represent TPS22917 CT as the datasheet-permitted open pin without ERC noise."""

import json
import subprocess
from pathlib import Path

import pcbnew as k
import wx


HERE = Path(__file__).resolve().parent
PYTHON = "/Applications/KiCad/KiCad.app/Contents/Frameworks/Python.framework/Versions/Current/bin/python3"

design_path = HERE / "design.json"
design = json.loads(design_path.read_text())
u10 = next(part for part in design["parts"] if part["ref"] == "U10")
ct = next(pin for pin in u10["pins"] if pin["number"] == "4")
ct["net"] = None
ct["type"] = "no_connect"
u10["note"] = (
    "TPS22917DBVT load switch. CT is intentionally open for the TI-specified fastest turn-on; "
    "QOD is tied to SD_V3. Rise time, discharge and reverse-current behavior require EVT."
)
design_path.write_text(json.dumps(design, ensure_ascii=False, indent=2) + "\n")

app = wx.App(False)
board_path = HERE / "pendant-xe-minimal.kicad_pcb"
board = k.LoadBoard(str(board_path))
u10_fp = board.FindFootprintByReference("U10")
assert u10_fp
ct_net = board.FindNet("unconnected-(U10-CT-Pad4)")
if not ct_net:
    ct_net = k.NETINFO_ITEM(board, "unconnected-(U10-CT-Pad4)")
    board.Add(ct_net)
u10_fp.FindPadByNumber("4").SetNet(ct_net)
k.SaveBoard(str(board_path), board)
del app

subprocess.run([PYTHON, str(HERE / "generate_schematic.py"), "xe-minimal", str(HERE)], check=True)
print("U10 CT represented as intentional no-connect")
