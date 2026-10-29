#!/usr/bin/env python3
"""Fail if the canonical order decision is stale or accidentally permissive."""
from pathlib import Path
import hashlib
import json

ROOT = Path(__file__).resolve().parents[1]
decision = json.loads((ROOT / "docs/prototype-v1-order-decision.json").read_text())
architecture = json.loads((ROOT / "hardware/xe-minimal/prototype-architecture-v1.json").read_text())
assert decision["version"] == architecture["version"]
assert decision["decision"] == "HOLD_DO_NOT_ORDER_PHYSICAL_EVT_AND_LIVE_PROCUREMENT_PENDING"
assert decision["release_allowed"] is False
assert decision["orders_payments_uploads_contacts_performed"] is False
baseline = decision["coherent_baseline"]
assert baseline["pcb_mm"] == [27.5, 27.5]
assert baseline["jlc_assembly_positions_per_unit"] == 68
assert baseline["external_sensor_positions_per_unit"] == 0
assert baseline["pofv_count"] == 4
assert baseline["pcba_route"] == "JLCPCB Standard PCBA"
assert baseline["carrier_status"] == "CARRIER_CAD_EQUIVALENCE_AND_CAM_PASS_EXTERNAL_AND_PHYSICAL_QUALIFICATION_HOLD"
assert baseline["carrier_physical_qualification"] == "READY_FOR_EXTERNAL_AND_PHYSICAL_EXECUTION_NOT_RUN"
assert baseline["battery_cutoff_characterization"] == "READY_FOR_PHYSICAL_CHARACTERIZATION_NOT_RUN"
assert baseline["jlc_programming_service"] == "STANDARD_PCBA_PROGRAMMING_OPTION_EXISTS_EXACT_XE_WORKFLOW_NOT_ACCEPTED"
assert baseline["firmware_shell_checks_passed"] == 39
assert baseline["firmware_source_hashes"] == 343
assert baseline["physical_evt_gates"] == {gate: "NOT_RUN" for gate in "ABCDEF"}
assert decision["local_review"]["archive_or_upload_package_created"] is False
assert decision["local_review"]["upload_or_order_performed"] is False
assert any("70x70mm" in blocker and "carrier" in blocker.lower() for blocker in decision["remaining_release_blockers"])
assert any(
    "Safety priority 1 HOLD" in blocker
    and "NCP360SNT1G" in blocker
    and "1.1V" in blocker
    and "TPS2552DBVR-1" in blocker
    and "measurement uncertainty" in blocker
    and "strictly below 6.5V" in blocker
    and "redesign is mandatory" in blocker
    and "NOT_RUN" in blocker
    for blocker in decision["remaining_release_blockers"]
)
for name, expected in decision["evidence_sha256"].items():
    path = ROOT / name
    assert path.is_file(), name
    assert hashlib.sha256(path.read_bytes()).hexdigest() == expected, name
text = (ROOT / "docs/prototype-v1-order-decision.md").read_text()
assert f"{baseline['firmware_shell_checks_passed']}本の非実機回帰試験" in text
assert f"{baseline['firmware_source_hashes']}ソースのハッシュ" in text
for stale in ("24 × 27", "79 PCB", "13 pad-overlap", "external TH1", "fabrication-review-1d4b19d9e46e"):
    assert stale not in text, stale
print(json.dumps({"status": "PASS_CURRENT_FAIL_CLOSED_ORDER_DECISION", "release_allowed": False, "evt": "A_F_NOT_RUN"}))
