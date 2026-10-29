#!/usr/bin/env python3
"""Fail when the canonical design inventory and engineering BOM drift."""

import csv
import json
from pathlib import Path


HERE = Path(__file__).resolve().parent

with (HERE / "bom.csv").open(newline="") as stream:
    bom = {row["Reference"]: row for row in csv.DictReader(stream)}
design = {part["ref"]: part for part in json.loads((HERE / "design.json").read_text())["parts"]}

assert len(bom) == 74
assert len(design) == 74
assert set(bom) == set(design), {
    "missing_from_design": sorted(set(bom) - set(design)),
    "missing_from_bom": sorted(set(design) - set(bom)),
}

for ref in sorted(bom):
    assert design[ref].get("value", "").strip() == bom[ref]["Part/value"].strip(), ref
    assert design[ref].get("footprint", "").strip() == bom[ref]["Footprint"].strip(), ref

assert design["U3"]["value"] == "BQ25185DLHR"
assert "R42=130k selects 4.1V nominal" in design["U3"]["note"]
assert design["R10"]["value"].startswith("RC0402FR-0730KL 30k")
assert design["R42"]["value"].startswith("RC0402FR-07130KL 130k")
assert "R51" not in design
assert design["U13"]["value"] == "TPS2552DBVR-1"
assert "50..100mA" in design["U13"]["note"]
assert design["C31"]["value"] == design["C32"]["value"] == "1u 10V X5R"
assert design["U14"]["value"] == "NCP360SNT1G"
assert design["C33"]["value"] == "1u 35V X5R"

print("PASS_CANONICAL_DESIGN_BOM_PARITY_74_REFERENCES")
