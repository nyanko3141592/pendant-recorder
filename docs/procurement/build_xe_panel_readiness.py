#!/usr/bin/env python3
"""Record the canonical board's JLC Standard-PCBA carrier requirement.

This is deliberately fail-closed.  It does not infer acceptance from a clean
unit-board DRC and it never uploads manufacturing data.
"""
from pathlib import Path
import csv
import hashlib
import json

ROOT = Path(__file__).resolve().parents[2]
HW = ROOT / "hardware/xe-minimal"
active_path = HW / "active-design.json"
active = json.loads(active_path.read_text())
board = HW / active["board"]
review = HW / active["manufacturing_review_directory"]
positions_path = review / "positions-assembly-review.csv"
bom_path = ROOT / "docs/procurement/xe-production-bom-2026-10-28.csv"
positions = list(csv.DictReader(positions_path.open()))
bom = list(csv.DictReader(bom_path.open()))
sides = sorted({row["Side"] for row in positions})
packages = sorted({row["package"] for row in bom if row["route"].startswith("JLC_")})

assert active["pcb_outline_mm"] == [27.5, 27.5]
assert sides == ["bottom", "top"]
assert "0402" in packages

report = {
    "status": "CARRIER_CAD_EQUIVALENCE_AND_CAM_PASS_EXTERNAL_AND_PHYSICAL_QUALIFICATION_HOLD",
    "date": "2026-10-28",
    "canonical_board_mm": active["pcb_outline_mm"],
    "canonical_board_sha256": hashlib.sha256(board.read_bytes()).hexdigest(),
    "placement_sides": sides,
    "assembly_route": "JLCPCB Standard PCBA",
    "route_reason": "double-sided placement; Economic PCBA is single-sided only",
    "minimum_standard_single_or_panel_mm": [70, 70],
    "edge_rails_required": True,
    "fiducials_required": True,
    "unit_board_is_directly_standard_pcba_size_eligible": False,
    "finished_product_outline_changes": False,
    "selected_carrier_strategy": "one finished board per removable 70x70mm carrier",
    "selected_strategy_reason": "preserves exactly five populated product boards and avoids silently buying 8-18 populated boards from a multi-up minimum order",
    "delivery_requirement": "JLCPCB panel removal service selected; five individually separated and edge-inspected product boards delivered",
    "buyer_or_seller_depanelization_allowed": False,
    "carrier_units_per_ordered_board": 1,
    "requested_finished_units": 5,
    "required_ordered_carriers_if_accepted": 5,
    "carrier_manufacturing_data": "hardware/xe-minimal/canonical-single-carrier-v1/carrier.kicad_pcb",
    "carrier_review": "hardware/xe-minimal/canonical-single-carrier-v1/carrier-review.json",
    "carrier_equivalence_review": "hardware/xe-minimal/canonical-single-carrier-v1/carrier-equivalence-review.json",
    "carrier_cam_review": "hardware/xe-minimal/canonical-single-carrier-v1/carrier-cam-review.json",
    "carrier_bom_cpl_review": "hardware/xe-minimal/canonical-single-carrier-v1/jlc-bom-cpl-review.json",
    "carrier_acceptance": "NOT_VERIFIED",
    "required_before_release": [
        "Obtain DFM confirmation of cutter compensation and carrier-side internal radii while preserving the 27.5mm product-side contour",
        "Confirm actual route width and residual-tab geometry against the generated Edge.Cuts",
        "Qualify tab stiffness, depanelization force, burr/residual edge and component clearance",
        "Select JLCPCB panel removal service and require separated-board delivery; do not leave breakout or edge finishing to buyer or seller",
        "Obtain automatic-flow acceptance and exact quotation without treating an old carrier as transferable",
        "Confirm the local 36-line/68-placement BOM/CPL in the live BOM tool and assembly viewer, including every rotation and pin 1",
    ],
    "official_sources": {
        "pcba_capabilities": "https://jlcpcb.com/capabilities/pcb-assembly-capabilities",
        "edge_rails_and_fiducials": "https://jlcpcb.com/help/article/how-to-add-edge-rails-fiducials-for-pcb-assembly-order",
        "panel_removal_service": "https://jlcpcb.com/capabilities/pcb-assembly-capabilities",
    },
    "source_sha256": {
        str(active_path.relative_to(ROOT)): hashlib.sha256(active_path.read_bytes()).hexdigest(),
        str(board.relative_to(ROOT)): hashlib.sha256(board.read_bytes()).hexdigest(),
        str(positions_path.relative_to(ROOT)): hashlib.sha256(positions_path.read_bytes()).hexdigest(),
        str(bom_path.relative_to(ROOT)): hashlib.sha256(bom_path.read_bytes()).hexdigest(),
    },
    "orders_payments_uploads_vendor_contacts_performed": False,
}
carrier_path = ROOT / report["carrier_manufacturing_data"]
carrier_review_path = ROOT / report["carrier_review"]
carrier_equivalence_path = ROOT / report["carrier_equivalence_review"]
carrier_cam_path = ROOT / report["carrier_cam_review"]
carrier_bom_cpl_path = ROOT / report["carrier_bom_cpl_review"]
carrier_review = json.loads(carrier_review_path.read_text())
carrier_equivalence = json.loads(carrier_equivalence_path.read_text())
carrier_cam = json.loads(carrier_cam_path.read_text())
carrier_bom_cpl = json.loads(carrier_bom_cpl_path.read_text())
assert carrier_review["source_sha256"] == report["canonical_board_sha256"]
assert carrier_review["carrier_sha256"] == hashlib.sha256(carrier_path.read_bytes()).hexdigest()
assert carrier_equivalence["status"] == "PASS_CANONICAL_CARRIER_DRC_ZERO_AND_UNIT_SERIALIZATION_EQUAL"
assert carrier_equivalence["carrier_sha256"] == carrier_review["carrier_sha256"]
assert carrier_cam["status"] == "CARRIER_CAM_REVIEW_COMPLETE_NOT_ARCHIVED_NOT_UPLOADED"
assert carrier_cam["carrier_sha256"] == carrier_review["carrier_sha256"]
assert carrier_cam["placement_rows"] == 68 and carrier_cam["carrier_tooling_holes_2mm"] == 3
assert carrier_bom_cpl["status"] == "LOCAL_JLC_BOM_CPL_EXACT_REF_MATCH_REVIEW_ONLY"
assert carrier_bom_cpl["carrier_sha256"] == carrier_review["carrier_sha256"]
assert carrier_bom_cpl["bom_lines"] == 36 and carrier_bom_cpl["placement_rows"] == 68
assert carrier_bom_cpl["reference_set_exact_match"] is True
assert carrier_bom_cpl["external_acceptance"] == "NOT_VERIFIED"
for path in (carrier_path, carrier_review_path, carrier_equivalence_path, carrier_cam_path, carrier_bom_cpl_path):
    report["source_sha256"][str(path.relative_to(ROOT))] = hashlib.sha256(path.read_bytes()).hexdigest()
(ROOT / "docs/procurement/xe-panel-readiness.json").write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n")
print(json.dumps({"status": report["status"], "sides": sides, "carrier": report["carrier_manufacturing_data"]}))
