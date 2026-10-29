#!/usr/bin/env python3
from pathlib import Path
import hashlib
import json

ROOT = Path(__file__).resolve().parents[3]
p = ROOT / "hardware/xe-minimal/factory-programming/vendor-programming-instruction.json"
r = json.loads(p.read_text())
architecture = json.loads((ROOT / "hardware/xe-minimal/prototype-architecture-v1.json").read_text())
assert r["status"] == "CANONICAL_CARRIER_SWD_INSTRUCTION_COMPLETE_POWER_METHOD_PHYSICAL_HOLD"
assert r["target_mpn"] == "STM32U585CIU6"
assert r["hardware_revision"] == architecture["version"]
assert r["carrier_translation_from_unit_mm"] == [21.25, 22.0]
assert [pad["pin"] for pad in r["j3_pads"]] == list("12345")
assert [pad["net"] for pad in r["j3_pads"]] == ["/V3V3", "/SWDIO", "/NRST", "/SWCLK", "/GND"]
assert "must not source power" in r["pin_1_rule"]
assert r["candidate_board_power_physical_qualification"] == "NOT_RUN"
assert r["vendor_acceptance"] == "NOT_VERIFIED"
assert r["physical_pogo_contact_and_no_battery_powerup"] == "NOT_RUN"
for relative, expected in r["source_sha256"].items():
    assert hashlib.sha256((ROOT / relative).read_bytes()).hexdigest() == expected
assert r["orders_payments_uploads_vendor_contacts_performed"] is False
print("PASS_VENDOR_PROGRAMMING_INSTRUCTION_CAD_COMPLETE_PHYSICAL_HOLD")
