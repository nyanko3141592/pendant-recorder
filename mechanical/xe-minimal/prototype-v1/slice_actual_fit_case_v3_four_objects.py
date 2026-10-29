#!/usr/bin/env python3
"""Create an A1 mini PETG project with four independently selectable objects."""
from pathlib import Path
import hashlib
import json
import shutil
import subprocess

import cadquery as cq

HERE = Path(__file__).resolve().parent
OUT = HERE / "actual-fit-case-v3"
JOB = OUT / "a1mini-4objects"
BASE = HERE.parent / "home-fit-coupons/slice-review"
SLICER = Path("/Applications/BambuStudio.app/Contents/MacOS/BambuStudio")
PETG_DIR = Path.home() / "Library/Application Support/BambuStudio/system/BBL/filament"
JOB.mkdir(parents=True, exist_ok=True)

def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

def load(path):
    shape = cq.importers.importStep(str(path)).val()
    assert shape.isValid(), path
    return shape

def on_bed(shape):
    bb = shape.BoundingBox()
    return shape.translate((-bb.xmin, -bb.ymin, -bb.zmin))

# Board and battery remain dimensional/assembly gauges.  The board source is
# the complete populated mechanical envelope; the 4-layer candidate has the
# same outline, thickness and every footprint pose, verified separately.
parts = [
    ("case-v3-lower", on_bed(load(OUT / "case-v3-lower.step"))),
    ("case-v3-upper", on_bed(load(OUT / "case-v3-upper.step").rotate((0,0,0),(1,0,0),180))),
    ("hw-v1.4-4layer-populated", on_bed(load(OUT / "actual-populated-pcb.step"))),
    ("dtp401525-xe-max-body", on_bed(load(OUT / "dtp401525-xe-max-body.step"))),
]
inputs=[]
rows=[]
for name, shape in parts:
    stl=JOB/f"{name}.stl"
    cq.exporters.export(shape, str(stl), tolerance=.02, angularTolerance=.1)
    bb=shape.BoundingBox()
    inputs.append(stl)
    rows.append({"object":name,"stl":stl.name,"bbox_mm":[bb.xlen,bb.ylen,bb.zlen],"sha256":sha(stl)})

for filename in ("machine.json", "process.json"):
    shutil.copy2(BASE/filename, JOB/filename)
process_path=JOB/"process.json"
process=json.loads(process_path.read_text())
process.update({"layer_height":"0.16","wall_loops":"6","top_shell_layers":"6","bottom_shell_layers":"6","sparse_infill_density":"40%","sparse_infill_pattern":"gyroid","enable_support":"1","support_type":"tree(auto)","curr_bed_type":"Textured PEI Plate"})
process_path.write_text(json.dumps(process,ensure_ascii=False,indent=2)+"\n")

presets={}
for p in PETG_DIR.glob("*.json"):
    try: d=json.loads(p.read_text())
    except Exception: continue
    if d.get("name"): presets[d["name"]]=d
def flatten(name, seen=()):
    assert name in presets and name not in seen, name
    d=presets[name]; base=flatten(d["inherits"],seen+(name,)) if d.get("inherits") else {}
    base.update(d); base.pop("inherits",None); return base
filament=flatten("Bambu PETG Basic @BBL A1")
filament_path=JOB/"filament-petg-a1.json"
filament_path.write_text(json.dumps(filament,ensure_ascii=False,indent=2)+"\n")

command=[str(SLICER),"--debug","1","--load-settings",f"{JOB/'machine.json'};{process_path}","--load-filaments",str(filament_path),"--arrange","1","--orient","0","--slice","0","--export-3mf","hw-v1.4-4layer-case-v3-4objects-a1mini.3mf","--outputdir",str(JOB),*[str(p) for p in inputs]]
run=subprocess.run(command,cwd=JOB,capture_output=True,text=True)
(JOB/"slice.log").write_text(run.stdout+run.stderr)
assert run.returncode==0, run.stderr[-3000:]
result=json.loads((JOB/"result.json").read_text())
assert result["return_code"]==0, result
project=JOB/"hw-v1.4-4layer-case-v3-4objects-a1mini.3mf"
review={
    "status":"A1_MINI_FOUR_OBJECT_SLICE_PASS_PHYSICAL_PRINT_REQUIRED",
    "hardware":"HW-V1.4-EVT-4LAYER-27P5",
    "case":"CASE-V3-WALL-TUNNEL",
    "object_count":4,
    "objects":rows,
    "project":{"file":project.name,"sha256":sha(project)},
    "gcode":{"file":"plate_1.gcode","sha256":sha(JOB/"plate_1.gcode")},
    "slice_result":result,
    "profile":"A1 mini / Bambu PETG Basic / 0.4 mm nozzle / 0.16 mm layer / 6 walls / 40% gyroid / tree support",
    "limits":["Board is a mechanical populated-envelope gauge; it does not function electrically.","Slicing does not qualify real fit, USB access, cord proof load, fatigue, sweat, drop, heat or acoustics."],
}
(JOB/"review.json").write_text(json.dumps(review,ensure_ascii=False,indent=2)+"\n")
print(json.dumps({"status":review["status"],"objects":4,"project":str(project),"result":result},ensure_ascii=False))
