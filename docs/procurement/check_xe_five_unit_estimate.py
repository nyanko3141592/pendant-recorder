#!/usr/bin/env python3
from pathlib import Path
import json

ROOT = Path(__file__).resolve().parents[2]
report = json.loads((ROOT / "docs/procurement/xe-five-unit-current-estimate.json").read_text())
assert report["status"] == "PARTIAL_PUBLIC_PRICE_ESTIMATE_NOT_QUOTE_COMPLETE_TOTAL_NULL"
assert report["units"] == 5 and len(report["rows"]) == 36
assert report["assembly_route"] == "JLCPCB Standard PCBA double-sided"
assert report["ordered_carriers"] == 5 and report["carrier_mm"] == [70, 70] and report["finished_units_per_carrier"] == 1
assert report["public_parts_minimum_purchase_subtotal_USD"] > report["installed_quantity_arithmetic_USD_not_purchase_total"]
assert len(report["partial_assembly_scenarios_USD"]) == 2
assert report["installed_quantity_plus_partial_assembly_scenario_USD"][0] < report["parts_library_prepurchase_plus_partial_assembly_scenario_USD"][0]
assert report["complete_five_unit_landed_USD"] is None
cord = report["buyer_supplied_breakaway_cord_candidate"]
assert cord["model"] == "RNST04BK" and cord["jan"] == "4988075710436"
assert cord["units"] == 5
assert cord["observed_public_unit_price_JPY_tax_included_range"] == [382, 581]
assert cord["observed_five_unit_price_JPY_tax_included_range"] == [1910, 2905]
assert cord["included_in_USD_totals"] is False
assert len(report["unknown_costs"]) >= 12
assert any("panel removal" in item for item in report["unknown_costs"])
assert all(row["orderable_flag"] is True for row in report["rows"])
assert report["orders_payments_uploads_vendor_contacts_performed"] is False
text = (ROOT / "docs/procurement/xe-five-unit-current-estimate.md").read_text()
assert "正式見積りではない" in text and "完全着地額" in text and "未取得" in text and "事前購入" in text and "70mmキャリア5枚" in text
assert "RNST04BK safety-breakaway cord ×5" in text and "1,910～2,905" in text
print("PASS_FIVE_UNIT_PARTIAL_ESTIMATE_COMPLETE_TOTAL_FAILS_CLOSED")
