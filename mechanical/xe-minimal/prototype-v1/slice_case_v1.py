"""Slice the complete prototype-v1 case for the owned A1 mini profile."""
from pathlib import Path
import cadquery as cq
import hashlib
import json
import shutil
import subprocess

HERE = Path(__file__).resolve().parent
MECH = HERE.parent
OUT = HERE / "slice-review"
PROFILE = MECH / "home-fit-coupons" / "slice-review"
SLICER = Path("/Applications/BambuStudio.app/Contents/MacOS/BambuStudio")
OUT.mkdir(exist_ok=True)

parts = [
    ("case-lower-v1", HERE / "case-lower-v1.step", 0),
    ("case-upper-v1", HERE / "case-upper-v1.step", 180),
    ("sensor-carrier-v1", HERE / "sensor-carrier-v1.step", 0),
]
rows = []
for name, source, rotate_x in parts:
    shape = cq.importers.importStep(str(source)).val()
    if rotate_x:
        shape = shape.rotate((0, 0, 0), (1, 0, 0), rotate_x)
    bb = shape.BoundingBox()
    shape = shape.translate((-bb.xmin, -bb.ymin, -bb.zmin))
    stl = OUT / f"{name}.stl"
    cq.exporters.export(shape, str(stl), tolerance=.01, angularTolerance=.1)
    rows.append({
        "part": name,
        "source_sha256": hashlib.sha256(source.read_bytes()).hexdigest(),
        "stl_sha256": hashlib.sha256(stl.read_bytes()).hexdigest(),
        "valid_solid": shape.isValid() and len(shape.Solids()) == 1,
        "rotation_x_deg": rotate_x,
        "bounds_mm": [bb.xlen, bb.ylen, bb.zlen],
    })

for filename in ["machine.json", "process.json", "filament.json"]:
    shutil.copyfile(PROFILE / filename, OUT / filename)

# The inherited coupon profile used two walls.  Four walls are intentional for
# the thin shell and especially the bonded neck-cord tab; this is still only a
# print candidate until the physical proof-load test passes.
process_path = OUT / "process.json"
process = json.loads(process_path.read_text())
process["wall_loops"] = "4"
process_path.write_text(json.dumps(process, ensure_ascii=False, indent=2) + "\n")

for row in rows:
    name = row["part"]
    job = OUT / name
    job.mkdir(exist_ok=True)
    cmd = [
        str(SLICER), "--debug", "1",
        "--load-settings", f"{OUT/'machine.json'};{OUT/'process.json'}",
        "--load-filaments", str(OUT / "filament.json"),
        "--arrange", "1", "--orient", "0", "--slice", "0",
        "--export-3mf", f"{name}.3mf", "--outputdir", str(job),
        str(OUT / f"{name}.stl"),
    ]
    run = subprocess.run(cmd, cwd=job, capture_output=True, text=True)
    (job / "slice.log").write_text(run.stdout + run.stderr)
    if run.returncode != 0:
        raise RuntimeError(f"{name}: Bambu Studio exit {run.returncode}")
    result = json.loads((job / "result.json").read_text())
    if result.get("return_code") != 0:
        raise RuntimeError(f"{name}: {result}")
    row["slice_result"] = result
    for generated in [job / f"{name}.3mf", job / "plate_1.gcode"]:
        if generated.exists():
            row.setdefault("outputs_sha256", {})[generated.name] = hashlib.sha256(generated.read_bytes()).hexdigest()

review = {
    "status": "A1_MINI_PLA_04MM_SLICED_NOT_PRINTED",
    "slicer": str(SLICER),
    "intentional_process_overrides": {"wall_loops": 4},
    "parts": rows,
    "limits": [
        "Successful slicing is not a physical fit, seam, strength, acoustic or thermal qualification.",
        "Cord loop requires proof-load testing after bonding the seam.",
        "Carrier orientation and pad compression require a first-article assembly check.",
    ],
}
(OUT / "review.json").write_text(json.dumps(review, ensure_ascii=False, indent=2) + "\n")
print(json.dumps(review, ensure_ascii=False, indent=2))
