"""Build a genuinely all-edge-rounded case with print-oriented lanyard lug."""
from __future__ import annotations

from pathlib import Path
import hashlib
import json

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


def vertical_capsule(cx: float, cy: float, width: float, height: float, z0: float, depth: float):
    r = width / 2
    straight = height - 2 * r
    center = cq.Workplane("XY", origin=(cx, cy, z0)).rect(width, straight).extrude(depth).val()
    low = cq.Workplane("XY", origin=(cx, cy - straight / 2, z0)).circle(r).extrude(depth).val()
    high = cq.Workplane("XY", origin=(cx, cy + straight / 2, z0)).circle(r).extrude(depth).val()
    return center.fuse(low).fuse(high)


def transverse_bail(cx: float, cy: float, cz: float, width_x: float, length_y: float,
                    height_z: float, hole_diameter: float):
    """Create a YZ-plane bail whose cord hole runs left-to-right along X."""
    plane = cq.Plane(origin=(cx - width_x / 2, cy, cz), xDir=(0, 1, 0), normal=(1, 0, 0))
    outer = cq.Workplane(plane).rect(length_y - height_z, height_z).extrude(width_x).val()
    end_offset = (length_y - height_z) / 2
    low = cq.Workplane(cq.Plane(origin=(cx - width_x / 2, cy - end_offset, cz), xDir=(0, 1, 0), normal=(1, 0, 0))).circle(height_z / 2).extrude(width_x).val()
    high = cq.Workplane(cq.Plane(origin=(cx - width_x / 2, cy + end_offset, cz), xDir=(0, 1, 0), normal=(1, 0, 0))).circle(height_z / 2).extrude(width_x).val()
    hole = cq.Workplane(cq.Plane(origin=(cx - width_x / 2 - .5, cy + .2, cz), xDir=(0, 1, 0), normal=(1, 0, 0))).circle(hole_diameter / 2).extrude(width_x + 1).val()
    return outer.fuse(low).fuse(high).cut(hole), hole


def xz_wire(y: float, cx: float, cz: float, width: float, height: float):
    plane = cq.Plane(origin=(0, y, 0), xDir=(1, 0, 0), normal=(0, 1, 0))
    return cq.Workplane(plane).center(cx, cz).rect(width, height).val()


lower_source = MECH / "rounded-glue-reinforced-lower-study.step"
upper_source = MECH / "rounded-glue-reinforced-upper-study.step"
internals_source = HERE / "integrated-assembly-v1.step"
lower_base, upper_base, internals = map(load, (lower_source, upper_source, internals_source))
bb0 = cq.Compound.makeCompound([lower_base, upper_base]).BoundingBox()
cx, cy = (bb0.xmin + bb0.xmax) / 2, (bb0.ymin + bb0.ymax) / 2
zmin, zmax = bb0.zmin, bb0.zmax

# Stronger visible rounding on every outside transition.  This removes only
# exterior corner material and never moves the PCB/battery/sensor coordinates.
envelope = (
    cq.Workplane("XY")
    .box(bb0.xlen, bb0.ylen, bb0.zlen, centered=(True, True, False))
    .edges("|Z").fillet(3.0)
    .edges("not |Z").fillet(1.5)
    .translate((cx, cy, zmin))
    .val()
)

# Rotate the complete bail 90 degrees in top view, not merely the slot outline.
# The bail lies in the YZ plane and the 3.2 mm cord passage runs along X.  It is
# entirely part of the lower print (Z <= 0.0), so its primary load path does not
# cross the glue seam.  Its 0.75 mm overlap with the Y=1.3 case wall provides a
# broad fused root while staying outside the internals, which end at Y=0.2.
# Put the bail's broad rear face on the same print plane as the lower shell;
# otherwise the outboard portion would begin as an unsupported floating island.
lug, lug_hole = transverse_bail(12.0, 3.85, zmin + 3.0, 4.8, 7.0, 6.0, 3.2)

# Wide USB bay retained from the connector-drawing-based study.
usb_face_y = -26.17
usb_bay_back_y = -26.45
usb_bay = (
    cq.Workplane("XY")
    .box(14.0, usb_bay_back_y - (-29.0), 7.5)
    .edges("|Y").fillet(1.25)
    .translate((12.0, (-29.0 + usb_bay_back_y) / 2, 2.05))
    .val()
)
usb_bay_wire = xz_wire(usb_bay_back_y, 12.0, 2.05, 14.0, 7.5)
usb_throat_wire = xz_wire(-25.85, 12.0, 2.05, 9.4, 3.6)
usb_transition = cq.Solid.makeLoft([usb_bay_wire, usb_throat_wire], True)
usb_access_cut = usb_bay.fuse(usb_transition)

