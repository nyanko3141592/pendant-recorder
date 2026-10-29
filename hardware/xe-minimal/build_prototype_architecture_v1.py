#!/usr/bin/env python3
"""Regenerate the canonical current prototype architecture. Never releases or orders."""
from pathlib import Path
import csv
import hashlib
import json

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


bom = {row["Reference"]: row for row in csv.DictReader((HERE / "bom.csv").open())}
part_refs = ("U1", "U8", "U11", "U10", "U3", "U4", "U14", "U13", "J1", "U2", "J2", "U12")
parts = {reference: bom[reference]["Part/value"] for reference in part_refs}
expected = {
    "U1": "STM32U585CIU6",
    "U8": "IM69D130V01",
    "U11": "MKDV8GIL-AST",
    "U10": "TPS22917DBVT",
    "U3": "BQ25185DLHR",
    "U4": "TPS7A0233PDBVR",
    "U14": "NCP360SNT1G",
    "U13": "TPS2552DBVR-1",
    "J1": "USB4105-GF-A",
    "U2": "USBLC6-2P6",
    "J2": "Molex781710003 / DTP401525-XE",
    "U12": "TLV7042DDFR",
}
assert parts == expected and "TH1" not in bom

active = json.loads((HERE / "active-design.json").read_text())
erc = json.loads((HERE / "current-erc.json").read_text())
drc = json.loads((HERE / "current-drc.json").read_text())
assert not any(sheet["violations"] for sheet in erc["sheets"])
assert not drc["violations"] and not drc["schematic_parity"] and not drc["unconnected_items"]

sources = [
    HERE / "active-design.json",
    HERE / "bom.csv",
    HERE / "pendant-xe-minimal.kicad_sch",
    HERE / "pendant-xe-minimal.kicad_pcb",
    HERE / "current-erc.json",
    HERE / "current-drc.json",
    ROOT / "docs/procurement/xe-production-bom-2026-10-28.csv",
    ROOT / "firmware/stm32/tests/prototype-v1-regression.json",
    ROOT / "mechanical/xe-minimal/prototype-v1/case-pebble-v5-review.json",
]
architecture = {
    "hardware_version": "HW-V1.0",
    "version": "XE-PROTOTYPE-V1-27P5-PACK-NTC-CASE-V5-1GB-OVP-LATCH",
    "date": "2026-10-28",
    "status": "SINGLE_CANONICAL_PROTOTYPE_CANDIDATE_NOT_PHYSICALLY_RELEASED",
    "requirements": {
        "battery": "DTP401525-XE 3.7V 110mAh fixed",
        "runtime": "continuous 16kHz mono including silence >=16h; physical NOT_RUN",
        "storage": "1GB managed NAND; encrypted audio >=30h; physical NOT_RUN",
        "io": "one USB-C for charge and read-only MSC/HID data",
        "manufacturing": "68 JLC board placements; battery/case/cord final assembly only",
    },
    "architecture": [
        {"function": "MCU/audio/crypto/USB", "reference": "U1", "part": parts["U1"]},
        {"function": "microphone", "reference": "U8", "part": parts["U8"]},
        {"function": "managed storage", "reference": "U11", "part": parts["U11"]},
        {"function": "storage rail switch", "reference": "U10", "part": parts["U10"]},
        {"function": "4.1V/10mA charger and power path", "reference": "U3", "part": parts["U3"]},
        {"function": "3.3V rail", "reference": "U4", "part": parts["U4"]},
        {"function": "20V USB overvoltage protection", "reference": "U14", "part": parts["U14"]},
        {"function": "50-100mA guaranteed latch-off USB limiter", "reference": "U13", "part": parts["U13"]},
        {"function": "USB-C connector", "reference": "J1", "part": parts["J1"]},
        {"function": "USB ESD", "reference": "U2", "part": parts["U2"]},
        {"function": "battery plus pack NTC connector", "reference": "J2", "part": parts["J2"]},
        {"function": "hardware temperature guard", "reference": "U12", "part": parts["U12"]},
    ],
    "electrical_checks": {
        "erc_violations": 0,
        "drc_violations": 0,
        "schematic_parity_violations": 0,
        "unconnected_items": 0,
        "interpretation": "CAD connectivity only; physical EVT A-F remains NOT_RUN.",
    },
    "manufacturing": {
        "pcb_mm": active["pcb_outline_mm"],
        "jlc_positions": 68,
        "pofv": 4,
        "local_cam_review": active["manufacturing_review_directory"],
        "upload_or_order_performed": False,
    },
    "release_blockers": [
        "Physical 6/9/12/20V USB abnormal-input, TPS2552 latch/recovery and NCP360 thermal qualification",
        "Physical safety and charge/thermal fault qualification",
        "Measured 16h runtime from fixed 110mAh pack",
        "Physical 30h encrypted recording and recovery",
        "Three-OS USB interoperability",
        "Case/cord/USB durability",
        "Live stock, JLC DFM and factory-programming acceptance",
    ],
    "source_sha256": {str(path.relative_to(ROOT)): sha(path) for path in sources},
}
(HERE / "prototype-architecture-v1.json").write_text(
    json.dumps(architecture, ensure_ascii=False, indent=2) + "\n"
)
print(json.dumps({
    "status": architecture["status"],
    "parts": len(architecture["architecture"]),
    "release": False,
}))
