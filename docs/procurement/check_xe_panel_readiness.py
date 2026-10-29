#!/usr/bin/env python3
from pathlib import Path
import hashlib
import json

ROOT = Path(__file__).resolve().parents[2]
r = json.loads((ROOT / "docs/procurement/xe-panel-readiness.json").read_text())
assert r["status"] == "CARRIER_CAD_EQUIVALENCE_AND_CAM_PASS_EXTERNAL_AND_PHYSICAL_QUALIFICATION_HOLD"
assert r["canonical_board_mm"] == [27.5, 27.5]
assert r["placement_sides"] == ["bottom", "top"]
assert r["assembly_route"] == "JLCPCB Standard PCBA"
assert r["minimum_standard_single_or_panel_mm"] == [70, 70]
assert r["edge_rails_required"] is True and r["fiducials_required"] is True
assert r["unit_board_is_directly_standard_pcba_size_eligible"] is False
assert r["finished_product_outline_changes"] is False
assert r["carrier_units_per_ordered_board"] == 1
assert r["requested_finished_units"] == r["required_ordered_carriers_if_accepted"] == 5
assert r["carrier_manufacturing_data"].endswith("carrier.kicad_pcb") and r["carrier_acceptance"] == "NOT_VERIFIED"
assert r["carrier_bom_cpl_review"].endswith("jlc-bom-cpl-review.json")
assert len(r["required_before_release"]) >= 5
for name, expected in r["source_sha256"].items():
    assert hashlib.sha256((ROOT / name).read_bytes()).hexdigest() == expected, name
assert r["orders_payments_uploads_vendor_contacts_performed"] is False
print("PASS_CANONICAL_CARRIER_CAD_CAM_PRESENT_EXTERNAL_AND_PHYSICAL_GATES_FAIL_CLOSED")
