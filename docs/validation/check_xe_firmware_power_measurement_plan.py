#!/usr/bin/env python3
import hashlib, json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
p = json.loads((ROOT / "docs/validation/xe-firmware-power-measurement-plan.json").read_text())
assert p["status"] == "EXACT_IMAGE_16H_MEASUREMENT_CONTRACT_READY_PHYSICAL_TEST_NOT_RUN"
for rel, expected in p["sources"].items():
    assert hashlib.sha256((ROOT / "firmware/stm32" / rel).read_bytes()).hexdigest() == expected, rel
a = p["acceptance_run_contract"]
assert a["units"] == 5 and "DTP401525-XE" in a["battery"]
assert a["recording"].startswith("at least 57600 seconds continuous")
assert any("<=70.4mAh" in x and "<=4.4mA" in x for x in a["per_unit_pass"])
assert any(">=921600000" in x for x in a["per_unit_pass"])
assert p["runtime_pass"] is None
print("PASS_EXACT_IMAGE_16H_MEASUREMENT_CONTRACT_PHYSICAL_NOT_RUN")
