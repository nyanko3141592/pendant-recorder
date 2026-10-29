"""Create non-adopted, rounder exterior variants around fixed internals."""
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


def capsule(cx: float, cy: float, width: float, height: float, z0: float, depth: float):
    r = height / 2
    straight = width - 2 * r
    center = cq.Workplane("XY", origin=(cx, cy, z0)).rect(straight, height).extrude(depth).val()
    left = cq.Workplane("XY", origin=(cx - straight / 2, cy, z0)).circle(r).extrude(depth).val()
    right = cq.Workplane("XY", origin=(cx + straight / 2, cy, z0)).circle(r).extrude(depth).val()
    return center.fuse(left).fuse(right)


def xz_wire(y: float, cx: float, cz: float, width: float, height: float):
    plane = cq.Plane(origin=(0, y, 0), xDir=(1, 0, 0), normal=(0, 1, 0))
    return cq.Workplane(plane).center(cx, cz).rect(width, height).val()


lower_source = MECH / "rounded-glue-reinforced-lower-study.step"
upper_source = MECH / "rounded-glue-reinforced-upper-study.step"
internals_source = HERE / "integrated-assembly-v1.step"
lower_base, upper_base, internals = map(load, (lower_source, upper_source, internals_source))
combined_bb = cq.Compound.makeCompound([lower_base, upper_base]).BoundingBox()
cx = (combined_bb.xmin + combined_bb.xmax) / 2
cy = (combined_bb.ymin + combined_bb.ymax) / 2
zmin, zmax = combined_bb.zmin, combined_bb.zmax
seam_z = 0.4

# A broad horizontal slot replaces the visually isolated circular eyelet.  The
# stadium overlaps only the outer wall (y >= 0.30), not the fixed internals.
tab_outer = capsule(12.0, 2.80, 8.0, 5.0, zmin, zmax - zmin)
tab_hole = capsule(12.0, 2.85, 4.0, 1.8, zmin - .5, zmax - zmin + 1.0)
tab = tab_outer.cut(tab_hole)

# USB4105 drawing B4: receptacle mouth 8.34 +0.06/-0.02 x
# 2.56 +/-0.04 mm and plug body 6.5 mm max high.  The connector model front
# is y=-26.17 while the old case face is y=-28.30, leaving a 2.13 mm tunnel.
# Recess the central bezel to y=-26.45 (0.28 mm ahead of the model front), then
# taper to a 9.4 x 3.6 mm throat behind the mouth.  The 14 x 7.5 mm outer bay
# is an engineering allowance for wider cable overmolds; width is not specified
# by the connector drawing and remains a physical cable-fit check.
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

lower_clip = cq.Workplane("XY", origin=(-100, -100, zmin - 1)).rect(200, 200, centered=False).extrude(seam_z - zmin + 1.001).val()
upper_clip = cq.Workplane("XY", origin=(-100, -100, seam_z - .001)).rect(200, 200, centered=False).extrude(zmax - seam_z + 1.001).val()

variants = [
    ("soft-r20", 2.0, .65),
    ("pebble-r23", 2.3, .80),
]
reports = []
for name, plan_radius, edge_radius in variants:
    envelope = (
        cq.Workplane("XY")
        .box(combined_bb.xlen, combined_bb.ylen, combined_bb.zlen, centered=(True, True, False))
        .edges("|Z").fillet(plan_radius)
        .edges("not |Z").fillet(edge_radius)
        .translate((cx, cy, zmin))
        .val()
    )
    lower = lower_base.intersect(envelope).fuse(tab.intersect(lower_clip)).cut(tab_hole).cut(usb_access_cut).clean()
    upper = upper_base.intersect(envelope).fuse(tab.intersect(upper_clip)).cut(tab_hole).cut(usb_access_cut).clean()
    assert lower.isValid() and len(lower.Solids()) == 1
    assert upper.isValid() and len(upper.Solids()) == 1

    lower_intersection = lower.intersect(internals).Volume()
    upper_intersection = upper.intersect(internals).Volume()
    tab_intersection = tab.intersect(internals).Volume()
    paths = {
        "lower_step": HERE / f"case-{name}-lower.step",
        "upper_step": HERE / f"case-{name}-upper.step",
        "lower_stl": HERE / f"case-{name}-lower.stl",
        "upper_stl": HERE / f"case-{name}-upper.stl",
        "assembly_step": HERE / f"case-{name}-assembly.step",
    }
    cq.exporters.export(lower, str(paths["lower_step"]))
    cq.exporters.export(upper, str(paths["upper_step"]))
    cq.exporters.export(lower, str(paths["lower_stl"]), tolerance=.02, angularTolerance=.1)
    cq.exporters.export(upper, str(paths["upper_stl"]), tolerance=.02, angularTolerance=.1)
    assembly = cq.Assembly(name=f"xe_{name}")
    assembly.add(lower, name="lower", color=cq.Color(.72, .76, .82))
    assembly.add(internals, name="internals", color=cq.Color(.25, .55, .35))
    assembly.add(upper, name="upper", color=cq.Color(.82, .85, .90))
    assembly.export(str(paths["assembly_step"]))
    bb = lower.fuse(upper).BoundingBox()
    reports.append({
        "variant": name,
        "plan_corner_radius_mm": plan_radius,
        "top_bottom_edge_radius_mm": edge_radius,
        "lanyard_outer_mm": [8.0, 5.0],
        "lanyard_slot_mm": [4.0, 1.8],
        "usb_access": {
            "connector_model_front_y_mm": usb_face_y,
            "recessed_bezel_y_mm": usb_bay_back_y,
            "bezel_ahead_of_connector_mm": usb_face_y - usb_bay_back_y,
            "outer_bay_mm": [14.0, 7.5],
            "inner_throat_mm": [9.4, 3.6],
            "connector_drawing_mouth_mm": [8.34, 2.56],
            "connector_drawing_plug_height_max_mm": 6.5,
        },
        "complete_bbox_mm": [bb.xlen, bb.ylen, bb.zlen],
        "valid_single_solids": True,
        "nominal_intersections_mm3": {
            "lower_to_integrated_internals": lower_intersection,
            "upper_to_integrated_internals": upper_intersection,
            "lanyard_to_integrated_internals": tab_intersection,
        },
        "shell_volume_mm3": lower.Volume() + upper.Volume(),
        "outputs_sha256": {str(path.relative_to(ROOT)): sha(path) for path in paths.values()},
    })

report = {
    "status": "STYLE_VARIANTS_CREATED_NOT_ADOPTED_OR_PHYSICALLY_QUALIFIED",
    "fixed": "PCB, battery, sensor stack, USB connector, microphone duct, LED opening, seam plane and internal supports",
    "baseline": {"plan_corner_radius_mm": 1.5, "top_bottom_edge_radius_mm": .4, "lanyard_hole_mm": 2.5},
    "variants": reports,
    "limits": [
        "Nominal solid intersection is not a tolerance, print-fit, acoustic or strength proof.",
        "Increasing corner radius removes exterior corner material; printed wall continuity and minimum wall require toolpath review.",
        "The wider slotted tab is intended to look more integrated and spread load, but requires bonded-seam proof-load testing.",
        "USB bay width 14mm is an engineering overmold allowance because the connector drawing specifies 6.5mm maximum plug height but no cable-overmold width envelope.",
    ],
    "sources_sha256": {str(path.relative_to(ROOT)): sha(path) for path in (lower_source, upper_source, internals_source)},
}
(HERE / "styled-case-variants-review.json").write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n")
print(json.dumps({"status": report["status"], "variants": reports}, ensure_ascii=False))
