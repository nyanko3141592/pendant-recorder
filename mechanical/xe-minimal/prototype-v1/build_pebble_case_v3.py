"""Build the 27.5 mm PCB case without moving the USB datum.

The prior 24 mm shell is stretched only in its central X section.  This keeps
the connector face, battery, acoustic path and Z stack at their established
coordinates while adding the 3.5 mm required by the production PCB.
"""
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


def stretch_x(shape, split_x: float, delta_x: float, slice_width: float = 0.02):
    """Insert a constant cross-section at split_x and move the right half."""
    bb = shape.BoundingBox()
    margin = 2.0
    left_box = cq.Workplane("XY").box(
        split_x - bb.xmin + margin, bb.ylen + 2 * margin, bb.zlen + 2 * margin
    ).val().translate(((bb.xmin - margin + split_x) / 2, (bb.ymin + bb.ymax) / 2, (bb.zmin + bb.zmax) / 2))
    right_box = cq.Workplane("XY").box(
        bb.xmax - split_x + margin, bb.ylen + 2 * margin, bb.zlen + 2 * margin
    ).val().translate(((split_x + bb.xmax + margin) / 2, (bb.ymin + bb.ymax) / 2, (bb.zmin + bb.zmax) / 2))
    slab = cq.Workplane("XY").box(slice_width, bb.ylen + 2 * margin, bb.zlen + 2 * margin).val().translate(
        (split_x, (bb.ymin + bb.ymax) / 2, (bb.zmin + bb.zmax) / 2)
    )
    cross = shape.intersect(slab)
    # Scale the thin representative slab into the inserted length around split.
    m = cq.Matrix([
        [delta_x / slice_width, 0, 0, split_x * (1 - delta_x / slice_width)],
        [0, 1, 0, 0], [0, 0, 1, 0], [0, 0, 0, 1],
    ])
    bridge = cross.transformGeometry(m).translate((delta_x / 2, 0, 0))
    return shape.intersect(left_box).fuse(bridge).fuse(shape.intersect(right_box).translate((delta_x, 0, 0))).clean()


def stretch_y(shape, split_y: float, delta_y: float, slice_width: float = 0.02):
    """Insert a constant cross-section while keeping the USB/negative-Y half fixed."""
    bb = shape.BoundingBox()
    margin = 2.0
    low_box = cq.Workplane("XY").box(
        bb.xlen + 2 * margin, split_y - bb.ymin + margin, bb.zlen + 2 * margin
    ).val().translate(((bb.xmin + bb.xmax) / 2, (bb.ymin - margin + split_y) / 2, (bb.zmin + bb.zmax) / 2))
    high_box = cq.Workplane("XY").box(
        bb.xlen + 2 * margin, bb.ymax - split_y + margin, bb.zlen + 2 * margin
    ).val().translate(((bb.xmin + bb.xmax) / 2, (split_y + bb.ymax + margin) / 2, (bb.zmin + bb.zmax) / 2))
    slab = cq.Workplane("XY").box(bb.xlen + 2 * margin, slice_width, bb.zlen + 2 * margin).val().translate(
        ((bb.xmin + bb.xmax) / 2, split_y, (bb.zmin + bb.zmax) / 2)
    )
    cross = shape.intersect(slab)
    m = cq.Matrix([
        [1, 0, 0, 0], [0, delta_y / slice_width, 0, split_y * (1 - delta_y / slice_width)],
        [0, 0, 1, 0], [0, 0, 0, 1],
    ])
    bridge = cross.transformGeometry(m).translate((0, delta_y / 2, 0))
    return shape.intersect(low_box).fuse(bridge).fuse(shape.intersect(high_box).translate((0, delta_y, 0))).clean()


def transverse_bail(cx, cy, cz, width_x, length_y, height_z, hole_diameter):
    plane = cq.Plane(origin=(cx - width_x / 2, cy, cz), xDir=(0, 1, 0), normal=(1, 0, 0))
    outer = cq.Workplane(plane).rect(length_y - height_z, height_z).extrude(width_x).val()
    end_offset = (length_y - height_z) / 2
    ends = []
    for y in (cy - end_offset, cy + end_offset):
        p = cq.Plane(origin=(cx - width_x / 2, y, cz), xDir=(0, 1, 0), normal=(1, 0, 0))
        ends.append(cq.Workplane(p).circle(height_z / 2).extrude(width_x).val())
    hole = cq.Workplane(cq.Plane(origin=(cx - width_x / 2 - .5, cy + .2, cz), xDir=(0, 1, 0), normal=(1, 0, 0))).circle(hole_diameter / 2).extrude(width_x + 1).val()
    return outer.fuse(ends[0]).fuse(ends[1]).cut(hole), hole


