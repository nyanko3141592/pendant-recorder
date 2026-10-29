#!/usr/bin/env python3
"""Build a 70 mm one-unit Standard-PCBA carrier from the canonical board.

The source board is never modified.  This creates review data only; supplier
acceptance, tab strength and depanelization remain physical/external gates.
Run with KiCad's bundled Python.
"""
from pathlib import Path
import hashlib
import json
import shutil

import pcbnew as k
import wx

app = wx.App(False)
HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
active = json.loads((HERE / "active-design.json").read_text())
source = HERE / active["board"]
source_sha = hashlib.sha256(source.read_bytes()).hexdigest()
out_dir = HERE / "canonical-single-carrier-v1"
out_dir.mkdir(exist_ok=True)
out = out_dir / "carrier.kicad_pcb"

for extension in (".kicad_pro", ".kicad_dru"):
    candidate = source.with_suffix(extension)
    if candidate.exists():
        shutil.copyfile(candidate, out.with_suffix(extension))
fp_table = HERE / "fp-lib-table"
if fp_table.exists():
    (out_dir / "fp-lib-table").write_text(fp_table.read_text().replace("${KIPRJMOD}", str(HERE)))

board = k.LoadBoard(str(source))
source_counts = {
    "footprints": len(list(board.GetFootprints())),
    "tracks_and_vias": len(list(board.GetTracks())),
    "zones": len(list(board.Zones())),
}

# Source outline is x=0..27.5, y=-0.5..27.0.  Center it in 70 mm.
translation_mm = [21.25, 22.0]
delta = k.VECTOR2I(k.FromMM(translation_mm[0]), k.FromMM(translation_mm[1]))
for collection in (board.GetFootprints(), board.GetTracks(), board.Zones()):
    for item in collection:
        item.Move(delta)
for item in list(board.GetDrawings()):
    if item.GetLayer() == k.Edge_Cuts:
        board.RemoveNative(item)
    else:
        item.Move(delta)

def vec(x, y):
    return k.VECTOR2I(k.FromMM(x), k.FromMM(y))

def add(item):
    board.AddNative(item)
    item.thisown = False

def edge(a, b):
    line = k.PCB_SHAPE(board)
    line.SetShape(k.SHAPE_T_SEGMENT)
    line.SetStart(vec(*a)); line.SetEnd(vec(*b))
    line.SetLayer(k.Edge_Cuts); line.SetWidth(k.FromMM(0.05))
    add(line)

# A 2 mm routed moat surrounds the finished board.  Two 5 mm tabs on the
# connector-free bottom edge retain it during double-sided assembly.
outer = [(70, 70), (70, 0), (0, 0), (0, 70), (70, 70)]
moat = [
    (19.25, 19.5), (50.75, 19.5), (50.75, 51.0),
    (44.5, 51.0), (44.5, 49.0), (48.75, 49.0),
    (48.75, 21.5), (21.25, 21.5), (21.25, 49.0),
    (25.5, 49.0), (25.5, 51.0), (19.25, 51.0), (19.25, 19.5),
]
bottom_center = [(30.5, 51.0), (30.5, 49.0), (39.5, 49.0), (39.5, 51.0), (30.5, 51.0)]
for ring in (outer, moat, bottom_center):
    for start, end in zip(ring, ring[1:]):
        edge(start, end)

tooling_holes = [("TOOL1", 12, 6), ("TOOL2", 58, 6), ("TOOL3", 12, 64)]
fiducials = [("FID1", 6, 6), ("FID2", 64, 6), ("FID3", 6, 64)]

for reference, x, y in tooling_holes:
    fp = k.FOOTPRINT(board); fp.SetReference(reference); fp.SetValue("Carrier tooling NPTH")
    fp.SetPosition(vec(x, y)); fp.SetAttributes(k.FP_EXCLUDE_FROM_BOM | k.FP_EXCLUDE_FROM_POS_FILES)
    fp.Reference().SetVisible(False); fp.Value().SetVisible(False)
    pad = k.PAD(fp); pad.SetAttribute(k.PAD_ATTRIB_NPTH); pad.SetShape(k.PAD_SHAPE_CIRCLE)
    pad.SetSize(vec(2, 2)); pad.SetDrillSize(vec(2, 2)); pad.SetLayerSet(k.LSET.AllCuMask()); pad.SetPosition(vec(x, y)); fp.Add(pad)
    for layer in (k.F_CrtYd, k.B_CrtYd):
        circle = k.PCB_SHAPE(fp); circle.SetShape(k.SHAPE_T_CIRCLE); circle.SetCenter(vec(x, y)); circle.SetEnd(vec(x + 1.5, y)); circle.SetLayer(layer); circle.SetWidth(k.FromMM(.05)); fp.Add(circle)
    add(fp)

