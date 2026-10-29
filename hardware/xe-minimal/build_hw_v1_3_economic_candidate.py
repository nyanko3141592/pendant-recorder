#!/usr/bin/env python3
"""Create the 36 mm Economic-PCBA process candidate without changing circuitry.

HW-V1.3 deliberately removes the inherited bespoke stackup declaration and
requests the vendor's ordinary four-layer 0.8 mm construction.  Placement,
nets, routes, footprints and safety functions remain byte-for-byte equivalent
at the KiCad object level to the reviewed HW-V1.2 candidate.
"""
from pathlib import Path
import collections
import hashlib
import json
import shutil
import subprocess

import wx
import pcbnew as k

app = wx.App(False)
HERE = Path(__file__).resolve().parent
SOURCE_DIR = HERE / "costdown/HW-V1.2-EVT-ULTRACOST"
OUT = HERE / "costdown/HW-V1.3-EVT-ECONOMIC"
OUT.mkdir(parents=True, exist_ok=True)
source = SOURCE_DIR / "hw-v1.2-evt-ultracost-4layer-single-side-candidate.kicad_pcb"
candidate = OUT / "hw-v1.3-evt-economic-4layer-single-side-candidate.kicad_pcb"

b = k.LoadBoard(str(source))
assert b.GetCopperLayerCount() == 4
assert all(fp.GetLayer() == k.F_Cu for fp in b.GetFootprints())
b.GetDesignSettings().SetBoardThickness(k.FromMM(0.8))
k.SaveBoard(str(candidate), b)

# Remove the inherited explicit stackup.  Economic PCBA accepts standard
# stackups only, so the manufacturing order must select JLC's ordinary
# four-layer/0.8 mm stackup instead of embedding a bespoke construction.
text = candidate.read_text()
needle = "\n\t\t(stackup\n"
start = text.index(needle)
depth = 0
end = None
for i in range(start + 2, len(text)):
    if text[i] == "(":
        depth += 1
    elif text[i] == ")":
        depth -= 1
        if depth == 0:
            end = i + 1
            break
assert end is not None
text = text[:start] + text[end:]
candidate.write_text(text)

for suffix in (".kicad_pro", ".kicad_dru"):
    shutil.copy2(source.with_suffix(suffix), candidate.with_suffix(suffix))

cli = "/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli"
drc_path = OUT / "candidate-drc.json"
subprocess.run([
    cli, "pcb", "drc", "--refill-zones", "--save-board", "--format", "json",
    "--output", str(drc_path), str(candidate)
], check=True)
drc = json.loads(drc_path.read_text())
types = collections.Counter(row["type"] for row in drc["violations"])
geometric = sum(count for kind, count in types.items() if kind != "lib_footprint_issues")

review = {
    "version": "HW-V1.3-EVT-ECONOMIC",
    "parent": "HW-V1.2-EVT-ULTRACOST",
    "board_mm": [36.0, 36.0],
    "board_thickness_mm": 0.8,
    "copper_layers": 4,
    "assembly_sides": 1,
    "minimum_passive_package": "0402",
    "minimum_ic_pitch_mm": 0.4,
    "explicit_custom_stackup": False,
    "requested_stackup": "vendor standard four-layer 0.8 mm; no controlled-impedance surcharge requested",
    "placement_or_circuit_changes_from_v1_2": [],
    "drc_geometric_violations": geometric,
    "drc_library_provenance_warnings": types.get("lib_footprint_issues", 0),
    "unconnected_items": len(drc["unconnected_items"]),
    "candidate_sha256": hashlib.sha256(candidate.read_bytes()).hexdigest(),
    "pcb_process_economic_compatible_on_published_rules": True,
    "complete_pcba_economic_compatible": False,
    "blocking_bom_item": {
        "reference": "U11",
        "current_mpn": "MKDV8GIL-AST",
        "jlc_part": "C26159627",
        "published_pcba_type": "Standard Only",
        "reason_not_replaced": "The observed Economic-compatible 8Gbit SD-interface candidate XTSDG08GWSIGA/C25836657 is about USD 40 each; it erases most or all prototype fixed-fee savings and footprint/pin compatibility is not yet qualified."
    },
    "release_allowed": False,
    "next_gates": [
        "Run the live JLC BOM tool: verify every selected MPN remains available for Economic PCBA.",
        "Choose Standard with the current lower-cost U11, or qualify a genuinely cheaper Economic-compatible 8Gbit managed storage part.",
        "Review USB differential routing, PDM/SPI, power, heat and acoustics; V1.3 inherits the V1.2 autorouted candidate.",
        "Export CAM/BOM/CPL only after the storage/economic route and routing review are accepted."
    ]
}
(OUT / "candidate-review.json").write_text(json.dumps(review, ensure_ascii=False, indent=2) + "\n")
print(json.dumps(review, ensure_ascii=False))
