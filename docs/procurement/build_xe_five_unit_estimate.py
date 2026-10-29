#!/usr/bin/env python3
"""Combine public part-price and assembly arithmetic without inventing a landed quote."""
from pathlib import Path
import hashlib
import json

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / "docs/procurement"
snapshot_path = OUT / "xe-jlc-public-snapshot.json"
assembly_path = OUT / "xe-current-assembly-cost.json"
cord_path = ROOT / "docs/sourcing/xe-breakaway-cord-candidate.json"
snapshot = json.loads(snapshot_path.read_text())
assembly = json.loads(assembly_path.read_text())
cord = json.loads(cord_path.read_text())
items = snapshot["items"]
assert snapshot["summary"]["requested"] == 36
assert snapshot["summary"]["exact_model_matches"] == 36
assert snapshot["summary"]["prices_for_five_unit_qty"] == 36
assert snapshot["summary"]["orderable_flags_true"] == 36
assert all(item["orderable_flag"] is True for item in items)
assert all(item["extended_five_USD"] is not None for item in items)
assert assembly["units"] == 5 and len(assembly["scenarios"]) == 2
assert cord["candidate"]["model"] == "RNST04BK"
cord_prices_jpy = [row["public_price_JPY_tax_included"] for row in cord["normal_japan_retail_observations"]]
assert len(cord_prices_jpy) >= 3 and all(price > 0 for price in cord_prices_jpy)
cord_five_jpy = [5 * min(cord_prices_jpy), 5 * max(cord_prices_jpy)]

parts_minimum_purchase = round(sum(item["extended_five_USD"] for item in items), 4)
installed_arithmetic = round(sum(item["five_unit_installed_qty"] * item["applicable_unit_price_USD"] for item in items), 4)
assembly_values = [scenario["partial_assembly_USD"] for scenario in assembly["scenarios"]]
installed_partial = [round(installed_arithmetic + value, 4) for value in assembly_values]
prepurchase_partial = [round(parts_minimum_purchase + value, 4) for value in assembly_values]
rows = [{
    "mpn": item["expected_mpn"], "jlc_part": item["jlc_part"],
    "installed_five": item["five_unit_installed_qty"],
    "minimum_billed_purchase_five": item["five_unit_billed_purchase_qty"],
    "excess_after_five": item["five_unit_billed_purchase_qty"] - item["five_unit_installed_qty"],
    "public_unit_price_USD": item["applicable_unit_price_USD"],
    "public_extended_USD": item["extended_five_USD"],
    "orderable_flag": item["orderable_flag"],
} for item in items]
unknown = ["bare PCB fabrication", "four POFV process", "actual PCBA feeder/attrition/manual classifications",
           "five 70x70mm carrier fabrication", "JLCPCB pre-shipment panel removal and edge inspection",
           "inspection and X-ray", "factory programming fixture, UID/serial capture and labor", "DTP401525-XE batteries",
           "case", "RNST04BK physical fit, release-force qualification and future retail-price continuity",
           "freight", "tax", "exchange-rate effects"]