for reference, x, y in fiducials:
    for suffix, copper, mask, courtyard in (("F", k.F_Cu, k.F_Mask, k.F_CrtYd), ("B", k.B_Cu, k.B_Mask, k.B_CrtYd)):
        fp = k.FOOTPRINT(board); fp.SetReference(reference + suffix); fp.SetValue("Carrier fiducial")
        fp.SetPosition(vec(x, y)); fp.SetLayer(copper); fp.SetAttributes(k.FP_EXCLUDE_FROM_BOM | k.FP_EXCLUDE_FROM_POS_FILES)
        fp.Reference().SetVisible(False); fp.Value().SetVisible(False)
        pad = k.PAD(fp); pad.SetAttribute(k.PAD_ATTRIB_SMD); pad.SetShape(k.PAD_SHAPE_CIRCLE); pad.SetSize(vec(1, 1)); pad.SetPosition(vec(x, y))
        layers = k.LSET(); layers.AddLayer(copper); pad.SetLayerSet(layers); fp.Add(pad)
        aperture = k.PAD(fp); aperture.SetNumber(""); aperture.SetAttribute(k.PAD_ATTRIB_SMD); aperture.SetShape(k.PAD_SHAPE_CIRCLE)
        aperture.SetSize(vec(2, 2)); aperture.SetPosition(vec(x, y)); mask_layers = k.LSET(); mask_layers.AddLayer(mask); aperture.SetLayerSet(mask_layers); fp.Add(aperture)
        circle = k.PCB_SHAPE(fp); circle.SetShape(k.SHAPE_T_CIRCLE); circle.SetCenter(vec(x, y)); circle.SetEnd(vec(x + 1.5, y)); circle.SetLayer(courtyard); circle.SetWidth(k.FromMM(.05)); fp.Add(circle)
        add(fp)

# Moving a zone also moves its source-matched saved fill polygons.  Do not
# refill here: the carrier outline must not silently change canonical copper.
k.SaveBoard(str(out), board)
assert hashlib.sha256(source.read_bytes()).hexdigest() == source_sha

report = {
    "status": "CANONICAL_70MM_SINGLE_CARRIER_CAD_CANDIDATE_NOT_RELEASED",
    "source": str(source.relative_to(ROOT)),
    "source_sha256": source_sha,
    "carrier": str(out.relative_to(ROOT)),
    "carrier_sha256": hashlib.sha256(out.read_bytes()).hexdigest(),
    "carrier_mm": [70, 70],
    "finished_board_mm": [27.5, 27.5],
    "finished_outline_changed": False,
    "translation_mm": translation_mm,
    "route_moat_mm": 2.0,
    "retention_tabs": [{"edge": "bottom", "x_mm": [25.5, 30.5], "width_mm": 5.0}, {"edge": "bottom", "x_mm": [39.5, 44.5], "width_mm": 5.0}],
    "tooling_holes": [{"reference": r, "center_mm": [x, y], "diameter_mm": 2} for r, x, y in tooling_holes],
    "fiducials": [{"reference": r, "center_mm": [x, y], "copper_mm": 1, "mask_mm": 2, "sides": ["F", "B"]} for r, x, y in fiducials],
    "source_counts": source_counts,
    "carrier_counts": {"footprints": len(list(board.GetFootprints())), "tracks_and_vias": len(list(board.GetTracks())), "zones": len(list(board.Zones()))},
    "required_physical_or_external_checks": ["router radius and actual route width", "tab stiffness through double reflow", "depanelization force", "finished-edge burr and residual tab", "supplier automatic-flow acceptance"],
    "orders_payments_uploads_vendor_contacts_performed": False,
}
(out_dir / "carrier-review.json").write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n")
print(json.dumps({"status": report["status"], "carrier": str(out), "sha256": report["carrier_sha256"]}))
