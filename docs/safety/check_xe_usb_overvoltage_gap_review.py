#!/usr/bin/env python3
"""Keep the adopted USB protection chain fail-closed until physical EVT passes."""
from pathlib import Path
import hashlib
import json

ROOT = Path(__file__).resolve().parents[2]
r = json.loads((ROOT / "docs/safety/xe-usb-overvoltage-gap-review.json").read_text())
assert r["status"] == "NCP360_OVP_TPS2552_LATCH_CAD_INTEGRATED_PHYSICAL_ABNORMAL_INPUT_EVT_NOT_RUN"
assert r["current_candidate_release_allowed"] is False
tps = r["authoritative_component_limits"]["TPS2552DBVR-1"]
assert tps["recommended_VIN_max_V"] == 6.5 and tps["absolute_VIN_max_V"] == 7.0
assert tps["current_limit_min_typ_max_mA_with_ILIM_short_to_IN"] == [50, 75, 100]
assert "latch-off" in tps["overcurrent_behavior"]
ncp = r["authoritative_component_limits"]["NCP360SNT1G"]
assert ncp["OVLO_rising_min_typ_max_V"] == [5.43, 5.675, 5.9]
assert ncp["output_turn_off_max_us"] == 1.5 and "no output capacitor" in ncp["turn_off_spec_condition"]
c = r["adopted_redesign"]
assert c["limiter_mpn"] == "TPS2552DBVR-1" and c["limiter_jlc_part"] == "C140331"
assert c["cad_checks"] == {"erc": 0, "drc": 0, "schematic_parity": 0, "unconnected": 0}
assert c["assembly_positions"] == 68 and c["carrier_bom_lines"] == 36
assert c["guaranteed_OVLO_to_limiter_absolute_max_margin_V"] == 1.1
assert c["current_limit_guaranteed_mA"] == [50, 100]
gate = r["physical_release_gate"]
assert gate["TPS2552_VIN_peak_plus_measurement_uncertainty_must_be_strictly_below_V"] == 6.5
assert gate["status"] == "NOT_RUN" and gate["failure_action"] == "redesign; no waiver"
assert r["orders_payments_uploads_contacts_performed"] is False
for rel, expected in r["source_sha256"].items():
    assert hashlib.sha256((ROOT / rel).read_bytes()).hexdigest() == expected, rel
print("PASS_XE_USB_OVERVOLTAGE_TPS2552_LATCH_CAD_INTEGRATED_PHYSICAL_EVT_HOLD")