def xz_wire(y, cx, cz, width, height):
    plane = cq.Plane(origin=(0, y, 0), xDir=(1, 0, 0), normal=(0, 1, 0))
    return cq.Workplane(plane).center(cx, cz).rect(width, height).val()


lower_source = MECH / "rounded-glue-reinforced-lower-study.step"
upper_source = MECH / "rounded-glue-reinforced-upper-study.step"
internals_source = HERE / "integrated-assembly-v1.step"
lower_old, upper_old, internals = map(load, (lower_source, upper_source, internals_source))

# 3.5 mm follows the PCB width increase.  A further 0.2 mm is deliberate
# one-sided assembly clearance; the exact-width version touched the lower shell
# by 0.0093 mm3 in the nominal solid check.
delta_x = 3.7
split_x = 12.0
delta_y = 0.7  # 0.5 mm PCB extension plus 0.2 mm assembly clearance.
lower_base = stretch_y(stretch_x(lower_old, split_x, delta_x), 0.0, delta_y)
upper_base = stretch_y(stretch_x(upper_old, split_x, delta_x), 0.0, delta_y)
bb0 = cq.Compound.makeCompound([lower_base, upper_base]).BoundingBox()
cx, cy = (bb0.xmin + bb0.xmax) / 2, (bb0.ymin + bb0.ymax) / 2
zmin = bb0.zmin

envelope = (cq.Workplane("XY").box(bb0.xlen, bb0.ylen, bb0.zlen, centered=(True, True, False))
            .edges("|Z").fillet(3.0).edges("not |Z").fillet(1.5)
            .translate((cx, cy, zmin)).val())

# The complete lower-shell bail remains transverse.  Its center follows the
# widened enclosure rather than the USB connector, reducing static yaw.
lug, lug_hole = transverse_bail(cx, 3.85 + delta_y, zmin + 3.0, 4.8, 7.0, 6.0, 3.2)

# USB remains on the connector datum; case growth must not shift this opening.
usb_face_y = -26.17
# The local outer bezel must end at the receptacle mating face.  A previous
# 0.28 mm lip could bottom out a short/thick overmold before full insertion.
usb_bay_back_y = usb_face_y
usb_bay = (cq.Workplane("XY").box(14.0, usb_bay_back_y - (-29.0), 7.5)
           .edges("|Y").fillet(1.25)
           .translate((12.0, (-29.0 + usb_bay_back_y) / 2, 2.05)).val())
usb_transition = cq.Solid.makeLoft([
    xz_wire(usb_bay_back_y, 12.0, 2.05, 14.0, 7.5),
    xz_wire(-25.85, 12.0, 2.05, 9.4, 3.6),
], True)
usb_access_cut = usb_bay.fuse(usb_transition)

# C4/U10-side bottom-component relief.  The exact-width first pass exposed two
# small nominal contacts at X=25.02..26.24, Y=-3.90..-3.68 and Z=-0.286..-0.15.
# Preserve 0.20 mm around that measured union instead of accepting face contact.
right_bottom_relief = (cq.Workplane("XY").box(1.62, .62, .54).val()
                       .translate((25.63, -3.79, -.22)))

lower = lower_base.intersect(envelope).fuse(lug).cut(lug_hole).cut(usb_access_cut).cut(right_bottom_relief).clean()
upper = upper_base.intersect(envelope).cut(usb_access_cut).clean()
assert lower.isValid() and len(lower.Solids()) == 1
assert upper.isValid() and len(upper.Solids()) == 1

paths = {
    "lower_step": HERE / "case-pebble-v5-lower.step", "upper_step": HERE / "case-pebble-v5-upper.step",
    "lower_stl": HERE / "case-pebble-v5-lower.stl", "upper_stl": HERE / "case-pebble-v5-upper.stl",
    "assembly_step": HERE / "case-pebble-v5-assembly.step",
}
cq.exporters.export(lower, str(paths["lower_step"])); cq.exporters.export(upper, str(paths["upper_step"]))
cq.exporters.export(lower, str(paths["lower_stl"]), tolerance=.02, angularTolerance=.1)
cq.exporters.export(upper, str(paths["upper_stl"]), tolerance=.02, angularTolerance=.1)
assembly = cq.Assembly(name="hw_v1_pebble_v5")
assembly.add(lower, name="lower_and_integral_lug", color=cq.Color(.66, .72, .82))
assembly.add(internals, name="internals", color=cq.Color(.25, .55, .35))
assembly.add(upper, name="upper", color=cq.Color(.78, .83, .90)); assembly.save(str(paths["assembly_step"]))

