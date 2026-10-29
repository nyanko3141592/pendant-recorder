"""Fail closed if the canonical necklace case geometry/report drifts."""
import hashlib
import json
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
review = json.loads((HERE / "case-pebble-v4-review.json").read_text())
profile = json.loads((HERE / "case-pebble-v4-print-profile.json").read_text())
slice_root = HERE / "pebble-v4-slice-review"
slice_review = json.loads((slice_root / "review.json").read_text())

def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

assert review["version"] == "XE-PROTOTYPE-V1-CASE-PEBBLE-V4-PACK-NTC"
assert "NOT_PHYSICALLY_QUALIFIED" in review["status"]
assert review["complete_bbox_mm"][0] < 30.0
assert review["complete_bbox_mm"][1] < 36.5
assert review["rounding_mm"] == {"plan_vertical_edges": 3.0, "top_bottom_perimeter_edges": 1.5}
assert review["lanyard"]["hole_axis"] == "X"
assert review["lanyard"]["hole_diameter_mm"] == 3.2
assert review["lanyard"]["minimum_radial_ligament_mm"] >= 1.4
assert review["lanyard"]["construction"].startswith("integral with lower shell")
assert review["usb"]["connector_model_front_y_mm"] == review["usb"]["local_bezel_y_mm"]
assert review["usb"]["bezel_to_connector_face_mm"] == 0.0
assert review["usb"]["outer_bay_mm"] == [14.0, 7.5]
assert review["printing"]["lower_orientation"].startswith("side face down")
assert review["printing"]["lower_cad_axis_aligned_to_printer_build_z"] == "X"
assert review["printing"]["lower_cad_layer_plane_after_orientation"] == "YZ"
assert review["printing"]["hole_axis_parallel_to_printer_build_z"] is True
assert review["printing"]["lug_hole_cad_axis"] == "X"
assert profile["status"] == "PROTOTYPE_PROFILE_NOT_PHYSICALLY_QUALIFIED"
assert profile["material"].startswith("PETG")
assert profile["nozzle_diameter_mm"] == 0.4 and profile["layer_height_mm"] <= 0.16
assert profile["wall_loops"] >= 6
assert "CAD X/lanyard-hole axis is rotated onto printer build Z" in profile["lower_orientation"]
assert "Gate F" in profile["release_limit"]
assert slice_review["status"] == "PEBBLE_V4_A1_MINI_PETG_SLICE_PASS_NOT_PRINTED"
assert slice_review["case_revision"] == review["version"]
assert slice_review["orientation"]["lower"].startswith("CAD X/hole axis rotated onto build Z")
filament = json.loads((slice_root / "filament-petg-a1.json").read_text())
process = json.loads((slice_root / "process.json").read_text())
assert filament["filament_type"] == ["PETG"]
assert float(filament["filament_density"][0]) > 1.0
assert int(filament["hot_plate_temp"][0]) >= 60
assert int(filament["nozzle_temperature"][0]) >= 230
assert process["curr_bed_type"] == "Textured PEI Plate"
assert process["wall_loops"] == "6" and process["enable_support"] == "1"
assert process["sparse_infill_density"] == "40%"
assert len(slice_review["parts"]) == 2
for part in slice_review["parts"]:
    result = part["slice_result"]
    assert result["return_code"] == 0
    assert result["wall_loops"] == 6
    assert result["sparse_infill_density"] == 40.0
    assert not result["sliced_plates"][0]["warning_message"]
    assert result["sliced_plates"][0]["filaments"][0]["main_used_g"] > 0
    job = slice_root / part["part"]
    for name, expected in part["artifact_sha256"].items():
        assert digest(job / name) == expected, (part["part"], name)
for name, expected in slice_review["profile_sha256"].items():
    assert digest(slice_root / name) == expected, name
CAD_BOOLEAN_NOISE_MM3 = 1e-4
for key in ("lower_to_internals_mm3", "upper_to_internals_mm3", "lug_to_internals_mm3"):
    assert review["checks"][key] < CAD_BOOLEAN_NOISE_MM3, (key, review["checks"][key])
for relative, expected in {**review["outputs_sha256"], **review["sources_sha256"]}.items():
    path = ROOT / relative
    assert path.is_file(), relative
    assert digest(path) == expected, relative

print("PASS: case v4 all-edge rounding, transverse integral lug, PETG six-wall slicing, no meaningful nominal collisions and USB mating-face alignment")
