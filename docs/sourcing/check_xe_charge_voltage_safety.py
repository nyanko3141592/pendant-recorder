#!/usr/bin/env python3
"""Ensure the corrected charge settings and integrated USB limiter stay coherent."""
import csv
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
review = json.loads((ROOT / "docs/sourcing/xe-charge-voltage-safety-review.json").read_text())
active = json.loads((ROOT / "hardware/xe-minimal/active-design.json").read_text())
with (ROOT / "hardware/xe-minimal/bom.csv").open(newline="") as handle:
    bom = {row["Reference"]: row for row in csv.DictReader(handle)}

assert review["status"] == "4P1V_10MA_AND_TPS2552_50_TO_100MA_LATCH_OFF_WITH_LOCAL_CAPS_INTEGRATED_PHYSICAL_EVT_ORDER_HOLD"
assert review["current_charger"]["calculated_regulation_range_V"][1] <= review["battery"]["published_charge_limited_voltage_V"]
assert review["decision"]["current_24k_setting_adopted"] is False
assert review["decision"]["corrected_130k_setting_adopted"] is True
assert review["decision"]["pcb_order_allowed"] is False
assert review["decision"]["charging_enable_allowed"] is False
assert bom["R42"]["Part/value"].startswith("RC0402FR-07130KL 130k")
assert bom["R10"]["Part/value"].startswith("RC0402FR-0730KL 30k")
assert "R51" not in bom
assert bom["U13"]["Part/value"] == "TPS2552DBVR-1"
assert bom["C31"]["Part/value"].startswith("1u 10V X5R")
assert bom["C32"]["Part/value"].startswith("1u 10V X5R")
assert review["usb_input_limiter"]["local_bypass"]["C31_VIN_uF"] >= 1.0
assert review["usb_input_limiter"]["local_bypass"]["C32_VOUT_uF"] >= 1.0
assert review["usb_input_limiter"]["guaranteed_total_input_max_mA"] <= 100
assert review["usb_input_limiter"]["guaranteed_output_limit_min_mA"] == 50
assert "latch-off" in review["usb_input_limiter"]["overcurrent_behavior"]
assert "TPS2552" in active["status"]
print("PASS_CHARGE_SETTINGS_AND_HARDWARE_USB_LIMITER_INTEGRATED_PHYSICAL_PENDING")
