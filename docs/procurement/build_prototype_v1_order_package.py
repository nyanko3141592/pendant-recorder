"""SUPERSEDED historical package builder; deliberately fails closed.

The source set in this file predates the canonical U585/TPS22950/pack-NTC
design.  It is retained only to explain the historical package and must never
regenerate manufacturing data.  Use build_xe_canonical_local_review_package.py.
"""
from __future__ import annotations

import csv
import hashlib
import json
import shutil
import zipfile
from collections import defaultdict
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
HW = ROOT / "hardware/xe-minimal"
REVIEW = HW / "fabrication-review-1d4b19d9e46e"
OUT = REVIEW / "order-candidate-2026-10-28"
UNITS = 5

DNP = {"Q5", "R45", "R46", "D6", "R32"}
EXTERNAL = set()
NON_COMPONENT = {"J3", "TP1", "TP2", "TP3", "TP5", "TP6"}

OVERRIDE_MPN = {
    "Q6": "DMN2056U-7",
    "Q7": "DMN2056U-7",
    "U13": "MAX4995CAUT+T",
    "TH1": "NCU18XH103F60RB",
}

JLC_PART = {
    "781710003": "C564183",
    "BQ25185DLHR": "C19725033",
    "CC0402JRNPO9BN500": "C576707",
    "CL05A105KP5NNNC": "C14445",
    "CSNP32GCR01-BOW": "C5440134",
    "DMN2056U-7": "C332302",
    "DMN63D8L-7": "C338876",
    "IM69D130V01XTSA1": "C9900015304",
    "NCU18XH103F60RB": "C440252",
    "RC0402FR-074K7L": "C105871",
    "SN74HCS74DYYR": "C5212335",
    "STM32U535CEU6": "C22454224",
    "TLV7042DDFR": "C2867856",
    "TLV803EB29DBZR": "C2869935",
    "TPS22916CYFPR": "C2680319",
    "TPS7A0233PDBVR": "C2887324",
    "USB4105-GF-A": "C3020560",
    "USBLC6-2P6": "C15999",
}

# Parts that JLC listed at zero stock in the latest saved observation. They stay
# in the SMT file, but the plan routes their procurement to buyer consignment.
JLC_PREORDER_OR_MANUAL = {
    "STM32U535CEU6",
    "IM69D130V01XTSA1",
    "TLV7042DDFR",
    "USB4105-GF-A",
    "MAX4995CAUT+T",
}

CURRENT_SOURCE = {
    "MAX4995CAUT+T": (1108.0, "JPY", "https://www.digikey.jp/ja/products/detail/analog-devices-inc-maxim-integrated/MAX4995CAUT-T/2137383"),
    "IM69D130V01XTSA1": (429.0, "JPY", "https://www.digikey.jp/en/products/detail/infineon-technologies/IM69D130V01XTSA1/IM69D130V01XTSA1CT-ND/8030734"),
    "USB4105-GF-A": (131.0, "JPY", "https://www.digikey.jp/ja/products/detail/gct/USB4105-GF-A/11198441"),
    "SN74HCS74DYYR": (49.0, "JPY", "https://www.digikey.jp/en/products/detail/texas-instruments/SN74HCS74DYYR/16184246"),
    "NCU18XH103F60RB": (23.0, "JPY", "https://jlcpcb.com/partdetail/NCU18XH103F60RB/C440252"),
}


def read_csv(path: Path) -> list[dict[str, str]]:
    with path.open(newline="") as stream:
        return list(csv.DictReader(stream))


def write_csv(path: Path, rows: list[dict], fields: list[str]) -> None:
    with path.open("w", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)


