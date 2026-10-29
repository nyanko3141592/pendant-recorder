#!/usr/bin/env python3
"""Import, plane-fill and audit the fixed-outline HW-V1.4 4-layer route."""
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
OUT = HERE / "costdown/HW-V1.4-EVT-4LAYER-27P5/route"
placement = OUT / "hw-v1.4-evt-4layer-27p5-unrouted.kicad_pcb"
session = OUT / "hw-v1.4-evt-4layer-27p5-routed.ses"
candidate = OUT / "hw-v1.4-evt-4layer-27p5-routed-candidate.kicad_pcb"
plane_source = HERE / "pendant-xe-minimal.kicad_pcb"

import sys
if '--reimport-session' in sys.argv:
    b = k.LoadBoard(str(placement))
    assert k.ImportSpecctraSES(b, str(session))
    for item in b.GetTracks():
        if not isinstance(item, k.PCB_VIA) and item.GetWidth() < k.FromMM(0.10):
            item.SetWidth(k.FromMM(0.10))
    
    # Restore GND pours on both inner layers.  They refill around the imported
    # routes; continuity and USB reference quality are audited separately below.
    parent = k.LoadBoard(str(plane_source))
    template = list(parent.Zones())[0]
    for layer in (k.In1_Cu, k.In2_Cu):
        zone = k.Cast_to_ZONE(template.Duplicate(False))
        zone.UnFill()
        zone.SetLayer(layer)
        b.Add(zone)
    k.SaveBoard(str(candidate), b)
    for suffix in (".kicad_pro", ".kicad_dru"):
        shutil.copy2(placement.with_suffix(suffix), candidate.with_suffix(suffix))

shutil.copy2(HERE / "pendant-xe-minimal.kicad_sch", candidate.with_suffix(".kicad_sch"))

cli = "/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli"
drc_path = OUT / "candidate-drc.json"
subprocess.run([
    cli, "pcb", "drc", "--refill-zones", "--save-board", "--format", "json",
    "--severity-all", "--schematic-parity", "--output", str(drc_path), str(candidate)
], check=False)
drc = json.loads(drc_path.read_text())
types = collections.Counter(v["type"] for v in drc.get("violations", []))

b = k.LoadBoard(str(candidate))
route = collections.defaultdict(lambda: {"length_mm": 0.0, "vias": 0, "layers": set(), "minimum_width_mm": None})
via_pad_overlaps = []
for item in b.GetTracks():
    name = item.GetNetname()
    if isinstance(item, k.PCB_VIA):
        route[name]["vias"] += 1
        hits = []
        for fp in b.GetFootprints():
            for pad in fp.Pads():
                if pad.GetAttribute() == k.PAD_ATTRIB_NPTH:
                    continue
                for layer in (k.F_Cu, k.B_Cu):
                    if pad.IsOnLayer(layer) and pad.GetEffectiveShape(layer).Collide(item.GetPosition(), item.GetDrillValue() // 2):
                        hits.append({"ref": fp.GetReference(), "pad": pad.GetNumber(), "layer": b.GetLayerName(layer)})
        if hits:
            via_pad_overlaps.append({"net": name, "xy_mm": [round(k.ToMM(item.GetPosition().x), 4), round(k.ToMM(item.GetPosition().y), 4)], "hits": hits})
    else:
        route[name]["length_mm"] += k.ToMM(item.GetLength())
        route[name]["layers"].add(b.GetLayerName(item.GetLayer()))
        width = k.ToMM(item.GetWidth())
        old = route[name]["minimum_width_mm"]
        route[name]["minimum_width_mm"] = width if old is None else min(old, width)

critical_names = ("/USB_DP", "/USB_DM", "/PDM_CLK", "/PDM_DATA", "/SD_CLK", "/SD_CLK_MCU", "/SD_MOSI", "/SD_MISO", "/SD_CS_N", "/VBUS_CHARGER", "/BAT", "/SYS", "/V3V3", "/SD_V3", "/VBUS", "/VBUS_OVP", "/VBUS_N", "/CHG_N")
critical = {}
for name in critical_names:
    critical[name] = {
        "length_mm": round(route[name]["length_mm"], 3),
        "vias": route[name]["vias"],
        "layers": sorted(route[name]["layers"]),
        "minimum_width_mm": None if route[name]["minimum_width_mm"] is None else round(route[name]["minimum_width_mm"], 4),
    }

geometric = sum(count for kind, count in types.items() if kind != "lib_footprint_issues")
report = {
    "version": "HW-V1.4-EVT-4LAYER-27P5-ROUTED-CANDIDATE",
    "status": "ROUTED_ENGINEERING_CANDIDATE_NOT_RELEASED",
    "board_outline_mm": [27.5, 27.5],
    "copper_layers": 4,
    "assembly_sides": 2,
    "footprints": len(b.GetFootprints()),
    "tracks_and_vias": len(b.GetTracks()),
    "zones": len(b.Zones()),
    "drc_geometric_violations": geometric,
    "drc_violation_types": dict(types),
    "drc_library_provenance_warnings": types.get("lib_footprint_issues", 0),
    "unconnected_items": len(drc.get("unconnected_items", [])),
    "schematic_parity_items": len(drc.get("schematic_parity", [])),
    "schematic_parity_checked": True,
    "schematic_sha256": hashlib.sha256(candidate.with_suffix(".kicad_sch").read_bytes()).hexdigest(),
    "hole_over_pad_vias": len(via_pad_overlaps),
    "hole_over_pad_detail": via_pad_overlaps,
    "critical_routes": critical,
    "usb_pair_length_mismatch_mm": round(abs(critical["/USB_DP"]["length_mm"] - critical["/USB_DM"]["length_mm"]), 3),
    "candidate_sha256": hashlib.sha256(candidate.read_bytes()).hexdigest(),
    "release_allowed": False,
    "remaining_gates": [
        "Maintain geometric DRC=0, unconnected=0 and schematic parity=0 after further routing.",
        "Manually replace/qualify USB D+/D- as a controlled pair over a continuous reference.",
        "Qualify power widths, charger/decoupling loops, PDM/SPI return paths and inner-plane continuity.",
        "Maintain hole-over-pad=0; resolve footprint library provenance warnings.",
        "Regenerate synchronized CAM/BOM/CPL only after the engineering checks pass.",
    ],
    "external_actions": {"upload": False, "order": False, "payment": False, "supplier_contact": False},
}
(OUT / "candidate-review.json").write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n")
print(json.dumps(report, ensure_ascii=False))
