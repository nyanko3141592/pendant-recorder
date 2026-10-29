#!/usr/bin/env python3
"""Fail closed if the canonical safety limiter or its substitution policy drifts."""
from pathlib import Path
import csv
import json

ROOT = Path(__file__).resolve().parents[2]
review = json.loads((ROOT / "docs/procurement/xe-tps2552-continuity-review.json").read_text())
bom = list(csv.DictReader((ROOT / "hardware/xe-minimal/bom.csv").open()))
u13 = next(row for row in bom if row["Reference"] == "U13")
production = list(csv.DictReader((ROOT / "docs/procurement/xe-production-bom-2026-10-28.csv").open()))
production_u13 = next(row for row in production if "U13" in {ref.strip() for ref in row["references"].split(",")})

assert review["status"] == "PRIMARY_ACTIVE_AND_PUBLICLY_ORDERABLE_ALTERNATES_FAIL_CLOSED"
assert review["canonical"]["mpn"] == u13["Part/value"] == production_u13["mpn"] == "TPS2552DBVR-1"
assert review["canonical"]["lcsc"] == production_u13["jlc_part"] == "C140331"
assert review["canonical"]["enable_polarity"] == "active_low"
assert review["canonical"]["overcurrent_response"] == "latch_off"
assert review["canonical"]["jlc_public_stock"] >= 5
assert review["canonical"]["jlc_minimum_order_quantity"] == 1
assert set(review["canonical"]["jlc_pcba"]) == {"Economic", "Standard"}
assert all(item["allowed_substitution"] is False for item in review["manufacturer_orderable_variants"])
not_drop_in = {item["mpn"]: item for item in review["explicitly_not_drop_in"]}
assert not_drop_in["TPS2553DBVR-1"]["enable_polarity"] == "active_high"
assert not_drop_in["TPS2553DBVR-1"]["allowed_substitution"] is False
assert any("No automatic alternate" in rule for rule in review["release_rules"])
assert any("new hardware revision" in rule for rule in review["release_rules"])
assert review["orders_payments_uploads_vendor_contacts_performed"] is False
print("PASS_TPS2552_PRIMARY_CONTINUITY_AND_FAIL_CLOSED_SUBSTITUTION_POLICY")
