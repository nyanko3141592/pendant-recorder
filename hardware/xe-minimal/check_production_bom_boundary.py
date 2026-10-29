"""Verify that every board reference is vendor-assembled or an intentional PCB pad."""

import csv
import json
from pathlib import Path


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
HARDWARE_BOM = HERE / "bom.csv"
PRODUCTION_BOM = ROOT / "docs/procurement/xe-production-bom-2026-10-28.csv"

with HARDWARE_BOM.open(newline="") as stream:
    hardware_rows = list(csv.DictReader(stream))
with PRODUCTION_BOM.open(newline="") as stream:
    production_rows = list(csv.DictReader(stream))

hardware_refs = {row["Reference"] for row in hardware_rows}
assert len(hardware_refs) == len(hardware_rows)

assembled = {}
features = set()
for row in production_rows:
    refs = [ref.strip() for ref in row["references"].split(",") if ref.strip()]
    route = row["route"]
    if route.startswith("JLC_"):
        assert row["mpn"] and row["jlc_part"].startswith("C") and row["source"].startswith("https://jlcpcb.com/")
        assert int(row["qty_per_device"]) == len(refs)
        assert not any(word in row["mpn"].lower() for word in ("candidate", "tbd", "unknown"))
        for ref in refs:
            assert ref not in assembled
            assembled[ref] = row["jlc_part"]
    elif route == "PCB_FEATURE":
        features.update(refs)

assert set(assembled) | features == hardware_refs
assert not set(assembled) & features
assert features == {"J3", "TP1", "TP2", "TP3", "TP5", "TP6"}

external = {row["references"]: row for row in production_rows if row["route"] == "BUYER_FINAL_ASSEMBLY"}
assert set(external) == {"BAT1", "CASE", "CORD"}
assert external["BAT1"]["mpn"] == "DTP401525-XE"
assert external["CASE"]["mpn"] == "PEBBLE_CASE_V4"
assert external["CORD"]["mpn"] == "cord_2_to_3mm"
assert not any(row["references"] == "THERMAL_PAD" or "thermal_pad" in row["mpn"].lower() for row in production_rows)
assert not any(row["route"] == "CASE_MODULE_PREINSTALLED" for row in production_rows)

print(json.dumps({
    "status": "PASS_VENDOR_COMPLETE_BOARD_ELECTRONICS_BOUNDARY_BATTERY_EXTERNAL",
    "hardware_references": len(hardware_refs),
    "jlc_assembled_references": len(assembled),
    "pcb_feature_references": sorted(features),
    "buyer_final_assembly": sorted(external),
    "buyer_board_component_sourcing": False,
    "buyer_fixed_battery_sourcing_required": True,
    "buyer_fixed_battery_mpn": external["BAT1"]["mpn"],
    "buyer_soldering_crimping_or_wiring": False
}, ensure_ascii=False))
