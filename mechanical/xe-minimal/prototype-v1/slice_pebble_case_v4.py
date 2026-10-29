#!/usr/bin/env python3
"""Slice the canonical HW-V1.0 v5 case in strength-oriented PETG orientations."""

from pathlib import Path
import hashlib
import json
import shutil
import subprocess


HERE = Path(__file__).resolve().parent
MECH = HERE.parent
OUT = HERE / "pebble-v5-slice-review"
BASE = MECH / "home-fit-coupons" / "slice-review"
SLICER = Path("/Applications/BambuStudio.app/Contents/MacOS/BambuStudio")
PETG = (
    Path.home()
    / "Library/Application Support/BambuStudio/system/BBL/filament/Bambu PETG Basic @BBL A1.json"
)
FILAMENT_LIBRARY = PETG.parent
OUT.mkdir(exist_ok=True)

assert SLICER.is_file(), SLICER
assert PETG.is_file(), PETG

# Rotating the lower around Y places CAD X (the cord-hole axis) on build Z.
parts = [
    ("case-pebble-v5-lower", HERE / "case-pebble-v5-lower.stl", "Y", -90),
    ("case-pebble-v5-upper", HERE / "case-pebble-v5-upper.stl", None, 0),
]
rows = []
for name, source, axis, degrees in parts:
    stl = OUT / f"{name}.stl"
    shutil.copyfile(source, stl)
    rows.append(
        {
            "part": name,
            "rotation": {"axis": axis, "degrees": degrees},
            "source_sha256": hashlib.sha256(source.read_bytes()).hexdigest(),
            "stl_sha256": hashlib.sha256(stl.read_bytes()).hexdigest(),
        }
    )

for filename in ("machine.json", "process.json"):
    shutil.copyfile(BASE / filename, OUT / filename)

# Bambu system presets are inheritance fragments. The CLI does not resolve an
# isolated fragment against the installed library, so flatten the exact chain
# into a self-contained input rather than silently inheriting PLA defaults.
presets = {}
for preset_path in FILAMENT_LIBRARY.glob("*.json"):
    try:
        preset = json.loads(preset_path.read_text())
    except (json.JSONDecodeError, UnicodeDecodeError):
        continue
    if preset.get("name"):
        presets[preset["name"]] = preset

def flatten_filament(name, visiting=()):
    assert name in presets, name
    assert name not in visiting, (name, visiting)
    fragment = presets[name]
    parent_name = fragment.get("inherits")
    merged = flatten_filament(parent_name, visiting + (name,)) if parent_name else {}
    merged.update(fragment)
    merged.pop("inherits", None)
    return merged

filament = flatten_filament("Bambu PETG Basic @BBL A1")
assert filament["filament_type"] == ["PETG"]
assert float(filament["filament_density"][0]) > 1.0
assert int(filament["hot_plate_temp"][0]) >= 60
assert int(filament["nozzle_temperature"][0]) >= 230
(OUT / "filament-petg-a1.json").write_text(
    json.dumps(filament, ensure_ascii=False, indent=2) + "\n"
)

process_path = OUT / "process.json"
process = json.loads(process_path.read_text())
process.update(
    {
        "layer_height": "0.16",
        "wall_loops": "6",
        "top_shell_layers": "6",
        "bottom_shell_layers": "6",
        "sparse_infill_density": "40%",
        "sparse_infill_pattern": "gyroid",
        "enable_support": "1",
        "support_type": "tree(auto)",
        "support_on_build_plate_only": "0",
        "curr_bed_type": "Textured PEI Plate",
    }
)
process_path.write_text(json.dumps(process, ensure_ascii=False, indent=2) + "\n")

for row in rows:
    name = row["part"]
    job = OUT / name
    job.mkdir(exist_ok=True)
    command = [
        str(SLICER),
        "--debug",
        "1",
        "--load-settings",
        f"{OUT / 'machine.json'};{process_path}",
        "--load-filaments",
        str(OUT / "filament-petg-a1.json"),
        "--arrange",
        "1",
        "--orient",
        "0",
        "--slice",
        "0",
        "--export-3mf",
        f"{name}.3mf",
        "--outputdir",
        str(job),
    ]
    if row["rotation"]["axis"] == "Y":
        command.extend(["--rotate-y", str(row["rotation"]["degrees"])])
    command.append(str(OUT / f"{name}.stl"))
    run = subprocess.run(command, cwd=job, capture_output=True, text=True)
    (job / "slice.log").write_text(run.stdout + run.stderr)
    assert run.returncode == 0, (name, run.returncode, run.stderr[-2000:])
    result = json.loads((job / "result.json").read_text())
    assert result["return_code"] == 0, (name, result)
    row["slice_result"] = result
    for artifact in sorted(job.iterdir()):
        if artifact.is_file() and artifact.name != "slice.log":
            row.setdefault("artifact_sha256", {})[artifact.name] = hashlib.sha256(
                artifact.read_bytes()
            ).hexdigest()

review = {
    "status": "PEBBLE_V5_A1_MINI_PETG_SLICE_PASS_NOT_PRINTED",
    "case_revision": "HW-V1.0-CASE-PEBBLE-V5-1GB",
    "process": "A1 mini, Bambu PETG Basic, 0.4mm nozzle, 0.16mm layer, six walls, 40% gyroid, supports enabled",
    "orientation": {
        "lower": "CAD X/hole axis rotated onto build Z; layer planes remain transverse to the primary cord load path",
        "upper": "CAD Z is build Z; broad exterior face on plate",
    },
    "parts": rows,
    "profile_sha256": {
        name: hashlib.sha256((OUT / name).read_bytes()).hexdigest()
        for name in ("machine.json", "process.json", "filament-petg-a1.json")
    },
    "limits": [
        "Successful slicing proves toolpath generation, not printed strength or dimensional fit.",
        "Physical proof-load, fatigue, wear, sweat, drop, USB-plug and pouch-swelling tests remain mandatory.",
    ],
}
(OUT / "review.json").write_text(json.dumps(review, ensure_ascii=False, indent=2) + "\n")
print(json.dumps({"status": review["status"], "parts": len(rows)}))
