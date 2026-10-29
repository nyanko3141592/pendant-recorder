"""Fail closed on the HW-V1.0 1GB case model."""
import hashlib
import json
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
review = json.loads((HERE / "case-pebble-v5-review.json").read_text())

assert review["version"] == "HW-V1.0-CASE-PEBBLE-V5-1GB"
assert "NOT_PHYSICALLY_QUALIFIED" in review["status"]
assert review["complete_bbox_mm"][0] < 30.0
assert review["complete_bbox_mm"][1] < 36.5
assert review["complete_bbox_mm"][2] < 13.0
assert review["rounding_mm"] == {"plan_vertical_edges": 3.0, "top_bottom_perimeter_edges": 1.5}
assert review["lanyard"]["hole_axis"] == "X"
assert review["lanyard"]["hole_diameter_mm"] == 3.2
assert review["lanyard"]["minimum_radial_ligament_mm"] >= 1.4
assert review["lanyard"]["construction"].startswith("integral with lower shell")
assert review["usb"]["connector_model_front_y_mm"] == review["usb"]["local_bezel_y_mm"]
assert review["usb"]["bezel_to_connector_face_mm"] == 0.0
assert review["storage"]["mpn"] == "MKDV8GIL-AST"
assert review["storage"]["case_growth_required_mm"] == 0.0
assert review["printing"]["hole_axis_parallel_to_printer_build_z"] is True
for key in ("lower_to_internals_mm3", "upper_to_internals_mm3", "lug_to_internals_mm3"):
    assert review["checks"][key] < 1e-4, (key, review["checks"][key])
for relative, expected in {**review["outputs_sha256"], **review["sources_sha256"]}.items():
    path = ROOT / relative
    assert path.is_file(), relative
    assert hashlib.sha256(path.read_bytes()).hexdigest() == expected, relative

print("PASS: HW-V1.0 v5 case, 1GB envelope, rounded body, transverse integral bail and flush USB face")
