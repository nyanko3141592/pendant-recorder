#!/usr/bin/env python3
"""Build a 36 mm, four-layer, top-side-only EVT cost-down placement candidate."""
from pathlib import Path
import json
import shutil

import wx
import pcbnew as k

app = wx.App(False)
HERE = Path(__file__).resolve().parent
OUT = HERE / "costdown/HW-V1.2-EVT-ULTRACOST"
OUT.mkdir(parents=True, exist_ok=True)
source = HERE / "pendant-xe-minimal.kicad_pcb"
board_path = OUT / "hw-v1.2-evt-ultracost-4layer-single-side-placement.kicad_pcb"
dsn_path = OUT / "hw-v1.2-evt-ultracost-4layer-single-side-unrouted.dsn"
b = k.LoadBoard(str(source))

for item in list(b.GetTracks()): b.RemoveNative(item)
for zone in list(b.Zones()): b.RemoveNative(zone)
for item in list(b.GetDrawings()):
    if item.GetLayer() == k.Edge_Cuts: b.RemoveNative(item)
for a,c in [((0,-.5),(36,-.5)),((36,-.5),(36,35.5)),((36,35.5),(0,35.5)),((0,35.5),(0,-.5))]:
    e=k.PCB_SHAPE(b); e.SetShape(k.SHAPE_T_SEGMENT); e.SetLayer(k.Edge_Cuts)
    e.SetStart(k.VECTOR2I(k.FromMM(a[0]),k.FromMM(a[1]))); e.SetEnd(k.VECTOR2I(k.FromMM(c[0]),k.FromMM(c[1]))); e.SetWidth(k.FromMM(.05)); b.Add(e)
b.SetCopperLayerCount(4)

# Flip every fitted part to the top. This changes assembly side only, not nets.
for fp in b.GetFootprints():
    if fp.GetLayer() == k.B_Cu: fp.Flip(fp.GetPosition(), False)

def pad_rect(fp, margin=.05):
    # Pack from the fabrication courtyard. This catches component bodies while
    # avoiding reference-text/silkscreen extents that needlessly waste area.
    fp.BuildCourtyardCaches()
    courtyard=fp.GetCourtyard(k.F_CrtYd)
    box=courtyard.BBox() if not courtyard.IsEmpty() else fp.GetBoundingBox(False, False)
    xmin=k.ToMM(box.GetLeft())-margin; xmax=k.ToMM(box.GetRight())+margin
    ymin=k.ToMM(box.GetTop())-margin; ymax=k.ToMM(box.GetBottom())+margin
    return xmin,xmax,ymin,ymax

def move_center(fp,cx,cy):
    x0,x1,y0,y1=pad_rect(fp)
    fp.Move(k.VECTOR2I(k.FromMM(cx-(x0+x1)/2),k.FromMM(cy-(y0+y1)/2)))
    return pad_rect(fp)

def overlaps(a,c,gap=.05):
    return not (a[1]+gap<=c[0] or c[1]+gap<=a[0] or a[3]+gap<=c[2] or c[3]+gap<=a[2])

occupied=[]; placements={}
fixed={"J1":(18,31.3),"U8":(31.5,4.0),"SW1":(5.0,4.0),"D6":(5.0,9.0)}
for ref,center in fixed.items():
    fp=b.FindFootprintByReference(ref); rect=move_center(fp,*center); occupied.append(rect); placements[ref]=center

others=[fp for fp in b.GetFootprints() if fp.GetReference() not in fixed]
others.sort(key=lambda fp:(pad_rect(fp)[1]-pad_rect(fp)[0])*(pad_rect(fp)[3]-pad_rect(fp)[2]),reverse=True)
for fp in others:
    placed=False
    for yi in range(3,69):
        for xi in range(3,69):
            cx=.5*xi; cy=.5*yi
            rect=move_center(fp,cx,cy)
            if rect[0]<.7 or rect[1]>35.3 or rect[2]<.2 or rect[3]>34.8: continue
            if any(overlaps(rect,o) for o in occupied): continue
            occupied.append(rect); placements[fp.GetReference()]=(cx,cy); placed=True; break
        if placed: break
    if not placed: raise RuntimeError(f"No placement for {fp.GetReference()}")

k.SaveBoard(str(board_path),b)
shutil.copy2(HERE/"pendant-xe-minimal.kicad_dru",board_path.with_suffix(".kicad_dru"))
project=json.loads((HERE/"pendant-xe-minimal.kicad_pro").read_text())
project["board"]["design_settings"]["rules"]["min_track_width"]=.09
board_path.with_suffix(".kicad_pro").write_text(json.dumps(project,ensure_ascii=False,indent=2)+"\n")
assert k.ExportSpecctraDSN(b,str(dsn_path))
review={
 "version":"HW-V1.2-EVT-ULTRACOST","status":"FOUR_LAYER_SINGLE_SIDE_PLACEMENT_AND_AUTOROUTER_INPUT_NOT_RELEASED",
 "parent":"HW-V1.1-EVT-COSTDOWN","return_point":"hardware/xe-minimal/snapshots/HW-V1.0-2026-10-28/snapshot-manifest.json",
 "board_mm":[36.0,36.0],"growth_from_hw_v1_0_mm":[8.5,8.5],"copper_layers":4,
 "assembly_sides":1,"top_footprints":len(b.GetFootprints()),"bottom_footprints":0,
 "function_changes":[],"fixed_access_parts":fixed,"release_allowed":False,
 "next_gate":"Autoroute and review; placement feasibility is not electrical, thermal, acoustic or manufacturing qualification"
}
(OUT/"placement-review.json").write_text(json.dumps(review,ensure_ascii=False,indent=2)+"\n")
print(json.dumps(review,ensure_ascii=False))
