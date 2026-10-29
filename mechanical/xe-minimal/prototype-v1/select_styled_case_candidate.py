"""Record the preferred styled case candidate without claiming physical release."""
from pathlib import Path
import hashlib
import json

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
files = [
    HERE / "case-pebble-r23-lower.step",
    HERE / "case-pebble-r23-upper.step",
    HERE / "case-pebble-r23-lower.stl",
    HERE / "case-pebble-r23-upper.stl",
    HERE / "case-pebble-r23-assembly.step",
    HERE / "styled-case-variants-review.json",
    HERE / "styled-slice-review/review.json",
    HERE / "styled-case-comparison.png",
]
assert all(path.is_file() for path in files)
slice_review = json.loads((HERE / "styled-slice-review/review.json").read_text())
plates = [part["slice_result"]["sliced_plates"][0] for part in slice_review["parts"]]
report = {
    "version": "XE-PROTOTYPE-V1-CASE-R2",
    "status": "PREFERRED_STYLE_CANDIDATE_NOT_PHYSICALLY_QUALIFIED",
    "selection": "pebble-r23",
    "reason": [
        "R2.3 plan corners and R0.8 top/bottom edges are visibly softer than the R1.5/R0.4 baseline without moving any internal component.",
        "The 8x5mm slotted shoulder integrates the neck-cord feature into the silhouette and distributes load better than the circular eyelet geometry.",
        "The recessed USB bezel ends 0.28mm ahead of the connector model front, avoiding the previous 2.13mm case tunnel.",
        "Both shell halves remain valid single solids, retain nominal zero meaningful internal collision, and slice without warnings.",
    ],
    "geometry": {
        "complete_bbox_mm": [26.20186727595198, 33.600933737976, 12.973267375951977],
        "plan_corner_radius_mm": 2.3,
        "top_bottom_edge_radius_mm": 0.8,
        "lanyard_outer_mm": [8.0, 5.0],
        "lanyard_slot_mm": [4.0, 1.8],
        "usb_connector_model_front_y_mm": -26.17,
        "usb_recessed_bezel_y_mm": -26.45,
        "usb_outer_bay_mm": [14.0, 7.5],
        "usb_inner_throat_mm": [9.4, 3.6],
    },
    "slice": {
        "process": slice_review["process"],
        "total_filament_g": sum(p["filaments"][0]["total_used_g"] for p in plates),
        "total_minutes": sum(p["total_predication"] for p in plates) / 60,
        "warnings": [p["warning_message"] for p in plates],
    },
    "required_physical_checks": [
        "Try representative straight and right-angle USB-C cables with different overmold widths and lengths.",
        "Verify that plug bending loads are carried by the receptacle/PCB retention design and not by the case bezel.",
        "Print and inspect minimum walls, USB roof/side continuity, seam fit, microphone path and LED window.",
        "Proof-load the bonded slotted shoulder in every expected necklace direction.",
    ],
    "outputs_sha256": {str(path.relative_to(ROOT)): hashlib.sha256(path.read_bytes()).hexdigest() for path in files},
}
(HERE / "styled-case-selection.json").write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n")
print(json.dumps({"status": report["status"], "selection": report["selection"], "slice": report["slice"]}))
