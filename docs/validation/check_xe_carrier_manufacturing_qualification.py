#!/usr/bin/env python3
from pathlib import Path
import hashlib
import json

ROOT = Path(__file__).resolve().parents[2]
path = ROOT / "docs/validation/xe-carrier-manufacturing-qualification.json"
plan = json.loads(path.read_text())
assert plan["status"] == "READY_FOR_EXTERNAL_AND_PHYSICAL_EXECUTION_NOT_RUN"
assert plan["release_allowed"] is False
assert plan["sample_scope"].startswith("all_5")
assert plan["supplier_DFM_acceptance"]["result"] == "NOT_RUN"
assert len(plan["supplier_DFM_acceptance"]["required"]) >= 7
assert "all_68_placements_and_both_reflow_sides_accepted" in plan["supplier_DFM_acceptance"]["required"]
assert not any("67" in item for item in plan["supplier_DFM_acceptance"]["required"])
assert plan["per_carrier_before_and_after_reflow"]["units"] == [f"U{i}" for i in range(1, 6)]
assert plan["per_carrier_before_and_after_reflow"]["result"] == "NOT_RUN"
assert plan["depanelization"]["responsibility"] == "JLCPCB_panel_removal_service_before_shipment_only"
assert plan["depanelization"]["buyer_breakout_or_edge_finishing_allowed"] is False
assert plan["depanelization"]["seller_breakout_or_edge_finishing_allowed"] is False
assert plan["depanelization"]["required_delivery_state"] == "five_individually_separated_edge_inspected_product_boards"
assert plan["depanelization"]["result"] == "NOT_RUN"
assert plan["per_finished_board"]["units"] == [f"U{i}" for i in range(1, 6)]
assert plan["per_finished_board"]["result"] == "NOT_RUN"
limits = plan["per_finished_board"]["limits"]
assert limits["finished_width_mm"] == limits["finished_height_mm"] == [27.3, 27.7]
assert limits["residual_tab_protrusion_mm"] == [0, 0.15]
assert limits["sharp_burr_count"] == [0, 0]
assert limits["case_interference_count"] == [0, 0]
for name in plan["canonical_inputs"].values():
    assert (ROOT / name).is_file(), name
assert plan["orders_payments_uploads_vendor_contacts_performed"] is False
print(json.dumps({"status": "PASS_CARRIER_MFG_QUALIFICATION_PLAN_COMPLETE_NOT_RUN", "sha256": hashlib.sha256(path.read_bytes()).hexdigest()}))
