#!/usr/bin/env python3
"""Keep storage alternates visible without allowing an unqualified substitution."""

import json
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
review = json.loads((ROOT / "docs/procurement/xe-storage-second-source-review-2026-10-28.json").read_text())

assert review["status"] == "ALTERNATES_IDENTIFIED_NOT_PIN_OR_FIRMWARE_QUALIFIED"
assert review["selected"]["mpn"] == "MKDV8GIL-AST"
assert review["selected"]["capacity_Gbit"] == 8
assert review["selected"]["actual_capacity_MByte"] == 964
assert review["automatic_substitution_allowed"] is False
assert {x["mpn"] for x in review["candidates"]} == {"CSNP32GCR01-AOW", "ZDSD32GLGEAG"}
assert all(x["capacity_Gbit"] == 32 for x in review["candidates"])
assert all(x["package"] == "LGA-8(6.2x8mm)" for x in review["candidates"])
assert all(x["qualification"] == "NOT_QUALIFIED" for x in review["candidates"])
assert any("pinout" in gate.lower() for gate in review["qualification_gates"])
assert any("16h" in gate and "30h" in gate for gate in review["qualification_gates"])

print("PASS_STORAGE_ALTERNATES_IDENTIFIED_FAIL_CLOSED_UNTIL_QUALIFIED")
