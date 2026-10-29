#!/usr/bin/env python3
"""Export unarchived, local-only CAM evidence for the current carrier."""
from pathlib import Path
import hashlib
import json
import shutil
import subprocess

HERE = Path(__file__).resolve().parent
directory = HERE / "canonical-single-carrier-v1"
review = json.loads((directory / "carrier-review.json").read_text())
board = directory / "carrier.kicad_pcb"
assert hashlib.sha256(board.read_bytes()).hexdigest() == review["carrier_sha256"]
out = directory / ("cam-review-" + review["carrier_sha256"][:8])
if out.exists():
    shutil.rmtree(out)
out.mkdir()
cli = "/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli"
subprocess.run([cli, "pcb", "export", "gerbers", "--layers",
                "F.Cu,In1.Cu,In2.Cu,In3.Cu,In4.Cu,B.Cu,F.Paste,B.Paste,F.Mask,B.Mask,F.Silkscreen,B.Silkscreen,Edge.Cuts",
                "--subtract-soldermask", "--output", str(out) + "/", str(board)], check=True)
subprocess.run([cli, "pcb", "export", "drill", "--format", "excellon", "--drill-origin", "absolute",
                "--excellon-units", "mm", "--excellon-separate-th", "--generate-report",
                "--report-path", str(out / "drill-report.txt"), "--output", str(out) + "/", str(board)], check=True)
subprocess.run([cli, "pcb", "export", "pos", "--format", "csv", "--units", "mm", "--side", "both",
                "--exclude-dnp", "--output", str(out / "positions.csv"), str(board)], check=True)
print(out)
