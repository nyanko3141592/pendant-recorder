#!/usr/bin/env python3
"""Import the V1.2 router session, add ground planes, and audit it."""
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
OUT = HERE / "costdown/HW-V1.2-EVT-ULTRACOST"
source = HERE / "pendant-xe-minimal.kicad_pcb"
placement = OUT / "hw-v1.2-evt-ultracost-4layer-single-side-placement.kicad_pcb"
session = OUT / "hw-v1.2-evt-ultracost-routed.ses"
candidate = OUT / "hw-v1.2-evt-ultracost-4layer-single-side-candidate.kicad_pcb"

b = k.LoadBoard(str(placement))
assert k.ImportSpecctraSES(b, str(session))
# Freerouting expresses its thinnest 3 mil routes as 0.0762 mm.  V1.2 keeps
# the ordinary-fab 0.09 mm floor, so widen only those imported segments.
for item in b.GetTracks():
    if not isinstance(item, k.PCB_VIA) and item.GetWidth() < k.FromMM(0.09):
        item.SetWidth(k.FromMM(0.09))
parent = k.LoadBoard(str(source))
parent_zones = list(parent.Zones())
assert len(parent_zones) == 2
for original, layer in zip(parent_zones, (k.In1_Cu, k.In2_Cu)):
    zone = k.Cast_to_ZONE(original.Duplicate(False))
    # Duplicated zones otherwise retain the parent's stale filled polygons,
    # which do not know about the new routing.
    zone.UnFill()
    zone.SetLayer(layer)
    b.Add(zone)
k.ZONE_FILLER(b).Fill(b.Zones())
k.SaveBoard(str(candidate), b)
for suffix in (".kicad_pro", ".kicad_dru"):
    shutil.copy2(placement.with_suffix(suffix), candidate.with_suffix(suffix))

drc_path = OUT / "candidate-drc.json"
cli = "/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli"
subprocess.run([cli, "pcb", "drc", "--refill-zones", "--save-board", "--format", "json", "--output", str(drc_path), str(candidate)], check=True)
drc = json.loads(drc_path.read_text())
types = collections.Counter(row["type"] for row in drc["violations"])
geometric = sum(count for kind, count in types.items() if kind != "lib_footprint_issues")

overlaps = []
for via in b.GetTracks():
    if not isinstance(via, k.PCB_VIA):
        continue
    hits = []
    for fp in b.GetFootprints():
        for pad in fp.Pads():
            if pad.GetAttribute() == k.PAD_ATTRIB_NPTH:
                continue
            for layer in (k.F_Cu, k.B_Cu):
                if pad.IsOnLayer(layer) and pad.GetEffectiveShape(layer).Collide(via.GetPosition(), via.GetDrillValue() // 2):
                    hits.append({"ref": fp.GetReference(), "pad": pad.GetNumber(), "layer": b.GetLayerName(layer)})
    if hits:
        overlaps.append({"xy_mm": [k.ToMM(via.GetPosition().x), k.ToMM(via.GetPosition().y)], "hits": hits})

report = {
    "version": "HW-V1.2-EVT-ULTRACOST",
    "status": "FOUR_LAYER_SINGLE_SIDE_ROUTED_CANDIDATE_SIGNAL_MECHANICAL_AND_MANUFACTURING_REVIEW_REQUIRED",
    "parent_version": "HW-V1.1-EVT-COSTDOWN",
    "return_point": "hardware/xe-minimal/snapshots/HW-V1.0-2026-10-28/snapshot-manifest.json",
    "board_mm": [36.0, 36.0],
    "growth_from_hw_v1_0_mm": [8.5, 8.5],
    "copper_layers": b.GetCopperLayerCount(),
    "assembly_sides": 1,
    "top_footprints": sum(fp.GetLayer() == k.F_Cu for fp in b.GetFootprints()),
    "bottom_footprints": sum(fp.GetLayer() == k.B_Cu for fp in b.GetFootprints()),
    "footprints": len(b.GetFootprints()),
    "tracks_and_vias": len(b.GetTracks()),
    "zones": len(b.Zones()),
    "drc_geometric_violations": geometric,
    "drc_violation_types": dict(types),
    "drc_library_provenance_warnings": types.get("lib_footprint_issues", 0),
    "unconnected_items": len(drc["unconnected_items"]),
    "hole_over_pad_vias": len(overlaps),
    "hole_over_pad_detail": overlaps,
    "candidate_sha256": hashlib.sha256(candidate.read_bytes()).hexdigest(),
    "function_changes": [],
    "release_allowed": False,
    "remaining_gates": [
        "Review/replace autorouted USB D+/D- as a controlled pair for the selected stackup.",
        "Review PDM, SPI, power and charger routes; completed autorouting is not signal/power qualification.",
        "Review the new one-side placement for heat, microphone acoustics, USB/button/LED access and case fit.",
        "Resolve footprint-library provenance warnings without changing pad geometry.",
        "Regenerate schematic parity, CAM and assembly data only after these reviews pass.",
        "Obtain a live one-unit PCB/PCBA quotation; no upload or order has been performed.",
    ],
}
(OUT / "candidate-review.json").write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n")
print(json.dumps(report, ensure_ascii=False))