lower = lower_base.intersect(envelope).fuse(lug).cut(lug_hole).cut(usb_access_cut).clean()
upper = upper_base.intersect(envelope).cut(usb_access_cut).clean()
assert lower.isValid() and len(lower.Solids()) == 1
assert upper.isValid() and len(upper.Solids()) == 1

paths = {
    "lower_step": HERE / "case-pebble-v2-lower.step",
    "upper_step": HERE / "case-pebble-v2-upper.step",
    "lower_stl": HERE / "case-pebble-v2-lower.stl",
    "upper_stl": HERE / "case-pebble-v2-upper.stl",
    "assembly_step": HERE / "case-pebble-v2-assembly.step",
}
cq.exporters.export(lower, str(paths["lower_step"]))
cq.exporters.export(upper, str(paths["upper_step"]))
cq.exporters.export(lower, str(paths["lower_stl"]), tolerance=.02, angularTolerance=.1)
cq.exporters.export(upper, str(paths["upper_stl"]), tolerance=.02, angularTolerance=.1)
assembly = cq.Assembly(name="xe_pebble_v2")
assembly.add(lower, name="lower_and_integral_lug", color=cq.Color(.66, .72, .82))
assembly.add(internals, name="internals", color=cq.Color(.25, .55, .35))
assembly.add(upper, name="upper", color=cq.Color(.78, .83, .90))
assembly.export(str(paths["assembly_step"]))

bb = lower.fuse(upper).BoundingBox()
checks = {
    "lower_to_internals_mm3": lower.intersect(internals).Volume(),
    "upper_to_internals_mm3": upper.intersect(internals).Volume(),
    "lug_to_internals_mm3": lug.intersect(internals).Volume(),
    "lower_valid_single_solid": True,
    "upper_valid_single_solid": True,
}
report = {
    "version": "XE-PROTOTYPE-V1-CASE-PEBBLE-V2",
    "status": "PRINT_ORIENTED_ALL_EDGE_ROUNDED_CANDIDATE_NOT_PHYSICALLY_QUALIFIED",
    "complete_bbox_mm": [bb.xlen, bb.ylen, bb.zlen],
    "rounding_mm": {"plan_vertical_edges": 3.0, "top_bottom_perimeter_edges": 1.5},
    "lanyard": {
        "orientation": "complete bail rotated 90 degrees in top view; hole axis transverse along X",
        "outer_mm": {"width_x": 4.8, "length_y": 7.0, "height_z": 6.0},
        "hole_mm": {"diameter": 3.2, "axis": "X"},
        "construction": "YZ-plane transverse bail integral with lower shell; no upper-shell notch",
        "print_orientation": "lower exterior broad face on bed; 3.2mm horizontal bridge prints without support by slicer check",
        "glue_dependency": "none for primary lug load path",
    },
    "usb": {
        "connector_model_front_y_mm": usb_face_y,
        "recessed_bezel_y_mm": usb_bay_back_y,
        "bezel_ahead_of_connector_mm": usb_face_y - usb_bay_back_y,
        "outer_bay_mm": [14.0, 7.5],
        "inner_throat_mm": [9.4, 3.6],
    },
    "checks": checks,
    "outputs_sha256": {str(path.relative_to(ROOT)): sha(path) for path in paths.values()},
    "sources_sha256": {str(path.relative_to(ROOT)): sha(path) for path in (lower_source, upper_source, internals_source)},
    "limits": [
        "The integral lug improves load direction but still requires printed proof-load and fatigue tests.",
        "R3/R1.5 removes more corner material; slicing must confirm wall continuity and physical printing must confirm strength.",
        "Nominal internal collision checks do not include manufacturing tolerances or the exact battery lead shape.",
        "USB bay width is an engineering cable-overmold allowance, not a universal USB-C guarantee.",
    ],
}
(HERE / "case-pebble-v2-review.json").write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n")
print(json.dumps({"status": report["status"], "bbox_mm": report["complete_bbox_mm"], "checks": checks}))
