"""Audit current canonical board for plated via overlap with component pads."""
from __future__ import annotations

import hashlib
import json
from pathlib import Path
import sys

import pcbnew as k
import wx


app = wx.App(False)
here = Path(__file__).resolve().parent
board_path = Path(sys.argv[1]).resolve() if len(sys.argv) > 1 else here / "pendant-xe-minimal.kicad_pcb"
output_path = Path(sys.argv[2]).resolve() if len(sys.argv) > 2 else here / "exact-via-pad-overlap-audit.json"
board = k.LoadBoard(str(board_path))
flagged = []

for track in board.GetTracks():
    if not isinstance(track, k.PCB_VIA):
        continue
    hits = []
    for footprint in board.GetFootprints():
        for pad in footprint.Pads():
            if pad.GetAttribute() == k.PAD_ATTRIB_NPTH:
                continue
            for layer in (k.F_Cu, k.B_Cu):
                if not pad.IsOnLayer(layer):
                    continue
                shape = pad.GetEffectiveShape(layer)
                annulus_radius = track.GetWidth(layer) // 2
                if shape.Collide(track.GetPosition(), annulus_radius + k.FromMM(0.025)):
                    hits.append(
                        {
                            "ref": footprint.GetReference(),
                            "pad": pad.GetNumber(),
                            "net": pad.GetNetname(),
                            "layer": board.GetLayerName(layer),
                            "copper_overlap": shape.Collide(track.GetPosition(), annulus_radius),
                            "hole_overlaps_pad": shape.Collide(
                                track.GetPosition(), track.GetDrillValue() // 2
                            ),
                        }
                    )
    if hits:
        flagged.append(
            {
                "uuid": track.m_Uuid.AsString(),
                "xy_mm": [
                    k.ToMM(track.GetPosition().x),
                    k.ToMM(track.GetPosition().y),
                ],
                "hits": hits,
            }
        )

report = {
    "status": (
        "STANDARD_PROCESS_GEOMETRY_CLEAN"
        if not flagged
        else "OPEN_MANUFACTURING_REVIEW_REQUIRED"
    ),
    "board_sha256": hashlib.sha256(board_path.read_bytes()).hexdigest(),
    "method": "KiCad effective copper pad collision with via annulus plus 0.025 mm on F/B copper",
    "flagged_vias": len(flagged),
    "vias": flagged,
    "limitations": [
        "This geometric audit does not qualify drill registration, annular ring or solder-mask fabrication capability.",
        "Any hole-over-pad result must be moved off-pad or use a separately qualified filled/capped process.",
    ],
}
output_path.write_text(
    json.dumps(report, ensure_ascii=False, indent=2) + "\n"
)
print(json.dumps(report, ensure_ascii=False, indent=2))
