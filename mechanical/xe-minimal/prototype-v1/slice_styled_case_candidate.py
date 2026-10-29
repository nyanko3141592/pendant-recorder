"""Slice the preferred pebble-R2.3 styled case candidate."""
from pathlib import Path
import cadquery as cq
import hashlib
import json
import shutil
import subprocess

HERE = Path(__file__).resolve().parent
MECH = HERE.parent
OUT = HERE / "styled-slice-review"
PROFILE = MECH / "home-fit-coupons" / "slice-review"
SLICER = Path("/Applications/BambuStudio.app/Contents/MacOS/BambuStudio")
OUT.mkdir(exist_ok=True)

parts = [
    ("case-pebble-r23-lower", HERE / "case-pebble-r23-lower.step", 0),
    ("case-pebble-r23-upper", HERE / "case-pebble-r23-upper.step", 180),
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
    rows.append({"part": name, "valid_single_solid": shape.isValid() and len(shape.Solids()) == 1,
                 "rotation_x_deg": rotate_x, "bounds_mm": [bb.xlen, bb.ylen, bb.zlen],
                 "source_sha256": hashlib.sha256(source.read_bytes()).hexdigest(),
                 "stl_sha256": hashlib.sha256(stl.read_bytes()).hexdigest()})

for filename in ["machine.json", "process.json", "filament.json"]:
    shutil.copyfile(PROFILE / filename, OUT / filename)
process_path = OUT / "process.json"
process = json.loads(process_path.read_text())
process["wall_loops"] = "4"
process_path.write_text(json.dumps(process, ensure_ascii=False, indent=2) + "\n")

for row in rows:
    name = row["part"]
    job = OUT / name
    job.mkdir(exist_ok=True)
    command = [str(SLICER), "--debug", "1", "--load-settings", f"{OUT/'machine.json'};{OUT/'process.json'}",
               "--load-filaments", str(OUT / "filament.json"), "--arrange", "1", "--orient", "0",
               "--slice", "0", "--export-3mf", f"{name}.3mf", "--outputdir", str(job), str(OUT / f"{name}.stl")]
    run = subprocess.run(command, cwd=job, capture_output=True, text=True)
    (job / "slice.log").write_text(run.stdout + run.stderr)
    assert run.returncode == 0
    result = json.loads((job / "result.json").read_text())
    assert result["return_code"] == 0
    row["slice_result"] = result

review = {
    "status": "PEBBLE_R23_A1_MINI_SLICE_PASS_NOT_PRINTED",
    "process": "A1 mini, PLA, 0.4mm nozzle, 0.16mm layer, four walls, no support",
    "parts": rows,
    "limits": ["No physical cable, print-fit, wall-strength, seam or cord-load validation.",
               "14mm outer USB bay width is an engineering allowance, not a published universal USB-C overmold maximum."],
}
(OUT / "review.json").write_text(json.dumps(review, ensure_ascii=False, indent=2) + "\n")
print(json.dumps(review, ensure_ascii=False))
