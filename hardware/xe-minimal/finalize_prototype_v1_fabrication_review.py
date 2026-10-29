"""Finalize local prototype-v1 CAM review metadata. Never uploads or orders."""
from pathlib import Path
import csv
import hashlib
import json

HERE = Path(__file__).resolve().parent
active_path = HERE / "active-design.json"
active = json.loads(active_path.read_text())
board = HERE / active["board"]
board_hash = hashlib.sha256(board.read_bytes()).hexdigest()
assert board_hash == active["sha256"][board.name]
review = HERE / f"fabrication-review-{board_hash[:12]}"
assert review.is_dir()

production_bom = HERE.parents[1] / "docs/procurement/xe-production-bom-2026-10-28.csv"
with production_bom.open(newline="") as stream:
    production_rows = list(csv.DictReader(stream))
assembled_refs = {
    ref.strip()
    for row in production_rows
    if row["route"].startswith("JLC_")
    for ref in row["references"].split(",")
    if ref.strip()
}
assert len(assembled_refs) == 68

with (review / "positions-raw.csv").open() as stream:
    reader = csv.DictReader(stream)
    fields = reader.fieldnames
    raw_rows = list(reader)
    raw_by_ref = {row["Ref"]: row for row in raw_rows}
    assert assembled_refs <= set(raw_by_ref), sorted(assembled_refs - set(raw_by_ref))
    rows = [raw_by_ref[ref] for ref in sorted(assembled_refs)]
assert len(rows) == 68
with (review / "positions-assembly-review.csv").open("w", newline="") as stream:
    writer = csv.DictWriter(stream, fieldnames=fields)
    writer.writeheader()
    writer.writerows(rows)

active["manufacturing_review_directory"] = review.name
active["manufacturing_export_status"] = "PROTOTYPE_V1_LOCAL_CAM_REEXPORTED_NOT_RELEASED"
active["fabrication_refresh_required"] = False
active["current_export_geometry_review"] = f"{review.name}/REVIEW-ONLY.json"
active_path.write_text(json.dumps(active, ensure_ascii=False, indent=2) + "\n")

# Orientation and drill audits are generated after the initial CAM export.
# Refresh the fail-closed review guard so its inventory covers those files too.
guard_path = review / "REVIEW-ONLY.json"
guard = json.loads(guard_path.read_text())
guard["source_pcb_sha256"] = board_hash
guard["files_sha256"] = {
    str(path.relative_to(review)): hashlib.sha256(path.read_bytes()).hexdigest()
    for path in sorted(review.rglob("*"))
    if path.is_file() and path.name not in ("REVIEW-ONLY.json", "prototype-v1-manifest.json")
}
guard_path.write_text(json.dumps(guard, ensure_ascii=False, indent=2) + "\n")

manifest = {
    "status": "PROTOTYPE_V1_LOCAL_CAM_PACKAGE_COMPLETE_FOR_REVIEW_DO_NOT_ORDER",
    "source_pcb_sha256": board_hash,
    "assembly_positions": len(rows),
    "jlc_assembled_references": sorted(assembled_refs),
    "external_sensor_positions": 0,
    "battery_temperature_sensor": "DTP401525-XE factory pack NTC through J2; no TH1",
    "directory": review.name,
    "files_sha256": {
        str(path.relative_to(review)): hashlib.sha256(path.read_bytes()).hexdigest()
        for path in sorted(review.rglob("*"))
        if path.is_file() and path.name != "prototype-v1-manifest.json"
    },
    "open_manufacturing_gates": [
        "Fabricator approval for six-layer stackup and four published hole-over-pad filled/planarized/copper-capped vias.",
        "Independent CAM visual review and assembler rotation/pin-1 confirmation.",
        "Exact MPN availability, substitutions, feeder quantities, attrition and quotation.",
        "No upload or order is authorized by this review package.",
    ],
    "archive_or_upload_package_created": False,
    "upload_or_order_performed": False,
}
(review / "prototype-v1-manifest.json").write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + "\n")
print(json.dumps({"status": manifest["status"], "positions": len(rows), "files": len(manifest["files_sha256"])}))
