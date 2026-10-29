"""Add the prototype neck-cord loop and export the complete case candidate."""
from __future__ import annotations

import hashlib
import json
from pathlib import Path

import cadquery as cq


HERE = Path(__file__).resolve().parent
MECH = HERE.parent
ROOT = MECH.parents[1]


def load(path: Path):
    shape = cq.importers.importStep(str(path)).val()
    assert shape.isValid(), path
    return shape


def sha(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


lower_source = MECH / "rounded-glue-reinforced-lower-study.step"
upper_source = MECH / "rounded-glue-reinforced-upper-study.step"
internals_source = HERE / "integrated-assembly-v1.step"
lower_base = load(lower_source)
upper_base = load(upper_source)
internals = load(internals_source)

# A rounded tab extends from the edge opposite USB.  The 2.5 mm cord hole is
# vertical so it prints without a horizontal bridge when each shell half is
# placed on its broad exterior face.  The 1.25 mm minimum radial wall is about
# three 0.4 mm extrusion widths.  Both halves contain the tab, so the seam has
# useful bonding area; actual cord proof-load remains a physical test gate.
cx, cy = 12.0, 2.80
outer_r = 2.50
hole_r = 1.25
zmin = lower_base.BoundingBox().zmin
zmax = upper_base.BoundingBox().zmax
height = zmax - zmin
outer = (
    cq.Workplane("XY", origin=(0, 0, zmin))
    .circle(outer_r)
    .extrude(height)
    .val()
    .translate((cx, cy, 0))
)
bridge = (
    cq.Workplane("XY", origin=(9.5, 0.30, zmin))
    .rect(5.0, 3.0, centered=False)
    .extrude(height)
    .val()
)
hole = (
    cq.Workplane("XY", origin=(0, 0, zmin - 0.5))
    .circle(hole_r)
    .extrude(height + 1.0)
    .val()
    .translate((cx, cy, 0))
)
tab = outer.fuse(bridge).cut(hole)

# Clip the shared tab at the existing mating plane.  A tiny overlap makes the
# Boolean union robust without changing the reported external dimensions.
seam_z = 0.4
lower_clip = cq.Workplane("XY", origin=(-100, -100, zmin - 1)).rect(200, 200, centered=False).extrude(seam_z - zmin + 1.001).val()
upper_clip = cq.Workplane("XY", origin=(-100, -100, seam_z - 0.001)).rect(200, 200, centered=False).extrude(zmax - seam_z + 1.001).val()
lower = lower_base.fuse(tab.intersect(lower_clip)).cut(hole)
upper = upper_base.fuse(tab.intersect(upper_clip)).cut(hole)
assert lower.isValid() and len(lower.Solids()) == 1
assert upper.isValid() and len(upper.Solids()) == 1

paths = {
    "lower_step": HERE / "case-lower-v1.step",
    "upper_step": HERE / "case-upper-v1.step",
    "lower_stl": HERE / "case-lower-v1.stl",
    "upper_stl": HERE / "case-upper-v1.stl",
}
cq.exporters.export(lower, str(paths["lower_step"]))
cq.exporters.export(upper, str(paths["upper_step"]))
cq.exporters.export(lower, str(paths["lower_stl"]), tolerance=.02, angularTolerance=.1)
cq.exporters.export(upper, str(paths["upper_stl"]), tolerance=.02, angularTolerance=.1)

assembled = cq.Assembly(name="xe_prototype_v1_complete_case")
assembled.add(lower, name="lower", color=cq.Color(.65, .68, .72))
assembled.add(internals, name="internals", color=cq.Color(.25, .55, .35))
assembled.add(upper, name="upper", color=cq.Color(.75, .78, .82))
paths["assembly_step"] = HERE / "case-assembly-v1.step"
assembled.export(str(paths["assembly_step"]))

exploded = cq.Assembly(name="xe_prototype_v1_complete_case_exploded")
exploded.add(lower.translate((0, 0, -12)), name="lower", color=cq.Color(.65, .68, .72))
exploded.add(internals, name="internals", color=cq.Color(.25, .55, .35))
exploded.add(upper.translate((0, 0, 12)), name="upper", color=cq.Color(.75, .78, .82))
paths["exploded_step"] = HERE / "case-exploded-v1.step"
exploded.export(str(paths["exploded_step"]))

shell = lower.fuse(upper)
bb = shell.BoundingBox()
tab_internal_overlap = tab.intersect(internals).Volume()

# Functional openings are far from the new top-centre feature: USB is on the
# opposite y edge and the mic duct is near x=21.93/y=-4.565.  Distances below
# are planar conservative distances from their documented centre points to the
# outer tab solid, not a substitute for connector/cable motion testing.
usb_center = cq.Vertex.makeVertex(12.0, -22.495, seam_z)
mic_center = cq.Vertex.makeVertex(21.93, -4.565, seam_z)

report = {
    "version": "XE-PROTOTYPE-V1",
    "status": "COMPLETE_EXTERIOR_CANDIDATE_EXPORTED_NOT_PHYSICALLY_QUALIFIED",
    "complete_exterior_bbox_mm": [bb.xlen, bb.ylen, bb.zlen],
    "complete_exterior_bounds_mm": [bb.xmin, bb.xmax, bb.ymin, bb.ymax, bb.zmin, bb.zmax],
    "process_target": "Bambu Lab A1 mini, PLA, 0.4mm nozzle",
    "closure": "Glue at the existing case mating seam only",
    "neck_cord_feature": {
        "type": "integral two-half rounded tab with vertical through-hole",
        "center_xy_mm": [cx, cy],
        "hole_diameter_mm": 2 * hole_r,
        "outer_diameter_mm": 2 * outer_r,
        "minimum_radial_wall_mm": outer_r - hole_r,
        "seam_note": "Bond both tab halves over their full mating annulus/bridge; proof-load physically before wear.",
    },
    "geometry_checks": {
        "lower_single_valid_solid": True,
        "upper_single_valid_solid": True,
        "tab_internal_intersection_mm3": tab_internal_overlap,
        "tab_to_usb_center_distance_mm": tab.distance(usb_center),
        "tab_to_mic_center_distance_mm": tab.distance(mic_center),
    },
    "outputs_sha256": {str(path.relative_to(ROOT)): sha(path) for path in paths.values()},
    "sources_sha256": {str(path.relative_to(ROOT)): sha(path) for path in [lower_source, upper_source, internals_source]},
    "release_gates": [
        "Slice both final STLs with the exact A1 mini/PLA/0.4mm profile.",
        "Print and inspect seam fit, USB insertion, microphone opening, LED visibility and plug/harness assembly motion.",
        "Proof-load the cord loop and bonded seam in all wear directions; CAD wall width is not strength qualification.",
        "Verify acoustic response and that adhesive cannot enter the microphone duct or device interior.",
        "Verify sensor-pad compression, pouch pressure, thermal response and battery swelling clearance physically.",
    ],
}
(HERE / "case-v1-review.json").write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n")
print(json.dumps({"status": report["status"], "bbox_mm": report["complete_exterior_bbox_mm"], "checks": report["geometry_checks"]}))
