#!/usr/bin/env python3
"""Build a non-canonical TPS22917 SOT-23-6 placement/routing candidate."""
from pathlib import Path
import argparse
import json
import shutil
import pcbnew as k

ROOT = Path(__file__).resolve().parent
SOURCE = ROOT / "pre-u10-sot23-adoption" / "current.kicad_pcb"
OUTDIR = ROOT / "u10-sot23-candidate"
OUTDIR.mkdir(exist_ok=True)
OUT = OUTDIR / "pendant-xe-minimal.kicad_pcb"

parser = argparse.ArgumentParser()
parser.add_argument("--u10", nargs=2, type=float, default=(25.2, 2.5))
parser.add_argument("--c4", nargs=2, type=float, default=(25.5, 7.5))
parser.add_argument("--c25", nargs=2, type=float, default=(23.8, 6.2))
parser.add_argument("--c1", nargs=2, type=float, default=(25.3, 1.0))
parser.add_argument("--front-input-caps", action=argparse.BooleanOptionalAction, default=True)
parser.add_argument("--u10-rotation", type=float, default=90)
parser.add_argument("--right-edge", type=float, default=27.5)
args = parser.parse_args()

def mm(v):
    return int(round(v * 1_000_000))

def pt(x, y):
    return k.VECTOR2I(mm(x), mm(y))

b = k.LoadBoard(str(SOURCE))
# Extend the low-priority width dimension before any BOARD_ITEM removal; this
# avoids a KiCad 10 macOS SWIG iterator lifetime defect after b.Remove().
for shape in b.GetDrawings():
    if shape.GetLayer() != k.Edge_Cuts:
        continue
    start, end = shape.GetStart(), shape.GetEnd()
    if start.x == mm(24.0):
        start.x = mm(args.right_edge)
        shape.SetStart(start)
    if end.x == mm(24.0):
        end.x = mm(args.right_edge)
        shape.SetEnd(end)
old = next(f for f in b.GetFootprints() if f.GetReference() == "U10")
old_path = old.GetPath()
old_pos = old.GetPosition()

fp = k.FootprintLoad(
    "/Applications/KiCad/KiCad.app/Contents/SharedSupport/footprints/Package_TO_SOT_SMD.pretty",
    "SOT-23-6",
)
fp.SetParent(b)
fp.SetReference("U10")
fp.Reference().SetVisible(False)
fp.SetFPID(k.LIB_ID("Package_TO_SOT_SMD", "SOT-23-6"))
fp.SetValue("TPS22917DBVT")
fp.SetPath(old_path)
fp.SetPosition(pt(*args.u10))
fp.SetLayer(k.F_Cu)

nets = {n.GetNetname(): n for n in b.GetNetInfo().NetsByName().values()}
mapping = {
    "1": "/V3V3",
    "2": "/SD_EN",
    "3": "/GND",
    "4": "",
    "5": "/SD_V3",
    "6": "/SD_V3",
}
for pad in fp.Pads():
    number = pad.GetNumber()
    name = mapping[number]
    if name:
        pad.SetNet(nets[name])
fp.SetOrientationDegrees(args.u10_rotation)
fp.Flip(fp.GetPosition(), False)
pad_review = [
    {"number": p.GetNumber(), "net": p.GetNetname(),
     "xy_mm": [p.GetPosition().x / 1e6, p.GetPosition().y / 1e6]}
    for p in fp.Pads()
]
placed_rotation = fp.GetOrientationDegrees()
placed_side = fp.GetLayerName()

b.Remove(old)
b.Add(fp)

# Keep output decoupling beside VOUT and move the input bulk capacitor clear of
# the larger leaded package. Routing is intentionally rebuilt after placement.
for ref, x, y, angle in (("C4", *args.c4, 0), ("C25", *args.c25, 90), ("C1", *args.c1, 90)):
    f = next(xf for xf in b.GetFootprints() if xf.GetReference() == ref)
    f.SetPosition(pt(x, y))
    f.SetOrientationDegrees(angle)
    if args.front_input_caps and ref in ("C1", "C4") and f.GetLayer() == k.B_Cu:
        f.Flip(f.GetPosition(), False)

# Remove only short bottom-layer copper that terminated on old U10/C4/C25 pads.
# Other-layer backbone and vias remain as stable routing targets.
centres = [old_pos, pt(21.805, 1.055), pt(23.18, 4.91)]
for item in list(b.Tracks()):
    if item.GetLayer() != k.B_Cu or isinstance(item, k.PCB_VIA):
        continue
    if item.GetNetname() not in ("/V3V3", "/GND", "/SD_V3", "/SD_EN"):
        continue
    for c in centres:
        if min((item.GetStart() - c).EuclideanNorm(), (item.GetEnd() - c).EuclideanNorm()) <= mm(1.5):
            b.Remove(item)
            break

k.SaveBoard(str(OUT), b)
table = (ROOT / "fp-lib-table").read_text()
table = table.replace('${KIPRJMOD}/PendantXE.pretty', '${KIPRJMOD}/../PendantXE.pretty')
table = table.replace('${KIPRJMOD}/PendantMinimal.pretty', '${KIPRJMOD}/../PendantMinimal.pretty')
table = table.replace('${KIPRJMOD}/../mini-rect-v15/', '${KIPRJMOD}/../../mini-rect-v15/')
(OUTDIR / "fp-lib-table").write_text(table)
shutil.copyfile(ROOT / "pendant-xe-minimal.kicad_pro", OUTDIR / "pendant-xe-minimal.kicad_pro")
shutil.copyfile(ROOT / "pendant-xe-minimal.kicad_dru", OUTDIR / "pendant-xe-minimal.kicad_dru")
review = {
    "status": "PLACEMENT_AND_ROUTING_CANDIDATE_NOT_ADOPTED",
    "source": str(SOURCE.relative_to(ROOT)),
    "candidate": str(OUT.relative_to(ROOT)),
    "u10": {
        "mpn": "TPS22917DBVT",
        "jlc": "C2680344",
        "package": "SOT-23-6",
        "xy_mm": list(args.u10),
        "rotation_deg": placed_rotation,
        "side": placed_side,
        "pads": pad_review,
    },
    "moved": {"C4": list(args.c4), "C25": list(args.c25), "C1": list(args.c1)},
    "limitations": [
        "Candidate only; DRC and routing determine adoption.",
        "CT is open and QOD is tied to VOUT through the shared SD_V3 net, matching the TI functional table.",
        "No physical rise-time, discharge, reverse-current or 16-hour measurement."
    ],
}
(OUTDIR / "review.json").write_text(json.dumps(review, indent=2) + "\n")
print(json.dumps(review, indent=2))
