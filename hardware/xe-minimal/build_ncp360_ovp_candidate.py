#!/usr/bin/env python3
"""Build, but do not adopt, the NCP360 USB overvoltage-protected PCB candidate."""
from pathlib import Path
import hashlib
import json
import shutil
import heapq
import math
import pcbnew as k
import wx

HERE = Path(__file__).resolve().parent
SRC = HERE / "pendant-xe-minimal.kicad_pcb"
OUTDIR = HERE / "ncp360-ovp-candidate"
OUT = OUTDIR / "pendant-xe-ncp360-ovp.kicad_pcb"
OUTDIR.mkdir(exist_ok=True)

app = wx.App(False)
b = k.LoadBoard(str(SRC))
assert b.FindFootprintByReference("U14") is None
assert b.FindFootprintByReference("C33") is None

raw = b.FindNet("/VBUS")
limited = b.FindNet("/VBUS_CHARGER")
gnd = b.FindNet("/GND")
protected = k.NETINFO_ITEM(b, "/VBUS_OVP")
b.Add(protected)

def mm(x, y): return k.VECTOR2I(k.FromMM(x), k.FromMM(y))
def xy(p): return (round(k.ToMM(p.x), 6), round(k.ToMM(p.y), 6))
def same(p, q, tolerance=0.01): return abs(xy(p)[0]-q[0]) < tolerance and abs(xy(p)[1]-q[1]) < tolerance

# Break the former raw-VBUS feed at a deliberate existing vertex.  Everything
# downstream of this segment (C31 and both TPS22950 VIN/ON pins) becomes the
# protected rail; the long connector-side network remains raw VBUS.
cut_a, cut_b = (16.7625, 2.2), (15.0125, 2.0)
removed = 0
for item in list(b.GetTracks()):
    if item.GetNetname() != "/VBUS" or isinstance(item, k.PCB_VIA):
        continue
    if (same(item.GetStart(), cut_a) and same(item.GetEnd(), cut_b)) or (same(item.GetStart(), cut_b) and same(item.GetEnd(), cut_a)):
        b.Remove(item); removed += 1
assert removed == 1, removed

u13 = b.FindFootprintByReference("U13")
c31 = b.FindFootprintByReference("C31")
for number in ("1", "2"):
    next(p for p in u13.Pads() if p.GetNumber() == number).SetNet(protected)
next(p for p in c31.Pads() if p.GetNumber() == "1").SetNet(protected)

# Retag only the now-isolated local copper tree joining U13 and C31.  The
# endpoints are intentionally explicit so future geometry drift fails closed.
retagged = 0
for item in b.GetTracks():
    if item.GetNetname() != "/VBUS" or isinstance(item, k.PCB_VIA):
        continue
    endpoints = (xy(item.GetStart()), xy(item.GetEnd()))
    if all(13.5 <= point[0] <= 15.1 and 0.8 <= point[1] <= 2.1 for point in endpoints):
        item.SetNet(protected); retagged += 1
assert retagged == 4, retagged

lib = "/Applications/KiCad/KiCad.app/Contents/SharedSupport/footprints/Package_TO_SOT_SMD.pretty"
u14 = k.FootprintLoad(lib, "SOT-23-5")
u14.SetFPID(k.LIB_ID("Package_TO_SOT_SMD", "SOT-23-5"))
u14.SetReference("U14")
u14.SetValue("NCP360SNT1G")
u14.SetPosition(mm(7.00, 7.00))
u14.SetOrientationDegrees(90)
u14.Reference().SetVisible(False)
pin_nets = {"1": raw, "2": gnd, "3": gnd, "5": protected}
for pad in u14.Pads():
    if pad.GetNumber() in pin_nets:
        pad.SetNet(pin_nets[pad.GetNumber()])
b.Add(u14)
flag = k.NETINFO_ITEM(b, "unconnected-(U14-FLAG-Pad4)")
b.Add(flag)
next(p for p in u14.Pads() if p.GetNumber() == "4").SetNet(flag)

