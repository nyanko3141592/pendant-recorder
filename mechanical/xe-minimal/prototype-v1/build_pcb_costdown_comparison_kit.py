#!/usr/bin/env python3
"""Build printable PCB envelope gauges for HW-V1.0, V1.1 and V1.2."""
from pathlib import Path
import hashlib
import json

import cadquery as cq

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
OUT = HERE / "pcb-costdown-comparison-kit"
OUT.mkdir(exist_ok=True)

VERSIONS = [
    ("HW-V1.0", 27.5, 6, 2, "6-layer / double-side / POFV"),
    ("HW-V1.1", 31.5, 4, 2, "4-layer / double-side / ordinary via"),
    ("HW-V1.2", 36.0, 4, 1, "4-layer / single-side / ordinary via"),
]

def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

def gauge(size, marks):
    # 0.8 mm is the intended PCB thickness. A shallow centered edge notch marks
    # the USB-C side; 1/2/3 corner holes identify versions after printing.
    body = (cq.Workplane("XY").rect(size, size).extrude(.8)
            .edges("|Z").fillet(1.0))
    notch = (cq.Workplane("XY").center(0, size / 2)
             .rect(9.4, 2.0).extrude(.8))
    body = body.cut(notch)
    for index in range(marks):
        x = -size / 2 + 2.0 + index * 2.2
        y = -size / 2 + 2.0
        body = body.cut(cq.Workplane("XY").center(x, y).circle(.65).extrude(.8))
    return body.val()

parts = {}
x_cursor = 0.0
individual = []
for index, (version, size, layers, sides, construction) in enumerate(VERSIONS, 1):
    shape = gauge(size, index)
    slug = version.lower().replace("hw-", "hw-").replace(".", "-")
    stl = OUT / f"{slug}-pcb-envelope-gauge.stl"
    step = OUT / f"{slug}-pcb-envelope-gauge.step"
    cq.exporters.export(shape, str(stl), tolerance=.01, angularTolerance=.1)
    cq.exporters.export(shape, str(step))
    individual += [stl, step]
    placed = shape.translate((x_cursor + size / 2, size / 2, 0))
    parts[version] = placed
    x_cursor += size + 7.0

plate = cq.Compound.makeCompound(list(parts.values()))
plate_stl = OUT / "hw-v1-0-v1-1-v1-2-pcb-comparison-plate.stl"
plate_step = OUT / "hw-v1-0-v1-1-v1-2-pcb-comparison-plate.step"
assembly_step = OUT / "hw-v1-0-v1-1-v1-2-pcb-comparison-assembly.step"
cq.exporters.export(plate, str(plate_stl), tolerance=.01, angularTolerance=.1)
cq.exporters.export(plate, str(plate_step))
assembly = cq.Assembly(name="pcb_costdown_comparison")
colors = [cq.Color(.18, .48, .28), cq.Color(.80, .58, .16), cq.Color(.68, .25, .22)]
for (version, *_), color in zip(VERSIONS, colors):
    assembly.add(parts[version], name=version, color=color)
assembly.save(str(assembly_step))

bb = plate.BoundingBox()
outputs = individual + [plate_stl, plate_step, assembly_step]
# Human-readable top-view drawing; the printable solids remain authoritative.
svg = OUT / "pcb-size-comparison.svg"
scale = 6
palette = ["#246b45", "#c88b24", "#a94442"]
x = 35
shapes = []
for index, ((version, size, layers, sides, construction), color) in enumerate(zip(VERSIONS, palette), 1):
    w = size * scale
    y = 55
    shapes.append(f'<rect x="{x}" y="{y}" width="{w}" height="{w}" rx="8" fill="{color}"/>')
    shapes.append(f'<rect x="{x+w/2-28}" y="{y-2}" width="56" height="12" fill="#f7f7f2"/>')
    shapes.append(f'<text x="{x+w/2}" y="{y+w/2}" text-anchor="middle" fill="white" font-size="20" font-weight="700">{version}</text>')
    shapes.append(f'<text x="{x+w/2}" y="{y+w+25}" text-anchor="middle" fill="#20242a" font-size="16">{size:g} × {size:g} mm</text>')
    shapes.append(f'<text x="{x+w/2}" y="{y+w+45}" text-anchor="middle" fill="#59616b" font-size="12">{layers}層 / {"片面" if sides == 1 else "両面"}実装</text>')
    x += w + 55
svg.write_text('<svg xmlns="http://www.w3.org/2000/svg" width="820" height="330" viewBox="0 0 820 330">'
               '<rect width="820" height="330" fill="#f7f7f2"/><text x="35" y="30" fill="#20242a" font-size="20" font-weight="700">PCBコストダウン案・実寸比</text>'
               + ''.join(shapes) + '</svg>\n')
outputs.append(svg)
report = {
    "status": "PRINTABLE_SIZE_GAUGES_NOT_ELECTRICAL_OR_CASE_FIT_QUALIFICATION",
    "plate_bbox_mm": [bb.xlen, bb.ylen, bb.zlen],
    "gauge_thickness_mm": .8,
    "usb_side_cue": "9.4 x 2.0 mm centered shallow edge notch",
    "identification": {"one_corner_hole": "HW-V1.0", "two_corner_holes": "HW-V1.1", "three_corner_holes": "HW-V1.2"},
    "versions": [{"version": v, "board_mm": [s, s], "layers": l, "assembly_sides": a, "construction": c}
                 for v, s, l, a, c in VERSIONS],
    "single_import": str(plate_stl.relative_to(ROOT)),
    "outputs_sha256": {str(p.relative_to(ROOT)): sha(p) for p in outputs},
    "limitations": [
        "These are board-outline and USB-side orientation gauges, not populated PCB models.",
        "A successful print does not qualify routing, signal integrity, thermal behavior, acoustics, assembly, USB cable clearance or case fit.",
        "HW-V1.2 remains an unreleased routed candidate until its DRC and engineering gates pass.",
    ],
}
(OUT / "review.json").write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n")
print(json.dumps({"status": report["status"], "plate_bbox_mm": report["plate_bbox_mm"]}))
