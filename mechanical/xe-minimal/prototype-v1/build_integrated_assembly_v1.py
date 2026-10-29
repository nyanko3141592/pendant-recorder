"""Build the canonical PCB/battery/internal-pack-NTC integration model.

The battery harness route is a reserved envelope because the finished harness
geometry is not fully published. It must not be treated as a verified wire path.
"""
from __future__ import annotations

import hashlib
import json
from pathlib import Path

import cadquery as cq


HERE = Path(__file__).resolve().parent
MECH = HERE.parent
ROOT = MECH.parents[1]


def sha(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load(path: Path):
    shape = cq.importers.importStep(str(path)).val()
    assert shape.isValid(), path
    return shape


board_path = HERE / "pcb-assembly-pack-ntc.step"
board = load(board_path)

# KiCad STEP export explicitly reported these missing models. Existing source-
# backed maximum envelopes retain the same canonical PCB poses.
missing_envelope_paths = {
    "U1_max": MECH / "u1-envelope-positioned-study.step",
    "U8_max": MECH / "u8-body-positioned-study.step",
    "J2_header": MECH / "j2-header-positioned-study.step",
}
missing = {name: load(path) for name, path in missing_envelope_paths.items()}

# DTP401525-XE maximum finished body. Current established pose uses the full
# 27 mm board length and leaves the connector/sensor side on +X.
battery_source = MECH / "dtp401525-xe-pack-max.step"
battery = load(battery_source).translate((8.25, -13.5, -6.62))

# The fixed battery's own 10k NTC is carried by the factory three-wire harness.
# No board thermistor, thermal bridge or local pouch-pressure feature remains.
separator_source = MECH / "battery-separator-study.step"
sensor_carrier = load(separator_source)
assert sensor_carrier.isValid() and len(sensor_carrier.Solids()) == 1

# Battery's three original leads/plug are represented by a conservative
# corridor to J2 pending receiving inspection.
battery_harness_reserve = cq.Compound.makeCompound(
    [
        cq.Workplane("XY").box(2.3, 5.0, 2.3).val().translate((1.4, -2.5, -2.5)),
        cq.Workplane("XY").box(4.3, 2.3, 2.3).val().translate((2.5, -3.125, -2.5)),
    ]
)

parts = {
    "pcb": board,
    **missing,
    "battery_max": battery,
    "sensor_carrier": sensor_carrier,
    "battery_harness_reserve": battery_harness_reserve,
}

assembly = cq.Assembly(name="xe_prototype_v1_integrated")
colors = {
    "pcb": cq.Color(0.1, 0.45, 0.25),
    "battery_max": cq.Color(0.35, 0.65, 0.85),
}
for name, shape in parts.items():
    assembly.add(shape, name=name, color=colors.get(name, cq.Color(0.45, 0.45, 0.45)))

out = HERE / "integrated-assembly-v1.step"
assembly.save(str(out))
assert load(out).isValid()
cq.exporters.export(sensor_carrier, str(HERE / "sensor-carrier-v1.step"))

# Existing rounded glue shell is evaluated as a reusable shape baseline only.
# Passing nominal collisions does not adopt it.
shell_paths = {
    "lower": MECH / "rounded-glue-reinforced-lower-study.step",
    "upper": MECH / "rounded-glue-reinforced-upper-study.step",
}
shells = {name: load(path) for name, path in shell_paths.items()}

collisions = []
for shell_name, shell in shells.items():
    for part_name, part in parts.items():
        volume = shell.intersect(part).Volume()
        collisions.append(
            {
                "shell": shell_name,
                "part": part_name,
                "intersection_mm3": volume,
            }
        )

internal_collisions = []
critical_pairs = [
    ("pcb", "battery_max"),
    ("pcb", "sensor_carrier"),
    ("U1_max", "battery_max"),
    ("U8_max", "battery_max"),
    ("J2_header", "battery_max"),
    ("sensor_carrier", "battery_max"),
]
for a_name, b_name in critical_pairs:
    volume = parts[a_name].intersect(parts[b_name]).Volume()
    if volume > 1e-6:
        internal_collisions.append(
            {"a": a_name, "b": b_name, "intersection_mm3": volume}
        )

contacts = []

bb = load(out).BoundingBox()
report = {
    "version": "XE-PROTOTYPE-V1-PACK-NTC",
    "status": "PACK_NTC_NO_THERMAL_PAD_CAD_MODELED_NOT_PHYSICALLY_QUALIFIED",
    "output": str(out.relative_to(ROOT)),
    "output_sha256": sha(out),
    "assembly_bbox_mm": [bb.xmin, bb.xmax, bb.ymin, bb.ymax, bb.zmin, bb.zmax],
    "sources_sha256": {
        str(path.relative_to(ROOT)): sha(path)
        for path in [board_path, battery_source, separator_source, *missing_envelope_paths.values(), *shell_paths.values()]
    },
    "sensor": {
        "part": "DTP401525-XE internal 10k NTC on factory P2 white lead",
        "electrical_path": "factory harness -> J2 pin2 -> BAT_TS -> TLV7042 hardware inhibit",
        "thermal_pad": "not used",
        "carrier": "unmodified broad separator; no local sensor-pressure feature",
    },
    "contacts": contacts,
    "unexpected_internal_collisions": internal_collisions,
    "internal_collision_scope": critical_pairs,
    "shell_collision_screen": collisions,
    "shell_collision_free_above_numeric_contact_threshold": all(
        row["intersection_mm3"] < 1e-4 for row in collisions
    ),
    "limits": [
        "Pack NTC R-T curve, tolerance, lot spread and installed thermal response are unqualified.",
        "The battery harness solid is a reserved corridor, not a verified manufactured route.",
        "Battery plug maximum envelope and removal motion remain incomplete.",
        "The existing shell is only screened for nominal solid intersections and is not adopted.",
        "No print tolerance, pouch swelling, lead bend radius, acoustic path or assembly motion proof.",
    ],
}
(HERE / "integrated-assembly-v1-review.json").write_text(
    json.dumps(report, ensure_ascii=False, indent=2) + "\n"
)
print(json.dumps({"status": report["status"], "shell_collision_free": report["shell_collision_free_above_numeric_contact_threshold"], "internal_collisions": len(internal_collisions), "bbox": report["assembly_bbox_mm"]}))