# NCP360 requires at least 1uF at IN and OUT. C31 remains the output/TPS input
# capacitor; C33 is the new connector-side input capacitor close to U14.
template = b.FindFootprintByReference("C31")
c33 = k.Cast_to_FOOTPRINT(template.Duplicate(False))
c33.SetReference("C33")
c33.SetValue("1u 35V X5R")
c33.SetPosition(mm(10.00, 8.00))
c33.SetOrientationDegrees(180)
c33.Reference().SetVisible(False)
for pad in c33.Pads(): pad.SetNet(raw if pad.GetNumber() == "1" else gnd)
b.Add(c33)

def track(net, a, c, width=0.25, layer=k.F_Cu):
    t=k.PCB_TRACK(b); t.SetNet(net); t.SetLayer(layer); t.SetWidth(k.FromMM(width)); t.SetStart(mm(*a)); t.SetEnd(mm(*c)); b.Add(t)

def via(net, point, width=0.45, drill=0.20):
    v=k.PCB_VIA(b); v.SetNet(net); v.SetPosition(mm(*point)); v.SetWidth(k.FromMM(width)); v.SetDrill(k.FromMM(drill)); v.SetLayerPair(k.F_Cu,k.B_Cu); b.Add(v)

def point_segment_distance(point, start, end):
    dx, dy = end[0]-start[0], end[1]-start[1]
    if not dx and not dy:
        return math.dist(point, start)
    q = max(0.0, min(1.0, ((point[0]-start[0])*dx + (point[1]-start[1])*dy)/(dx*dx+dy*dy)))
    return math.hypot(point[0]-start[0]-q*dx, point[1]-start[1]-q*dy)

def route_astar(net, start, end, width=0.15, clearance=0.11, step=0.15, layer=k.F_Cu):
    """Route one connection around existing copper; DRC is authoritative."""
    obstacles, rectangles = [], []
    for item in b.GetTracks():
        if item.GetNetCode() == net.GetNetCode():
            continue
        is_via = isinstance(item, k.PCB_VIA)
        if is_via or item.GetLayer() == layer:
            radius = k.ToMM(item.GetWidth(layer) if is_via else item.GetWidth())/2 + width/2 + clearance
            obstacles.append((xy(item.GetStart()), xy(item.GetEnd()), radius))
    for fp in b.GetFootprints():
        for pad in fp.Pads():
            if pad.GetNetCode() == net.GetNetCode() or not pad.IsOnLayer(layer):
                continue
            box = pad.GetBoundingBox()
            margin = width/2 + clearance
            rectangles.append((k.ToMM(box.GetX())-margin, k.ToMM(box.GetY())-margin,
                               k.ToMM(box.GetRight())+margin, k.ToMM(box.GetBottom())+margin))

    def clear(point):
        x, y = point
        if not (0.35 < x < 27.15 and 0.35 < y < 27.15):
            return False
        if any(left < x < right and top < y < bottom for left, top, right, bottom in rectangles):
            return False
        return not any(point_segment_distance(point, a, c) < radius for a, c, radius in obstacles)

    def line_clear(a, c):
        count = max(1, math.ceil(math.dist(a, c)/0.06))
        # The exact endpoints may lie inside conservative obstacle envelopes.
        return all(clear((a[0]+(c[0]-a[0])*i/count, a[1]+(c[1]-a[1])*i/count))
                   for i in range(1, count))

    grid = {(ix, iy):(ix*step, iy*step)
            for ix in range(2, int(27.5/step)-1)
            for iy in range(2, int(27.5/step)-1)
            if clear((ix*step, iy*step))}
    starts = [node for node in sorted(grid, key=lambda n: math.dist(grid[n], start))[:80]
              if line_clear(start, grid[node])]
    goals = {node for node in sorted(grid, key=lambda n: math.dist(grid[n], end))[:80]
             if line_clear(grid[node], end)}
    cost, previous, queue = {}, {}, []
    for node in starts:
        cost[node] = math.dist(start, grid[node])
        previous[node] = None
        heapq.heappush(queue, (cost[node]+math.dist(grid[node], end), node))
    found, closed = None, set()
    moves = ((1,0),(-1,0),(0,1),(0,-1),(1,1),(1,-1),(-1,1),(-1,-1))
    while queue:
        _, node = heapq.heappop(queue)
        if node in closed:
            continue
        closed.add(node)
        if node in goals:
            found = node
            break
        for dx, dy in moves:
            nxt = (node[0]+dx, node[1]+dy)
            if nxt not in grid or nxt in closed or not line_clear(grid[node], grid[nxt]):
                continue
            candidate = cost[node] + step*math.hypot(dx, dy)
            if candidate < cost.get(nxt, 1e99):
                cost[nxt], previous[nxt] = candidate, node
                heapq.heappush(queue, (candidate+math.dist(grid[nxt], end), nxt))
    assert found is not None, (net.GetNetname(), start, end, len(closed))
    path, node = [end], found
    while node is not None:
        path.append(grid[node]); node = previous[node]
    path.append(start); path.reverse()
    simplified, index = [path[0]], 0
    while index < len(path)-1:
        candidate = len(path)-1
        while candidate > index+1 and not line_clear(path[index], path[candidate]):
            candidate -= 1
        simplified.append(path[candidate]); index = candidate
    for a, c in zip(simplified, simplified[1:]):
        track(net, a, c, width, layer)
    return simplified

