#!/usr/bin/env python3
"""Fail closed when the local CAM review drifts. This never uploads or orders."""

import csv
import hashlib
import json
from pathlib import Path


HERE = Path(__file__).resolve().parent
sha = lambda path: hashlib.sha256(path.read_bytes()).hexdigest()
active = json.loads((HERE / "active-design.json").read_text())
review = HERE / active["manufacturing_review_directory"]
assert review.is_dir()
assert not list(review.glob("*.zip")) and not list(review.glob("*.tar*"))

manifest = json.loads((review / "prototype-v1-manifest.json").read_text())
guard = json.loads((review / "REVIEW-ONLY.json").read_text())
drills = json.loads((review / "drill-coordinate-review.json").read_text())
orientation = json.loads((review / "assembly-terminal-orientation.json").read_text())
via = json.loads((review / "via-process-intent.json").read_text())
board_hash = sha(HERE / active["board"])

assert manifest["status"] == "PROTOTYPE_V1_LOCAL_CAM_PACKAGE_COMPLETE_FOR_REVIEW_DO_NOT_ORDER"
assert guard["status"] == "ENGINEERING_REVIEW_ONLY_DO_NOT_UPLOAD_OR_ORDER"
assert manifest["source_pcb_sha256"] == guard["source_pcb_sha256"] == board_hash
assert manifest["upload_or_order_performed"] is False
assert manifest["archive_or_upload_package_created"] is False
assert guard["upload_or_order_performed"] is False
assert guard["archive_or_upload_package_created"] is False

actual_manifest_hashes = {
    str(path.relative_to(review)): sha(path)
    for path in sorted(review.rglob("*"))
    if path.is_file() and path.name != "prototype-v1-manifest.json"
}
assert manifest["files_sha256"] == actual_manifest_hashes
actual_guard_hashes = {
    str(path.relative_to(review)): sha(path)
    for path in sorted(review.rglob("*"))
    if path.is_file() and path.name not in ("REVIEW-ONLY.json", "prototype-v1-manifest.json")
}
assert guard["files_sha256"] == actual_guard_hashes

with (review / "positions-assembly-review.csv").open(newline="") as stream:
    position_refs = {row["Ref"] for row in csv.DictReader(stream)}
assert len(position_refs) == manifest["assembly_positions"] == orientation["component_count"] == 68
assert position_refs == set(manifest["jlc_assembled_references"])
assert "TH1" not in position_refs and orientation["external_sensor_positions"] == 0
assert orientation["placement_csv_center_side_rotation_match"] is True
assert drills["pcb_sha256"] == orientation["source_pcb_sha256"] == via["source_pcb_sha256"] == board_hash
assert drills["copper_layers"] == via["copper_layers"] == 6
assert drills["profile_centerline_mm"] == active["pcb_outline_mm"] == [27.5, 27.5]
assert via["hole_over_pad_vias"] == len(via["vias"]) == active["manufacturing_pad_via_flags"] == 4
assert all(item["filled"] and item["capped"] for item in via["vias"])
assert via["physical_acceptance"] == "NOT_RUN" and via["upload_or_order_performed"] is False

print(json.dumps({"status": "PASS_CURRENT_LOCAL_CAM_REVIEW_NOT_RELEASED", "jlc_positions": 68, "pofv": 4, "outline_mm": [27.5, 27.5], "upload_or_order_performed": False}))