def sha(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main() -> None:
    raise SystemExit(
        "SUPERSEDED_DO_NOT_RUN: old U535/MAX4995/case-v2 package; "
        "use build_xe_canonical_local_review_package.py"
    )
    if OUT.exists():
        shutil.rmtree(OUT)
    OUT.mkdir(parents=True)

    engineering = read_csv(REVIEW / "bom.csv")
    eng_by_ref = {row["Reference"]: row for row in engineering}
    demand = read_csv(ROOT / "docs/procurement/prototype-v1-five-unit-installed-demand.csv")
    ref_mpn: dict[str, str] = {}
    for row in demand:
        for ref in row["references"].split():
            ref_mpn[ref] = row["candidate_mpn"]
    ref_mpn.update(OVERRIDE_MPN)

    positions = read_csv(REVIEW / "positions-raw.csv")
    assembled_positions = [row for row in positions if row["Ref"] not in DNP | NON_COMPONENT]
    assembled_refs = {row["Ref"] for row in assembled_positions}
    missing = sorted(assembled_refs - ref_mpn.keys())
    assert not missing, f"Missing exact MPN mapping: {missing}"

    grouped: dict[tuple[str, str, str], list[str]] = defaultdict(list)
    for ref in sorted(assembled_refs):
        mpn = ref_mpn[ref]
        grouped[(mpn, eng_by_ref[ref]["Footprint"], JLC_PART.get(mpn, ""))].append(ref)
    jlc_bom = [
        {
            "Comment": mpn,
            "Designator": ",".join(refs),
            "Footprint": footprint,
            "LCSC Part #": lcsc,
        }
        for (mpn, footprint, lcsc), refs in sorted(grouped.items())
    ]
    write_csv(OUT / "bom-jlc.csv", jlc_bom, ["Comment", "Designator", "Footprint", "LCSC Part #"])

    cpl = [
        {
            "Designator": row["Ref"],
            "Mid X": f'{row["PosX"]}mm',
            "Mid Y": f'{row["PosY"]}mm',
            "Layer": "Top" if row["Side"] == "top" else "Bottom",
            "Rotation": row["Rot"],
        }
        for row in assembled_positions
    ]
    write_csv(OUT / "cpl-jlc.csv", cpl, ["Designator", "Mid X", "Mid Y", "Layer", "Rotation"])

    old_cost = json.loads((ROOT / "docs/procurement/v15-five-unit-cost-review.json").read_text())
    price = {
        row["mpn"]: (
            row["reference_unit_price_ex_tax_JPY"],
            "JPY",
            row["source_url"],
        )
        for row in old_cost["rows"]
        if row.get("reference_unit_price_ex_tax_JPY") is not None
    }
    price.update(CURRENT_SOURCE)

    plan = []
    for (mpn, footprint, lcsc), refs in sorted(grouped.items()):
        unit_price, currency, source = price.get(mpn, (None, "JPY", ""))
        route = "JLC_PREORDER_OR_MANUAL_MATCH" if mpn in JLC_PREORDER_OR_MANUAL else "JLC_STOCK_SMT"
        installed = len(refs) * UNITS
        plan.append({
            "route": route,
            "mpn": mpn,
            "jlc_part": lcsc,
            "references": " ".join(refs),
            "footprint": footprint,
            "qty_per_device": len(refs),
            "installed_qty_5": installed,
            "procurement_qty": "JLC quote",
            "unit_price_reference": unit_price if unit_price is not None else "",
            "currency": currency,
            "line_total_reference": round(unit_price * installed, 2) if unit_price is not None else "",
            "source_url": source,
            "status": "REFERENCE_PRICE_RECHECK_AT_CHECKOUT" if unit_price is not None else "PRICE_FROM_JLC_QUOTE_REQUIRED",
        })

    for ref in sorted(DNP):
        plan.append({
            "route": "DNP",
            "mpn": "DNP",
            "jlc_part": "",
            "references": ref,
            "footprint": eng_by_ref[ref]["Footprint"],
            "qty_per_device": 0,
            "installed_qty_5": 0,
            "procurement_qty": 0,
            "unit_price_reference": 0,
            "currency": "JPY",
            "line_total_reference": 0,
            "source_url": "",
            "status": "FIXED_INPUT_LIMIT_PROTOTYPE; LED OMITTED",
        })
    plan.extend([
        {"route": "BUYER_FINAL_ASSEMBLY", "mpn": "DTP401525-XE", "jlc_part": "", "references": "BAT1", "footprint": "110mAh 3-wire pack", "qty_per_device": 1, "installed_qty_5": 5, "procurement_qty": 5, "unit_price_reference": 1500, "currency": "JPY", "line_total_reference": 7500, "source_url": "", "status": "USER_SUPPLIED_PACK"},
        {"route": "BUYER_FINAL_ASSEMBLY", "mpn": "PEBBLE_CASE_V2", "jlc_part": "", "references": "CASE", "footprint": "printed enclosure", "qty_per_device": 1, "installed_qty_5": 5, "procurement_qty": 5, "unit_price_reference": 150, "currency": "JPY", "line_total_reference": 750, "source_url": "", "status": "MATERIAL_ONLY_ESTIMATE; PRINT_LOCALLY"},
        {"route": "BUYER_FINAL_ASSEMBLY", "mpn": "CORD_2MM", "jlc_part": "", "references": "CORD", "footprint": "2 mm necklace cord", "qty_per_device": 1, "installed_qty_5": 5, "procurement_qty": 5, "unit_price_reference": 300, "currency": "JPY", "line_total_reference": 1500, "source_url": "", "status": "ESTIMATE; CUT_LENGTH_AFTER_WEAR_TEST"},
    ])
    fields = ["route", "mpn", "jlc_part", "references", "footprint", "qty_per_device", "installed_qty_5", "procurement_qty", "unit_price_reference", "currency", "line_total_reference", "source_url", "status"]
    write_csv(OUT / "procurement-plan.csv", plan, fields)

    fab_zip = OUT / "gerber-drill-jlc.zip"
    with zipfile.ZipFile(fab_zip, "w", zipfile.ZIP_DEFLATED) as archive:
        for folder in (REVIEW / "gerbers", REVIEW / "drill"):
            for path in sorted(folder.iterdir()):
                if path.is_file() and path.suffix.lower() != ".pdf":
                    archive.write(path, path.name)

    buyer_total = sum(float(r["line_total_reference"]) for r in plan if r["route"] == "BUYER_FINAL_ASSEMBLY" and r["line_total_reference"] != "")
    known_all_parts = sum(float(r["line_total_reference"]) for r in plan if r["line_total_reference"] != "")
    manifest = {
        "status": "QUOTE_READY_NOT_PAYMENT_READY",
        "date": "2026-10-28",
        "units": UNITS,
        "source_board_sha256": sha(HW / "pendant-xe-minimal.kicad_pcb"),
        "assembled_placements_per_board": len(assembled_positions),
        "dnp_references": sorted(DNP),
        "external_or_non_component_references": sorted(EXTERNAL | NON_COMPONENT),
        "decisions": [
            "Q5/R45/R46 omitted: fixed low USB input-current limit through R44 only.",
            "Q6/Q7 exact MPN changed to DMN2056U-7.",
            "D6/R32 omitted for prototype because the selected amber LED is unavailable at JLCPCB; status indication is nonessential for bring-up.",
            "TH1 changed from a hand-installed 103JT-025 contact sensor to JLC-stock NCU18XH103F60RB (C440252) on the existing 0603 board land.",
            "No board geometry or case envelope changed.",
        ],
        "reference_costs": {
            "buyer_final_assembly_only_JPY_ex_tax": round(buyer_total, 2),
            "known_all_parts_JPY_ex_tax": round(known_all_parts, 2),
            "jlc_partial_assembly_USD_low": 151.54,
            "jlc_partial_assembly_USD_high": 163.78,
            "jlc_live_pcb_special_process_USD": 103.81,
            "jlc_live_shipping_display_USD": 9.75,
            "excludes": ["JLC component minimums/attrition", "exact PCBA BOM/CPL quote", "tax", "inspection", "programming labor"],
        },
        "jlc_live_quote_observation": {
            "upload_completed": True,
            "login_required_before_bom_cpl_upload": True,
            "detected": "6 layers, 27 x 24 mm",
            "selected": ["0.8 mm", "ENIG", "0.15 mm/(0.25/0.3 mm)", "Epoxy Filled & Capped", "JLC06081H-2116", "Standard PCBA", "Both Sides"],
            "pcb_and_selected_process_USD": 103.81,
            "shipping_display_USD": 9.75,
            "pcba_components_and_assembly": "not calculated before login and BOM/CPL upload",
        },
        "remaining_checkout_gates": [
            "JLC CAM/DFM acceptance for 14 specified filled/planarized/copper-capped vias, including 13 pad-overlap vias.",
            f"JLC BOM/CPL preview: confirm all {len(assembled_positions)} placements, bottom-side mirror convention, rotations and pin 1.",
            "JLC pre-order/manual-match acceptance for zero-stock or non-library parts; no buyer consignment is planned.",
            "Physical first print, USB-C plug clearance, battery/header polarity, and necklace load test.",
            "Bench-check temperature lag and trip behavior of the board-mounted NCU sensor against actual battery temperature.",
        ],
        "files_sha256": {},
    }
    for path in sorted(OUT.iterdir()):
        if path.is_file() and path.name != "order-manifest.json":
            manifest["files_sha256"][path.name] = sha(path)
    (OUT / "order-manifest.json").write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + "\n")
    print(json.dumps({"output": str(OUT), "placements": len(assembled_positions), "bom_lines": len(jlc_bom), "known_parts_JPY": known_all_parts}, ensure_ascii=False))


if __name__ == "__main__":
    main()
