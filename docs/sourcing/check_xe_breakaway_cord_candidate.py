#!/usr/bin/env python3
"""Keep the necklace cord candidate single, retail-sourced and fail-closed."""
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
review = json.loads((ROOT / "docs/sourcing/xe-breakaway-cord-candidate.json").read_text())
assert review["status"] == "SINGLE_RETAIL_CANDIDATE_SELECTED_NOT_ADOPTED_PHYSICAL_FIT_AND_BREAKAWAY_EVT_PENDING"
candidate = review["candidate"]
assert candidate["model"] == "RNST04BK"
assert candidate["jan"] == "4988075710436"
assert candidate["finished_product"] is True
assert candidate["buyer_cut_crimp_or_terminal_work_required"] is False
assert candidate["published_nominal_breakaway_kgf"] == 3.0
assert abs(candidate["published_nominal_breakaway_N_calculated"] - 3.0 * 9.80665) < 1e-9
assert len(review["normal_japan_retail_observations"]) >= 3
assert all(row["url"].startswith("https://") and row["public_price_JPY_tax_included"] > 0 for row in review["normal_japan_retail_observations"])
assert review["fit_boundary"]["case_hole_diameter_mm"] == 3.2
assert review["fit_boundary"]["physical_threading_without_cutting_or_terminal_removal"] == "NOT_VERIFIED"
assert review["safety_boundary"]["approved_product_risk_window_N"] is None
assert review["safety_boundary"]["new_sweat_and_10000_slide_release_tests"] == "NOT_RUN"
assert review["orders_payments_uploads_vendor_contacts_performed"] is False
print("PASS_SINGLE_BREAKAWAY_CORD_CANDIDATE_FAIL_CLOSED_NOT_ADOPTED")