report = {
    "status": "PARTIAL_PUBLIC_PRICE_ESTIMATE_NOT_QUOTE_COMPLETE_TOTAL_NULL",
    "units": 5,
    "assembly_route": assembly["assembly_route"],
    "ordered_carriers": assembly["ordered_carriers"],
    "carrier_mm": assembly["carrier_mm"],
    "finished_units_per_carrier": assembly["finished_units_per_carrier"],
    "currency": "USD",
    "public_parts_minimum_purchase_subtotal_USD": parts_minimum_purchase,
    "installed_quantity_arithmetic_USD_not_purchase_total": installed_arithmetic,
    "partial_assembly_scenarios_USD": assembly_values,
    "installed_quantity_plus_partial_assembly_scenario_USD": [min(installed_partial), max(installed_partial)],
    "parts_library_prepurchase_plus_partial_assembly_scenario_USD": [min(prepurchase_partial), max(prepurchase_partial)],
    "complete_five_unit_landed_USD": None,
    "buyer_supplied_breakaway_cord_candidate": {
        "model": cord["candidate"]["model"],
        "jan": cord["candidate"]["jan"],
        "units": 5,
        "observed_public_unit_price_JPY_tax_included_range": [min(cord_prices_jpy), max(cord_prices_jpy)],
        "observed_five_unit_price_JPY_tax_included_range": cord_five_jpy,
        "adoption_status": cord["status"],
        "included_in_USD_totals": False,
    },
    "unknown_costs": unknown,
    "rows": rows,
    "largest_public_extended_costs": sorted(rows, key=lambda row: row["public_extended_USD"], reverse=True)[:8],
    "interpretation": [
        "Minimum billed purchase quantities describe a conservative parts-library pre-purchase scenario and are not proven PCBA-order charges.",
        "Installed-quantity arithmetic is not an orderable total and must not replace minimum-purchase or live-quote values.",
        "The partial assembly scenarios use public rates and CAD pad proxies, not a JLC quotation.",
        "Null complete total is intentional; unknown items must never be treated as zero.",
    ],
    "source_sha256": {str(path.relative_to(ROOT)): hashlib.sha256(path.read_bytes()).hexdigest() for path in (snapshot_path, assembly_path, cord_path)},
    "orders_payments_uploads_vendor_contacts_performed": False,
}
json_path = OUT / "xe-five-unit-current-estimate.json"
json_path.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n")
lines = [
    "# XE prototype v1 — 5台分の現行価格算術", "",
    "> **正式見積りではない。発注禁止。** 公開部品ページと公開実装料金による部分算術で、完全着地額は未取得。", "",
    "| 項目 | 5台分 USD | 扱い |", "|---|---:|---|",
    f"| 実装数×公開単価（部品のみ） | {installed_arithmetic:.2f} | PCBA課金を示す見積りではない |",
    f"| 実装数算術＋部分実装 | {min(installed_partial):.2f}～{max(installed_partial):.2f} | 公開単価と36/44 feeder仮定 |",
    f"| 部品ライブラリ事前購入＋部分実装 | {min(prepurchase_partial):.2f}～{max(prepurchase_partial):.2f} | 公開最低購入数を全行へ適用した保守シナリオ |",
    "| 完全着地額 | **未取得** | 70mmキャリア5枚、POFV、JLC出荷前パネル除去・エッジ検査、書込み、電池、ケース、送料、税等が未算入 |", "",
    "| 購入者側候補 | 5台分 JPY（税込） | 扱い |", "|---|---:|---|",
    f"| RNST04BK safety-breakaway cord ×5 | {cord_five_jpy[0]:,}～{cord_five_jpy[1]:,} | 国内3販売経路の公開単価。穴適合・離脱試験前なのでUSD総額へ未算入 |", "",
    "公開価格の大きい項目:", "", "| MPN | JLC | 実装数 | 公開課金数量 | USD |", "|---|---:|---:|---:|---:|",
]
for row in report["largest_public_extended_costs"]:
    lines.append(f"| {row['mpn']} | {row['jlc_part']} | {row['installed_five']} | {row['minimum_billed_purchase_five']} | {row['public_extended_USD']:.2f} |")
lines += ["", "`公開課金数量`は公開ページの最低購入数を反映した保守的算術で、PCBA BOMツールの正式課金とは限らない。RNST04BKは単一候補であり採用済みではない。完全額がnullの間は発注可と解釈しない。", ""]
(OUT / "xe-five-unit-current-estimate.md").write_text("\n".join(lines))
print(json.dumps({"status": report["status"], "installed_parts": installed_arithmetic, "prepurchase_parts": parts_minimum_purchase, "installed_scenario": report["installed_quantity_plus_partial_assembly_scenario_USD"], "prepurchase_scenario": report["parts_library_prepurchase_plus_partial_assembly_scenario_USD"], "complete": None}))
