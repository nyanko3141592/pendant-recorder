#!/usr/bin/env python3
"""Inventory the unarchived carrier CAM review without making an upload package."""
from pathlib import Path
from collections import Counter
import csv
import hashlib
import json
import re

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
carrier_dir = HERE / "canonical-single-carrier-v1"
review = json.loads((carrier_dir / "carrier-review.json").read_text())
equivalence = json.loads((carrier_dir / "carrier-equivalence-review.json").read_text())
cam = carrier_dir / ("cam-review-" + review["carrier_sha256"][:8])
carrier = ROOT / review["carrier"]
assert equivalence["status"] == "PASS_CANONICAL_CARRIER_DRC_ZERO_AND_UNIT_SERIALIZATION_EQUAL"
assert hashlib.sha256(carrier.read_bytes()).hexdigest() == review["carrier_sha256"]

required_gerbers = {
    "carrier-F_Cu.gtl", "carrier-In1_Cu.g1", "carrier-In2_Cu.g2", "carrier-In3_Cu.g3", "carrier-In4_Cu.g4", "carrier-B_Cu.gbl",
    "carrier-F_Paste.gtp", "carrier-B_Paste.gbp", "carrier-F_Silkscreen.gto", "carrier-B_Silkscreen.gbo",
    "carrier-F_Mask.gts", "carrier-B_Mask.gbs", "carrier-Edge_Cuts.gm1",
}
names = {path.name for path in cam.iterdir() if path.is_file()}
assert required_gerbers <= names
assert {"carrier-PTH.drl", "carrier-NPTH.drl", "positions.csv", "drill-report.txt"} <= names

with (cam / "positions.csv").open(newline="") as stream:
    positions = list(csv.DictReader(stream))
assert len(positions) == 68
assert Counter(row["Side"] for row in positions) == {"bottom": 47, "top": 21}
assert not any(row["Ref"].startswith(("FID", "TOOL")) for row in positions)

drill_text = (cam / "drill-report.txt").read_text()
assert "Total plated holes count 231" in drill_text
assert "Total unplated holes count 6" in drill_text
assert re.search(r"T3\s+2\.000mm.*\(3 holes\)", drill_text)

files = sorted(path for path in cam.iterdir() if path.is_file())
manifest = {
    "status": "CARRIER_CAM_REVIEW_COMPLETE_NOT_ARCHIVED_NOT_UPLOADED",
    "carrier": str(carrier.relative_to(ROOT)),
    "carrier_sha256": review["carrier_sha256"],
    "cam_directory": str(cam.relative_to(ROOT)),
    "gerber_layers": len(required_gerbers),
    "placement_rows": len(positions),
    "placement_sides": dict(Counter(row["Side"] for row in positions)),
    "plated_holes": 231,
    "unplated_holes": 6,
    "carrier_tooling_holes_2mm": 3,
    "archive_or_upload_package_created": False,
    "orders_payments_uploads_vendor_contacts_performed": False,
    "files_sha256": {path.name: hashlib.sha256(path.read_bytes()).hexdigest() for path in files},
    "remaining": ["finite router/tool compensation acceptance", "tab stiffness and depanelization qualification", "supplier DFM and exact quote"],
}
(carrier_dir / "carrier-cam-review.json").write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + "\n")
print(json.dumps({"status": manifest["status"], "files": len(files), "positions": len(positions), "drills": 237}))
