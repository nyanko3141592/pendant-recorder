#!/usr/bin/env python3
"""Build the expanded, unrouted four-layer cost-down routing input."""
from pathlib import Path
import json
import shutil

import wx
import pcbnew as k

app = wx.App(False)
HERE = Path(__file__).resolve().parent
OUT = HERE / "costdown/HW-V1.1-EVT-COSTDOWN"
source = HERE / "pendant-xe-minimal.kicad_pcb"
board_path = OUT / "hw-v1.1-evt-costdown-4layer-unrouted.kicad_pcb"
dsn_path = OUT / "hw-v1.1-evt-costdown-4layer-unrouted.dsn"
b = k.LoadBoard(str(source))

# Keep footprints and nets, remove every route/via/zone, then let the four-layer
# candidate be routed from the actual pad netlist instead of folding tracks.
for item in list(b.GetTracks()):
    b.RemoveNative(item)
for zone in list(b.Zones()):
    b.RemoveNative(zone)

# Replace the 27.5 mm outline with a 31.5 mm square while retaining the exact
# USB-side Y=-0.5 mm datum. Four extra millimetres on +X/+Y provide escape room.
for item in list(b.GetDrawings()):
    if item.GetLayer() == k.Edge_Cuts:
        b.RemoveNative(item)
for a, c in [((0, -0.5), (31.5, -0.5)), ((31.5, -0.5), (31.5, 31.0)),
             ((31.5, 31.0), (0, 31.0)), ((0, 31.0), (0, -0.5))]:
    edge = k.PCB_SHAPE(b)
    edge.SetShape(k.SHAPE_T_SEGMENT)
    edge.SetLayer(k.Edge_Cuts)
    edge.SetStart(k.VECTOR2I(k.FromMM(a[0]), k.FromMM(a[1])))
    edge.SetEnd(k.VECTOR2I(k.FromMM(c[0]), k.FromMM(c[1])))
    edge.SetWidth(k.FromMM(.05))
    b.Add(edge)

b.SetCopperLayerCount(4)
settings = b.GetDesignSettings()
settings.m_TrackMinWidth = k.FromMM(.15)
settings.m_ViasMinSize = k.FromMM(.45)
settings.m_MinThroughDrill = k.FromMM(.20)
k.SaveBoard(str(board_path), b)
shutil.copy2(HERE / "pendant-xe-minimal.kicad_dru", board_path.with_suffix(".kicad_dru"))
project = json.loads((HERE / "pendant-xe-minimal.kicad_pro").read_text())
# Freerouting uses a 0.0952 mm neck only where the dense U1/U8 escape needs it.
# This remains above JLC's published 0.09 mm multilayer limit.
project["board"]["design_settings"]["rules"]["min_track_width"] = 0.09
board_path.with_suffix(".kicad_pro").write_text(json.dumps(project, ensure_ascii=False, indent=2) + "\n")
assert k.ExportSpecctraDSN(b, str(dsn_path))

review = {
    "version": "HW-V1.1-EVT-COSTDOWN",
    "status": "UNROUTED_FOUR_LAYER_31P5MM_ORDINARY_VIA_AUTOROUTER_INPUT",
    "functional_netlist_source": str(source.relative_to(HERE.parents[1])),
    "board_mm": [31.5, 31.5],
    "growth_from_hw_v1_0_mm": [4.0, 4.0],
    "copper_layers": 4,
    "minimum_track_mm": .15,
    "ordinary_via_mm": {"diameter": .45, "drill": .20},
    "all_existing_routes_removed": True,
    "release_allowed": False,
    "next_gate": "Route, import session, restore GND planes, then require DRC=0, unconnected=0 and no hole-over-pad vias",
}
(OUT / "unrouted-4layer-review.json").write_text(json.dumps(review, ensure_ascii=False, indent=2) + "\n")
print(json.dumps(review, ensure_ascii=False))