# Placement endpoints retained for the next routing stage.  Placement was
# screened separately over a grid; do not add speculative crossing routes here.
p1=next(p for p in u14.Pads() if p.GetNumber()=="1").GetPosition()
p2=next(p for p in u14.Pads() if p.GetNumber()=="2").GetPosition()
p3=next(p for p in u14.Pads() if p.GetNumber()=="3").GetPosition()
p5=next(p for p in u14.Pads() if p.GetNumber()=="5").GetPosition()
c33p1=next(p for p in c33.Pads() if p.GetNumber()=="1").GetPosition()
c33p2=next(p for p in c33.Pads() if p.GetNumber()=="2").GetPosition()

# Local ground fan-in uses an existing ground via between U14 and C33.
track(gnd, xy(p2), xy(p3), 0.20)
track(gnd, xy(p3), (9.095,7.245), 0.20)
track(gnd, xy(c33p2), (9.095,7.245), 0.20)

# Keep both new power nets on the component layer for this prototype candidate.
# This avoids blind/buried vias and lets ordinary 6-layer JLC processing remain.
raw_paths = [
    route_astar(raw, xy(p1), xy(c33p1)),
    route_astar(raw, xy(c33p1), (12.646924,4.294999)),
]
protected_start_via, protected_end_via = (5.3, 6.5), cut_b
protected_path = [
    route_astar(protected, xy(p5), protected_start_via),
]
via(protected, protected_start_via)
via(protected, protected_end_via)
protected_path.append(route_astar(protected, protected_start_via, protected_end_via,
                                  width=0.20, clearance=0.12, step=0.20, layer=k.In1_Cu))

b.BuildConnectivity()
k.ZONE_FILLER(b).Fill(b.Zones())
k.SaveBoard(str(OUT), b)
shutil.copyfile(HERE / "pendant-xe-minimal.kicad_pro", OUT.with_suffix(".kicad_pro"))
shutil.copyfile(HERE / "pendant-xe-minimal.kicad_dru", OUT.with_suffix(".kicad_dru"))
report = {
    "status": "NCP360_OVP_PLACEMENT_SCREENED_ROUTING_PENDING_NOT_ADOPTED",
    "source": str(SRC.relative_to(HERE.parents[1])),
    "source_sha256": hashlib.sha256(SRC.read_bytes()).hexdigest(),
    "candidate": str(OUT.relative_to(HERE.parents[1])),
    "candidate_sha256": hashlib.sha256(OUT.read_bytes()).hexdigest(),
    "added": {"U14":"NCP360SNT1G","C33":"1u 35V X5R"},
    "power_path": ["J1 /VBUS", "U14 NCP360SNT1G", "/VBUS_OVP", "U13 TPS22950CDDCR", "/VBUS_CHARGER", "U3 BQ25185DLHR"],
    "placement": {"U14_xy_rotation":[7.0,7.0,90],"C33_xy_rotation":[10.0,8.0,180]},
    "routes": {"raw_vbus":raw_paths,"protected_vbus":protected_path},
    "limits": ["Not schematic-synchronized", "No abnormal-voltage or thermal result", "Not adopted; do not fabricate"],
}
(OUTDIR / "candidate-build.json").write_text(json.dumps(report, indent=2) + "\n")
print(json.dumps({"status":report["status"],"retagged":retagged,"output":str(OUT)}))
