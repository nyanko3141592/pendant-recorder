#!/usr/bin/env python3
from pathlib import Path
import json
import csv

ROOT = Path(__file__).resolve().parents[2]
p = json.loads((ROOT / "docs/validation/xe-battery-cutoff-characterization-plan.json").read_text())
assert p["status"] == "READY_FOR_PHYSICAL_CHARACTERIZATION_NOT_RUN" and p["result"] == "NOT_RUN"
assert p["battery_mpn"] == "DTP401525-XE" and p["capacity_mAh"] == 110
assert p["pack_ids"] == [f"P{i}" for i in range(1, 6)]
assert p["load_profile"]["average_mA_min"] == 4.4 and p["load_profile"]["peak_mA"] == 110
assert p["load_profile"]["peak_duration_ms_min"] == 200 and p["load_profile"]["peak_repetition_s_max"] == 5
assert p["load_profile"]["continuous_discharge_no_pause"] is True
schema = p["required_result_evidence_schema"]
assert schema["status"] == "BATTERY_CUTOFF_SELECTED_FROM_FIVE_PACK_PHYSICAL_CHARACTERIZATION"
assert schema["minimum_usable_capacity_to_selected_cutoff_mAh"] == "number_ge_70.4"
assert "EVT C remains mandatory" in p["release_rule"]
assert p["orders_payments_uploads_vendor_contacts_performed"] is False
with (ROOT / "docs/validation/xe-battery-cutoff-results.template.csv").open(newline="") as stream:
    rows = list(csv.DictReader(stream))
assert [r["pack_id"] for r in rows] == [f"P{i}" for i in range(1, 6)]
assert all(r["result_PASS_FAIL_NOT_RUN"] == "NOT_RUN" and not r["raw_data_path"] for r in rows)
assert {"minimum_stable_terminal_mv", "adc_error_margin_mv", "rail_transient_margin_mv",
        "repeatability_margin_mv", "usable_capacity_to_cutoff_mAh", "load_average_mA",
        "load_peak_mA", "storage_finalize_success", "protection_trip_occurred",
        "raw_data_sha256"} <= set(rows[0])
print("PASS_BATTERY_CUTOFF_CHARACTERIZATION_PLAN_COMPLETE_NOT_RUN")
