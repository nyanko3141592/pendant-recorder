"""Build a one-job print kit for physical size and handling evaluation.

This is deliberately a non-electrical gauge.  It contains the real v5 case
shells plus simplified PCB and maximum battery solids arranged on one print
bed.  It must never be mistaken for manufacturing or assembly proof.
"""
from pathlib import Path
import hashlib
import json

import cadquery as cq


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]


def load(path: Path):
    shape = cq.importers.importStep(str(path)).val()
    assert shape.isValid(), path
    return shape


def on_bed(shape):
    bb = shape.BoundingBox()
    return shape.translate((-bb.xmin, -bb.ymin, -bb.zmin))


def sha(path: Path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


lower_path = HERE / "case-pebble-v5-lower.step"
upper_path = HERE / "case-pebble-v5-upper.step"
lower = on_bed(load(lower_path).rotate((0, 0, 0), (0, 1, 0), -90))
upper = on_bed(load(upper_path))

# Dimensional gauges only.  The board block reproduces outline/thickness and a
# USB-C mating-face cue; it does not reproduce fragile component geometry.
pcb = (cq.Workplane("XY").box(27.5, 27.5, 0.8, centered=(False, False, False))
       .edges("|Z").fillet(1.0).val())
usb = (cq.Workplane("XY").box(9.4, 3.6, 3.2, centered=(False, False, False)).val()
       .translate((9.05, -3.6, 0.8)))
pcb_gauge = pcb.fuse(usb).clean()

battery_gauge = (cq.Workplane("XY").box(15.5, 27.0, 4.2, centered=(False, False, False))
                 .edges("|Z").fillet(1.2).edges("not |Z").fillet(0.45).val())

# Four disconnected shells in one STL: one slicer import, one plate, and each
# part can be lifted independently after printing.  Spacing is at least 6 mm.
parts = {
    "case_lower_print_orientation": lower.translate((0, 0, 0)),
    "case_upper": upper.translate((22, 0, 0)),
    "pcb_outline_usb_gauge": pcb_gauge.translate((58, 0, 0)),
    "battery_max_gauge": battery_gauge.translate((64, 37, 0)),
}
plate = cq.Compound.makeCompound(list(parts.values()))
assert plate.isValid()

plate_stl = HERE / "hw-v1-size-fit-print-kit-v1.stl"
plate_step = HERE / "hw-v1-size-fit-print-kit-v1.step"
assembly_step = HERE / "hw-v1-size-fit-print-kit-v1-assembly.step"
pcb_stl = HERE / "hw-v1-pcb-outline-gauge-v1.stl"
battery_stl = HERE / "dtp401525-xe-max-gauge-v1.stl"
cq.exporters.export(plate, str(plate_stl), tolerance=.02, angularTolerance=.1)
cq.exporters.export(plate, str(plate_step))
cq.exporters.export(pcb_gauge, str(pcb_stl), tolerance=.02, angularTolerance=.1)
cq.exporters.export(battery_gauge, str(battery_stl), tolerance=.02, angularTolerance=.1)

assembly = cq.Assembly(name="hw_v1_size_fit_print_kit")
colors = {
    "case_lower_print_orientation": cq.Color(.67, .72, .82),
    "case_upper": cq.Color(.80, .84, .90),
    "pcb_outline_usb_gauge": cq.Color(.12, .48, .28),
    "battery_max_gauge": cq.Color(.32, .62, .84),
}
for name, shape in parts.items():
    assembly.add(shape, name=name, color=colors[name])
assembly.save(str(assembly_step))

bb = plate.BoundingBox()
outputs = [plate_stl, plate_step, assembly_step, pcb_stl, battery_stl]
report = {
    "version": "HW-V1.0-SIZE-FIT-PRINT-KIT-V1",
    "status": "PRINTABLE_DIMENSIONAL_GAUGE_NOT_ELECTRICAL_OR_FIT_QUALIFICATION",
    "one_job_plate_bbox_mm": [bb.xlen, bb.ylen, bb.zlen],
    "parts": {
        "case_lower": "exact v5 case lower, rotated -90 degrees about CAD Y for the reviewed print orientation",
        "case_upper": "exact v5 case upper",
        "pcb_gauge_mm": [27.5, 27.5, 0.8],
        "usb_cue_mm": [9.4, 3.6, 3.2],
        "battery_max_gauge_mm": [15.5, 27.0, 4.2],
    },
    "print_contract": {
        "single_import": str(plate_stl.relative_to(ROOT)),
        "disconnected_parts": 4,
        "recommended_material": "PETG",
        "nozzle_mm": 0.4,
        "layer_height_mm": 0.2,
        "supports": "disabled unless slicer flags the lower-case USB region",
    },
    "outputs_sha256": {str(p.relative_to(ROOT)): sha(p) for p in outputs},
    "sources_sha256": {str(p.relative_to(ROOT)): sha(p) for p in (lower_path, upper_path)},
    "limitations": [
        "PCB and battery pieces are dimensional gauges, not working parts.",
        "The PCB gauge omits individual components, solder, harness and connector retention geometry.",
        "The battery gauge is the published maximum body envelope and omits flexible leads and swelling behavior.",
        "A successful print does not qualify electrical safety, thermal behavior, USB cable fit, cord strength or case closure tolerance.",
    ],
}
(HERE / "hw-v1-size-fit-print-kit-v1-review.json").write_text(
    json.dumps(report, ensure_ascii=False, indent=2) + "\n"
)
print(json.dumps({"status": report["status"], "plate_bbox_mm": report["one_job_plate_bbox_mm"]}))
