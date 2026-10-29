#!/usr/bin/env python3
"""Build and verify local JLC-format BOM/CPL for the canonical carrier.

The files are review inputs only: this script creates no archive and performs
no upload, order, payment, or vendor contact.
"""
from collections import Counter
from pathlib import Path
import csv
import hashlib
import json

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
CARRIER_DIR = HERE / "canonical-single-carrier-v1"
review = json.loads((CARRIER_DIR / "carrier-review.json").read_text())
cam_dir = CARRIER_DIR / ("cam-review-" + review["carrier_sha256"][:8])
bom_source = ROOT / "docs/procurement/xe-production-bom-2026-10-28.csv"
positions_source = cam_dir / "positions.csv"
bom_output = CARRIER_DIR / "jlc-review-bom.csv"
cpl_output = CARRIER_DIR / "jlc-review-cpl.csv"
manifest_output = CARRIER_DIR / "jlc-bom-cpl-review.json"


def sha(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def write_csv(path: Path, rows: list[dict[str, str]], fields: list[str]) -> None:
    with path.open("w", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=fields, lineterminator="\n")
        writer.writeheader()
        writer.writerows(rows)


with bom_source.open(newline="") as stream:
    source_bom = list(csv.DictReader(stream))
with positions_source.open(newline="") as stream:
    positions = list(csv.DictReader(stream))

jlc_lines = [row for row in source_bom if row["route"].startswith("JLC_")]
ref_to_line: dict[str, dict[str, str]] = {}
for row in jlc_lines:
    assert row["mpn"] and row["jlc_part"] and row["package"]
    refs = [ref.strip() for ref in row["references"].split(",") if ref.strip()]
    assert len(refs) == int(row["qty_per_device"])
    for ref in refs:
        assert ref not in ref_to_line, ref
        ref_to_line[ref] = row

position_refs = [row["Ref"] for row in positions]
assert len(position_refs) == len(set(position_refs)) == 68
assert set(position_refs) == set(ref_to_line)
assert Counter(row["Side"] for row in positions) == {"bottom": 47, "top": 21}
assert not any(ref.startswith(("FID", "TOOL")) for ref in position_refs)

bom_rows = []
for row in jlc_lines:
    refs = [ref.strip() for ref in row["references"].split(",") if ref.strip()]
    bom_rows.append({
        "Comment": row["mpn"],
        "Designator": ",".join(refs),
        "Footprint": row["package"],
        "LCSC Part #": row["jlc_part"],
    })

cpl_rows = [{
    "Designator": row["Ref"],
    "Mid X": f'{row["PosX"]}mm',
    "Mid Y": f'{row["PosY"]}mm',
    "Layer": "Top" if row["Side"] == "top" else "Bottom",
    "Rotation": row["Rot"],
} for row in positions]

write_csv(bom_output, bom_rows, ["Comment", "Designator", "Footprint", "LCSC Part #"])
write_csv(cpl_output, cpl_rows, ["Designator", "Mid X", "Mid Y", "Layer", "Rotation"])

# Read back the actual emitted files so the manifest proves their structure.
with bom_output.open(newline="") as stream:
    emitted_bom = list(csv.DictReader(stream))
with cpl_output.open(newline="") as stream:
    emitted_cpl = list(csv.DictReader(stream))
emitted_bom_refs = [ref for row in emitted_bom for ref in row["Designator"].split(",")]
assert len(emitted_bom) == 36
assert len(emitted_bom_refs) == len(set(emitted_bom_refs)) == 68
assert set(emitted_bom_refs) == {row["Designator"] for row in emitted_cpl} == set(position_refs)
assert Counter(row["Layer"] for row in emitted_cpl) == {"Bottom": 47, "Top": 21}

manifest = {
    "status": "LOCAL_JLC_BOM_CPL_EXACT_REF_MATCH_REVIEW_ONLY",
    "carrier_sha256": review["carrier_sha256"],
    "source_bom": str(bom_source.relative_to(ROOT)),
    "source_positions": str(positions_source.relative_to(ROOT)),
    "bom_output": str(bom_output.relative_to(ROOT)),
    "cpl_output": str(cpl_output.relative_to(ROOT)),
    "bom_lines": len(emitted_bom),
    "placement_rows": len(emitted_cpl),
    "unique_references": len(set(emitted_bom_refs)),
    "placement_sides": dict(Counter(row["Layer"] for row in emitted_cpl)),
    "mechanical_fiducial_and_tooling_refs_excluded": True,
    "reference_set_exact_match": True,
    "archive_or_upload_package_created": False,
    "orders_payments_uploads_vendor_contacts_performed": False,
    "external_acceptance": "NOT_VERIFIED",
    "required_before_release": [
        "Confirm BOM-tool recognition and assembly eligibility for every exact LCSC part in a fresh authenticated session",
        "Confirm all top and bottom placements, rotations and pin-1/polarity in the vendor assembly viewer",
        "Confirm carrier Gerber, drill, BOM and CPL coordinate alignment in vendor DFM/assembly previews",
        "Obtain exact five-carrier fabrication, assembly, POFV, programming, inspection and depanelization quotation",
    ],
    "sha256": {
        str(bom_source.relative_to(ROOT)): sha(bom_source),
        str(positions_source.relative_to(ROOT)): sha(positions_source),
        str(bom_output.relative_to(ROOT)): sha(bom_output),
        str(cpl_output.relative_to(ROOT)): sha(cpl_output),
    },
}
manifest_output.write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + "\n")
print(json.dumps({"status": manifest["status"], "bom_lines": 36, "placements": 68}))
