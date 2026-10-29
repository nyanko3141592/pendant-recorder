"""Build the actual-circuit 30 mm prototype fit-check enclosure.

This revision uses the canonical populated PCB STEP, the DTP401525-XE maximum
body, explicit envelopes for the three parts missing from KiCad's STEP export,
and an integral corner cord tunnel.  It is an EVT assembly/fit prototype, not a
production-qualified enclosure.
"""
from __future__ import annotations

from pathlib import Path
import hashlib
import json

import cadquery as cq

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
MECH = HERE.parent
OUT = HERE / "actual-30mm-prototype"
OUT.mkdir(exist_ok=True)


def load(path: Path):
    shape = cq.importers.importStep(str(path)).val()
    assert shape.isValid(), path
    return shape


def sha(path: Path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def export(shape, stem: str):
    step = OUT / f"{stem}.step"
    stl = OUT / f"{stem}.stl"
    cq.exporters.export(shape, str(step))
    cq.exporters.export(shape, str(stl), tolerance=.025, angularTolerance=.12)
    return step, stl


# Canonical, electrically checked board geometry.  KiCad omitted U1/U8/J2 3D
# packages, so their maximum data-sheet envelopes are added to the printed
# circuit gauge and to collision checks.
pcb_native = load(HERE / "pcb-assembly-pack-ntc.step")
missing = {
    "U1_max": load(MECH / "u1-envelope-positioned-study.step"),
    "U8_max": load(MECH / "u8-body-positioned-study.step"),
    "J2_header_max": load(MECH / "j2-header-positioned-study.step"),
}
pcb_complete = cq.Compound.makeCompound([pcb_native, *missing.values()])

# Fixed battery maximum finished-body envelope from the DTP401525-XE drawing.
battery_native = load(MECH / "dtp401525-xe-pack-max.step")
battery_installed = battery_native.translate((8.25, -13.5, -6.62))
separator = load(MECH / "battery-separator-study.step")
harness_reserve = cq.Compound.makeCompound([
    cq.Workplane("XY").box(2.3, 5.0, 2.3).val().translate((1.4, -2.5, -2.5)),
    cq.Workplane("XY").box(4.3, 2.3, 2.3).val().translate((2.5, -3.125, -2.5)),
])
internals = cq.Compound.makeCompound([pcb_complete, battery_installed, separator, harness_reserve])

# Start from the already synchronized rounded shell, discard its protruding
# centre bail, and trim the 0.3 mm nonessential top allowance.  Resulting body
# is 29.9 x 30.0 mm while retaining the USB datum and internal stack.
lower_v5 = load(HERE / "case-pebble-v5-lower.step")
upper_v5 = load(HERE / "case-pebble-v5-upper.step")
body_clip = (cq.Workplane("XY").box(29.9, 29.98, 20.0).val()
             .translate((13.85, -13.31, -1.25)))
lower = lower_v5.intersect(body_clip).clean()
upper = upper_v5.intersect(body_clip).clean()

# The battery ends at X=23.75 mm.  Fill the otherwise unused lower-shell
# top-right corner below the PCB, then drill a diagonal cord tunnel through two
# adjacent exterior faces.  The boss remains entirely within the 30 mm body;
# its primary load path is integral with the lower shell, not the glue seam.
boss = (cq.Workplane("XY").box(4.75, 4.75, 4.5).edges("|Z").fillet(1.0).val()
        .translate((26.375, -0.675, -4.55)))
lower = lower.fuse(boss).intersect(body_clip).clean()

hole_d = 2.2
direction = (1.0, -1.0, 0.0)
start = (24.4, 2.15, -4.55)
plane = cq.Plane(origin=start, xDir=(0, 0, 1), normal=direction)
cord_tunnel = cq.Workplane(plane).circle(hole_d / 2).extrude(8.2).val()
lower = lower.cut(cord_tunnel).clean()

assert lower.isValid() and len(lower.Solids()) == 1
assert upper.isValid() and len(upper.Solids()) == 1

# Nominal collision checks. Tiny source-shell face contacts below 1e-4 mm3
# are reported separately and are not silently converted into clearance.
checks = {
    "lower_to_internals_mm3": lower.intersect(internals).Volume(),
    "upper_to_internals_mm3": upper.intersect(internals).Volume(),
    "corner_boss_to_internals_mm3": boss.intersect(internals).Volume(),
    "cord_tunnel_to_internals_mm3": cord_tunnel.intersect(internals).Volume(),
    "pcb_to_battery_mm3": pcb_complete.intersect(battery_installed).Volume(),
}

lower_step, lower_stl = export(lower, "case-lower-corner-cord")
upper_step, upper_stl = export(upper, "case-upper-rounded")
pcb_step, pcb_stl = export(pcb_complete, "actual-populated-pcb-complete")
battery_step, battery_stl = export(battery_native, "dtp401525-xe-max-body")

assembly = cq.Assembly(name="xe_actual_30mm_prototype")
assembly.add(lower, name="lower_integral_corner_cord", color=cq.Color(.34, .42, .55))
assembly.add(pcb_complete, name="canonical_populated_pcb", color=cq.Color(.08, .43, .24))
assembly.add(separator, name="battery_separator", color=cq.Color(.75, .75, .72))
assembly.add(battery_installed, name="DTP401525_XE_max_body", color=cq.Color(.25, .55, .76))
assembly.add(harness_reserve, name="factory_harness_reserved_corridor", color=cq.Color(.85, .50, .20))
assembly.add(upper, name="upper_rounded", color=cq.Color(.75, .81, .90))
assembly_path = OUT / "actual-30mm-prototype-assembly.step"
assembly.save(str(assembly_path))

# A single print plate: functional case halves plus separate physical gauges of
# the actual populated circuit envelope and specified battery body.
def on_bed(shape, dx, dy):
    bb_part = shape.BoundingBox()
    return shape.translate((dx - bb_part.xmin, dy - bb_part.ymin, -bb_part.zmin))

plate = cq.Compound.makeCompound([
    on_bed(lower, 2.0, 2.0),
    on_bed(upper, 34.0, 2.0),
    on_bed(pcb_complete, 2.0, 36.0),
    on_bed(battery_native, 42.0, 36.0),
])
plate_step, plate_stl = export(plate, "case-pcb-battery-print-plate")

bb = lower.fuse(upper).BoundingBox()
report = {
    "version": "HW-V1.4-EVT-ACTUAL-30MM",
    "status": "PRINTABLE_ACTUAL_ASSEMBLY_CANDIDATE_NOT_PHYSICALLY_QUALIFIED",
    "complete_case_bbox_mm": [bb.xlen, bb.ylen, bb.zlen],
    "pcb_outline_mm": [27.5, 27.5],
    "battery_max_body_mm": [15.5, 27.0, 4.2],
    "cord_tunnel": {
        "diameter_mm": hole_d,
        "axis": "diagonal in case XY plane through top-right corner",
        "recommended_initial_cord_mm": "1.0 to 1.5 braided polyester/nylon",
        "construction": "reinforced boss integral to lower shell; no exterior protrusion",
    },
    "rounding_mm": {"plan_corner_radius": 3.0, "top_bottom_edge_radius": 1.5},
    "usb": {"outer_bay_mm": [14.0, 7.5], "inner_throat_mm": [9.4, 3.6], "mating_face_y_mm": -26.17},
    "checks": checks,
    "source_contract": {
        "pcb": "canonical PCB STEP plus explicit U1/U8/J2 maximum envelopes",
        "battery": "DTP401525-XE maximum finished body; factory lead/plug route remains a conservative reserved corridor",
        "closure": "prototype seam bonding after fit verification; never bond the battery or harness",
    },
    "files": {},
    "limitations": [
        "The printed circuit part is a mechanical gauge; solder joints and flexible leads are not printable functional electronics.",
        "The battery gauge must never be mistaken for or substituted for a real Li-ion cell.",
        "Physical USB cable fit, pouch swelling, microphone acoustics, sweat, drop, cord proof/fatigue and print tolerance remain unmeasured.",
        "The 30 mm target is met nominally in CAD; verify printer shrink and elephant-foot before treating it as a dimensional pass."
    ],
}
for p in [lower_step, lower_stl, upper_step, upper_stl, pcb_step, pcb_stl,
          battery_step, battery_stl, assembly_path, plate_step, plate_stl]:
    report["files"][p.name] = {"sha256": sha(p), "bytes": p.stat().st_size}

review_path = OUT / "review.json"
review_path.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n")
print(json.dumps({"bbox_mm": report["complete_case_bbox_mm"], "checks": checks, "out": str(OUT)}))
