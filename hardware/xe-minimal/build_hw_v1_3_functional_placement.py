#!/usr/bin/env python3
"""Build a function-clustered 36 mm placement for HW-V1.3.

This replaces the area-only V1.2 packing.  Connectors and ICs are anchored in
the actual signal/power flow; passives are then packed near the barycenter of
the fixed devices on their nets.  It is an unrouted engineering candidate.
"""
from pathlib import Path
import json
import math
import shutil

import wx
import pcbnew as k

app = wx.App(False)
HERE = Path(__file__).resolve().parent
BASE = HERE / "costdown/HW-V1.3-EVT-ECONOMIC"
OUT = BASE / "functional-placement"
OUT.mkdir(parents=True, exist_ok=True)
source = BASE / "hw-v1.3-evt-economic-4layer-single-side-candidate.kicad_pcb"
board_path = OUT / "hw-v1.3-functional-placement.kicad_pcb"
dsn_path = OUT / "hw-v1.3-functional-placement.dsn"
b = k.LoadBoard(str(source))
for item in list(b.GetTracks()): b.RemoveNative(item)
for zone in list(b.Zones()): b.RemoveNative(zone)

anchors = {
    # USB entry and protection, top edge.
    "J1": (18.0, 31.3), "U2": (18.0, 24.8), "U14": (29.0, 28.0),
    # Core, storage, switched storage rail.
    "U1": (17.5, 18.5), "U11": (8.0, 20.0), "U10": (8.0, 13.5),
    # USB power limiter, charger, battery connector and temperature guard.
    "U13": (29.0, 22.5), "U3": (28.0, 17.5), "J2": (31.0, 12.0),
    "U12": (26.0, 5.0), "Q3": (33.0, 26.6), "Q4": (23.0, 10.0),
    # Main LDO and bottom-port microphone/acoustic edge.
    "U4": (18.0, 11.0), "U8": (18.0, 4.0),
    # Human access and factory test.
    "SW1": (5.0, 4.0), "D6": (5.0, 9.0), "J3": (7.0, 30.0),
    "TP1": (1.8, 15.0), "TP2": (1.8, 19.0), "TP3": (1.8, 23.0),
    "TP5": (33.0, 4.0), "TP6": (33.0, 30.0),
}

def courtyard_rect(fp, margin=.05):
    fp.BuildCourtyardCaches()
    poly = fp.GetCourtyard(k.F_CrtYd)
    box = poly.BBox() if not poly.IsEmpty() else fp.GetBoundingBox(False, False)
    return (k.ToMM(box.GetLeft())-margin, k.ToMM(box.GetRight())+margin,
            k.ToMM(box.GetTop())-margin, k.ToMM(box.GetBottom())+margin)

def move_center(fp, cx, cy):
    x0,x1,y0,y1 = courtyard_rect(fp)
    fp.Move(k.VECTOR2I(k.FromMM(cx-(x0+x1)/2), k.FromMM(cy-(y0+y1)/2)))
    return courtyard_rect(fp)

def overlaps(a, c, gap=.08):
    return not (a[1]+gap <= c[0] or c[1]+gap <= a[0] or
                a[3]+gap <= c[2] or c[3]+gap <= a[2])

occupied=[]
for ref, xy in anchors.items():
    fp=b.FindFootprintByReference(ref)
    assert fp is not None, ref
    rect=move_center(fp,*xy)
    ymax = 36.0 if ref == "J1" else 35.2
    assert rect[0] >= .6 and rect[1] <= 35.4 and rect[2] >= -.3 and rect[3] <= ymax, (ref,rect)
    assert not any(overlaps(rect,o) for o in occupied), (ref,rect)
    occupied.append(rect)

# Build fixed-device positions by net. Passives gravitate toward the devices
# they serve, which shortens decoupling, dividers and series resistors.
net_points={}
for ref, xy in anchors.items():
    fp=b.FindFootprintByReference(ref)
    for pad in fp.Pads():
        if pad.GetNetCode(): net_points.setdefault(pad.GetNetname(),[]).append(xy)

others=[fp for fp in b.GetFootprints() if fp.GetReference() not in anchors]
others.sort(key=lambda fp:(courtyard_rect(fp)[1]-courtyard_rect(fp)[0])*(courtyard_rect(fp)[3]-courtyard_rect(fp)[2]), reverse=True)
placements=dict(anchors)
for fp in others:
    points=[]
    for pad in fp.Pads(): points.extend(net_points.get(pad.GetNetname(),[]))
    target=(sum(x for x,_ in points)/len(points), sum(y for _,y in points)/len(points)) if points else (18,18)
    candidates=[]
    for yi in range(2,70):
        for xi in range(2,70):
            cx=.5*xi; cy=.5*yi
            candidates.append(((cx-target[0])**2+(cy-target[1])**2,cx,cy))
    placed=False
    for _,cx,cy in sorted(candidates):
        rect=move_center(fp,cx,cy)
        if rect[0]<.6 or rect[1]>35.4 or rect[2]<.3 or rect[3]>35.0: continue
        if any(overlaps(rect,o) for o in occupied): continue
        occupied.append(rect); placements[fp.GetReference()]=(cx,cy); placed=True; break
    if not placed: raise RuntimeError(f"No placement for {fp.GetReference()}")

k.SaveBoard(str(board_path),b)
for suffix in (".kicad_pro",".kicad_dru"):
    shutil.copy2(source.with_suffix(suffix),board_path.with_suffix(suffix))
assert k.ExportSpecctraDSN(b,str(dsn_path))
review={
    "version":"HW-V1.3-EVT-FUNCTIONAL-PLACEMENT",
    "status":"UNROUTED_PLACEMENT_CANDIDATE",
    "board_mm":[36,36], "assembly_sides":1, "footprints":len(b.GetFootprints()),
    "anchors":anchors, "placements":placements,
    "intent":["short USB connector-to-ESD-to-MCU path", "contiguous USB power protection/charger/battery path", "short MCU-to-storage path", "microphone at acoustic edge"],
    "release_allowed":False,
    "next_gate":"Route, refill planes, run DRC and inspect USB pair, PDM/SPI, power widths and return paths"
}
(OUT/"placement-review.json").write_text(json.dumps(review,ensure_ascii=False,indent=2)+"\n")
print(json.dumps({k:review[k] for k in ("version","board_mm","assembly_sides","footprints","status")}))
