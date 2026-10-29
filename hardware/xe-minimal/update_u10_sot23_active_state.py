#!/usr/bin/env python3
"""Refresh authoritative hashes after the adopted TPS22917 layout revision."""
from pathlib import Path
import hashlib
import json

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
path = HERE / "active-design.json"
active = json.loads(path.read_text())

active["status"] = "U585_TPS22917_PRODUCTION_CANDIDATE_ELECTRICALLY_CLEAN_MECHANICAL_RESYNC_REQUIRED_ORDER_HOLD"
active["warning"] = (
    "Electrical sources, production BOM, U585 firmware target and TPS22917 SOT-23-6 load switch are synchronized; "
    "ERC/DRC/parity/unconnected are zero. Order remains prohibited because the PCB is now 27.5 x 27.0 mm and all "
    "24 mm case/panel/CAM artifacts are superseded, the case-integrated thermal-pad material/process and four "
    "hole-over-pad vias remain unresolved, and safety/runtime/USB/PDM/thermal/mechanical claims require physical EVT."
)
active["paste_revision"] = "TPS22917DBVT standard SOT-23-6; CT open; QOD tied to SD_V3"
active["manufacturing_export_status"] = "ALL_EXISTING_CAM_SUPERSEDED_BY_27P5MM_TPS22917_REVISION"
active["panel_revision_status"] = "All 24 x 27 mm panel/order files are superseded; regenerate for 27.5 x 27.0 mm only after release gates pass."
active["mechanical_status"] = "STALE_24MM_CASE; regenerate for 27.5mm PCB, then repeat collision/USB/cord/thermal checks and physical qualification"
active["u10_load_switch"] = {
    "mpn": "TPS22917DBVT",
    "jlc_part": "C2680344",
    "package": "SOT-23-6",
    "ct": "OPEN",
    "qod": "SD_V3",
    "electrical_checks": "ERC0_DRC0_PARITY0_UNCONNECTED0",
    "physical_status": "UNMEASURED_RISE_DISCHARGE_REVERSE_CURRENT"
}
active["pcb_outline_mm"] = [27.5, 27.0]

for rel in list(active["sha256"]):
    target = (HERE / rel).resolve()
    if target.exists():
        active["sha256"][rel] = hashlib.sha256(target.read_bytes()).hexdigest()

# New canonical symbol source and routed-candidate evidence.
for rel in (
    "Pendant.kicad_sym",
    "pendant-xe-minimal.kicad_dru",
    "u10-sot23-candidate/drc-routed.json",
    "build_u10_sot23_candidate.py",
    "route_u10_sot23_candidate.py",
):
    target = HERE / rel
    active["sha256"][rel] = hashlib.sha256(target.read_bytes()).hexdigest()

path.write_text(json.dumps(active, indent=2) + "\n")
