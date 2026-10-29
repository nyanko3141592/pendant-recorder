"""Adopt the reviewed DTP401525-XE internal-NTC candidate."""

from __future__ import annotations

import hashlib
import json
import shutil
import subprocess
from pathlib import Path


HERE = Path(__file__).resolve().parent
CANDIDATE = HERE / "pack-ntc-candidate"
BACKUP = HERE / "pre-pack-ntc-adoption"
KICAD = "/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli"
PYTHON = "/Applications/KiCad/KiCad.app/Contents/Frameworks/Python.framework/Versions/Current/bin/python3"


def sha(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


review = json.loads((CANDIDATE / "review.json").read_text())
assert review["source_board_sha256"] == sha(HERE / "pendant-xe-minimal.kicad_pcb")
assert review["drc"] == {"violations": 0, "schematic_parity": 0, "unconnected_items": 0}

names = (
    "pendant-xe-minimal.kicad_pcb",
    "pendant-xe-minimal.kicad_sch",
    "design.json",
    "bom.csv",
    "connections.csv",
    "Pendant.kicad_sym",
    "sym-lib-table",
)
BACKUP.mkdir(exist_ok=True)
for name in (*names, "active-design.json", "current-drc.json", "current-erc.json", "exact-via-pad-overlap-audit.json"):
    source = HERE / name
    if source.exists():
        shutil.copyfile(source, BACKUP / name)
for name in names:
    shutil.copyfile(CANDIDATE / name, HERE / name)

subprocess.run(
    [KICAD, "pcb", "drc", str(HERE / "pendant-xe-minimal.kicad_pcb"), "--schematic-parity", "--format", "json", "--severity-all", "-o", str(HERE / "current-drc.json")],
    check=True,
)
subprocess.run(
    [KICAD, "sch", "erc", str(HERE / "pendant-xe-minimal.kicad_sch"), "--format", "json", "--severity-all", "-o", str(HERE / "current-erc.json")],
    check=True,
)
subprocess.run([PYTHON, str(HERE / "audit_exact_via_pad_overlap.py")], check=True)

drc = json.loads((HERE / "current-drc.json").read_text())
erc = json.loads((HERE / "current-erc.json").read_text())
via = json.loads((HERE / "exact-via-pad-overlap-audit.json").read_text())
assert not drc["violations"] and not drc["schematic_parity"] and not drc["unconnected_items"]
assert not any(sheet["violations"] for sheet in erc["sheets"])
assert via["hole_over_pad_vias"] == 3

active_path = HERE / "active-design.json"
active = json.loads(active_path.read_text())
active["status"] = "U585_TPS22917_PACK_NTC_27P5X27P5_THREE_HOLE_OVER_PAD_PHYSICAL_EVT_REQUIRED_ORDER_HOLD"
active["temperature_sensor"] = (
    "DTP401525-XE internal 10k NTC on J2 pin2 drives TLV7042 hardware hot/cold inhibit; "
    "board TH1 and case thermal pad removed; R-T lot characterization and installed cutoff/recovery EVT pending; charging default disabled"
)
active["pcb_outline_mm"] = [27.5, 27.5]
active["warning"] = (
    "Pack NTC electrical path is synchronized and ERC/DRC/parity/unconnected are zero. "
    "Order remains prohibited because CAM/panel/case are superseded, three hole-over-pad vias remain, "
    "and safety/runtime/USB/PDM/temperature/lanyard claims require physical EVT."
)
active["manufacturing_export_status"] = "ALL_EXISTING_CAM_SUPERSEDED_BY_PACK_NTC_27P5X27P5_REVISION"
active["panel_revision_status"] = (
    "All earlier panels/order files are superseded; regenerate for 27.5 x 27.5 mm only after release gates pass."
)
active["mechanical_status"] = (
    "CASE_V3_SUPERSEDED_BY_0P5MM_BOARD_EXTENSION_AND_THERMAL_PAD_REMOVAL; regenerate before fit claims"
)
for key in list(active["sha256"]):
    path = (HERE / key).resolve()
    if path.exists():
        active["sha256"][key] = sha(path)
active_path.write_text(json.dumps(active, ensure_ascii=False, indent=2) + "\n")

review["status"] = "ADOPTED_ELECTRICALLY_CLEAN_PHYSICAL_TEMPERATURE_EVT_REQUIRED"
review["adopted_board_sha256"] = sha(HERE / "pendant-xe-minimal.kicad_pcb")
(CANDIDATE / "review.json").write_text(json.dumps(review, ensure_ascii=False, indent=2) + "\n")
print(json.dumps({"status": review["status"], "drc": 0, "erc": 0, "parity": 0, "unconnected": 0, "hole_over_pad": 3}))