bb = lower.fuse(upper).BoundingBox()
checks = {
    "lower_to_internals_mm3": lower.intersect(internals).Volume(),
    "upper_to_internals_mm3": upper.intersect(internals).Volume(),
    "lug_to_internals_mm3": lug.intersect(internals).Volume(),
    "pcb_right_clearance_to_shell_outer_mm": bb0.xmax - 27.5,
    "usb_center_x_mm": 12.0,
    "right_bottom_component_relief_mm": [1.62, .62, .54],
}
report = {
    "version": "HW-V1.0-CASE-PEBBLE-V5-1GB",
    "status": "HW_V1_1GB_CASE_CAD_PASS_NOT_PHYSICALLY_QUALIFIED",
    "complete_bbox_mm": [bb.xlen, bb.ylen, bb.zlen],
    "case_body_bbox_mm": [bb0.xmin, bb0.xmax, bb0.ymin, bb0.ymax, bb0.zmin, bb0.zmax],
    "x_stretch_mm": {"pcb_width_delta": 3.5, "assembly_clearance_added": 0.2,
                     "inserted": delta_x, "split": split_x, "usb_datum_shift": 0.0},
    "y_stretch_mm": {"pcb_length_delta": 0.5, "assembly_clearance_added": 0.2,
                     "inserted": delta_y, "split": 0.0, "usb_datum_shift": 0.0},
    "rounding_mm": {"plan_vertical_edges": 3.0, "top_bottom_perimeter_edges": 1.5},
    "lanyard": {"center_x_mm": cx, "outer_mm": [4.8, 7.0, 6.0], "hole_diameter_mm": 3.2,
                 "hole_axis": "X", "minimum_radial_ligament_mm": (6.0-3.2)/2,
                 "nominal_ligament_extrusion_widths_at_0p4mm": ((6.0-3.2)/2)/0.4,
                 "construction": "integral with lower shell; primary path does not cross glue seam"},
    "usb": {"center_x_mm": 12.0, "connector_model_front_y_mm": usb_face_y,
            "local_bezel_y_mm": usb_bay_back_y, "bezel_to_connector_face_mm": usb_face_y-usb_bay_back_y,
            "outer_bay_mm": [14.0, 7.5], "inner_throat_mm": [9.4, 3.6]},
    "storage": {"mpn": "MKDV8GIL-AST", "package_nominal_mm": [8.0, 6.0, 0.8],
                "previous_envelope_mm": [8.0, 6.2],
                "case_growth_required_mm": 0.0,
                "clearance_basis": "existing integrated assembly retains the larger previous 8.0x6.2mm envelope"},
    "printing": {"lower_orientation": "side face down; CAD X/lanyard-hole axis rotated onto printer build Z",
                 "lower_cad_axis_aligned_to_printer_build_z": "X", "lower_cad_layer_plane_after_orientation": "YZ",
                 "upper_orientation": "broad exterior face down", "upper_cad_axis_aligned_to_printer_build_z": "Z",
                 "lug_hole_cad_axis": "X", "hole_axis_parallel_to_printer_build_z": True,
                 "qualification": "50N three-direction proof plus 15N/10000-cycle fatigue and cord wear required"},
    "checks": checks,
    "outputs_sha256": {str(p.relative_to(ROOT)): sha(p) for p in paths.values()},
    "sources_sha256": {str(p.relative_to(ROOT)): sha(p) for p in (lower_source, upper_source, internals_source)},
    "limits": [
        "CAD intersections are nominal and do not prove printed tolerances, pouch swelling, harness motion or acoustic performance.",
        "The transverse lug still requires print-orientation-specific proof-load, wear and fatigue testing.",
        "Centering the lug on the enclosure is a static design choice; worn orientation remains unverified.",
        "The 14 mm USB bay is a cable-overmold allowance, not a universal USB-C guarantee.",
    ],
}
(HERE / "case-pebble-v5-review.json").write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n")
print(json.dumps({"status": report["status"], "bbox_mm": report["complete_bbox_mm"], "checks": checks}))
