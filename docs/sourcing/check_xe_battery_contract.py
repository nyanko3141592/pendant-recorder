#!/usr/bin/env python3
"""Fail closed when the fixed battery contract drifts across canonical files."""

import csv
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
selection = json.loads((ROOT / "docs/sourcing/battery-first-selection.json").read_text())
active = json.loads((ROOT / "hardware/xe-minimal/active-design.json").read_text())
design = json.loads((ROOT / "hardware/xe-minimal/design.json").read_text())
runtime = json.loads((ROOT / "docs/sourcing/xe-integrated-16h-budget.json").read_text())
decision = (ROOT / "docs/decisions/0010-xe-battery-connection-and-temperature.md").read_text()
requirements = (ROOT / "docs/requirements.md").read_text()
purchase = json.loads((ROOT / "docs/sourcing/dtp401525-xe-purchase-specification.json").read_text())
old_screen = json.loads((ROOT / "docs/sourcing/retail-battery-availability-screen.json").read_text())
old_40mah = json.loads((ROOT / "docs/sourcing/dtp40-public-spec-review.json").read_text())

assert selection["selected_model"] == "DTP401525-XE"
assert selection["capacity_mAh"] == 110
assert selection["manufacturer"]["connector"] == "Molex781720003"
assert selection["connector_header"]["model"] == "781710003"
assert selection["manufacturer"]["pinout"] == {
    "1": "red positive", "2": "NTC", "3": "black negative"
}
assert selection["runtime_budget"]["design_average_mA"] == 4.4
assert "No separate contact sensor" in selection["temperature_decision"]
assert "Charging remains disabled" in selection["temperature_decision"]

assert design["battery_model"] == "DTP401525-XE"
assert design["temperature_sensor"] == "DTP401525-XE internal 10k NTC on connector pin 2"
assert active["runtime_design_target"].startswith("<=4.4mA")
assert "internal 10k NTC on J2 pin2" in active["temperature_sensor"]
assert runtime["battery"]["model"] == "DTP401525-XE"
assert runtime["battery"]["nominal_capacity_mAh"] == 110
assert runtime["adopted_design_allocation"]["whole_device_average_target_mA"] == 4.4

with (ROOT / "hardware/xe-minimal/bom.csv").open(newline="") as handle:
    rows = {row["Reference"]: row for row in csv.DictReader(handle)}
assert rows["J2"]["Part/value"] == "Molex781710003 / DTP401525-XE"
assert "P2 white built-in 10k NTC" in rows["J2"]["Design note"]

assert "DTP401525-XE（110mAh）を固定" in requirements
for forbidden_buyer_work in ("はんだ付け", "圧着", "線の切断・延長", "コネクター交換"):
    assert forbidden_buyer_work in requirements
assert "電池内蔵NTC直結方式を採用" in decision
assert "購入者は配線加工、圧着、はんだ付けをしない" in decision
assert "実測合格までは充電を有効化しない" in decision
assert purchase["manufacturer_model"] == "DTP401525-XE"
assert purchase["capacity_mAh"] == 110
assert purchase["pack"]["connector"] == "Molex 781720003"
assert purchase["pack"]["mating_board_header"] == "Molex 781710003 installed as J2 by PCBA vendor"
assert purchase["pack"]["pinout"] == {"1": "red / BAT+", "2": "white / internal nominal 10k NTC", "3": "black / BAT-"}
assert purchase["buyer_electronics_work_required"] is False
assert purchase["buyer_solder_crimp_or_wiring_required"] is False
protection = purchase["pack_protection_public_spec"]
assert protection["protection_IC"] == "DW01+" and protection["protection_MOSFET"] == "8205"
assert protection["overcurrent_detection_A"] == [2.5, 3.5]
assert protection["overcurrent_detection_delay_ms"] == 10
assert protection["short_detection_delay_us_max"] == 5
assert protection["short_release"] == "remove short circuit"
assert "specialized Li-ion personnel" in protection["safety_execution_limit"]
assert any("current-limited battery-simulator" in item for item in purchase["required_acceptance"])
assert any("qualified Li-ion laboratory" in item for item in purchase["required_acceptance"])
assert purchase["physical_acceptance"] == "NOT_RUN"
assert purchase["orders_payments_supplier_contacts_performed"] is False
assert old_screen["status"].startswith("SUPERSEDED_SCREEN_")
assert old_40mah["status"].startswith("SUPERSEDED_DTP301120_")

for stale in ("independently specified board contact sensor", "独立した接触温度センサー"):
    assert stale not in json.dumps(selection, ensure_ascii=False)

print("PASS_FIXED_DTP401525_XE_BATTERY_CONTRACT_AND_UNQUALIFIED_CHARGING_HOLD")
