"""Find a DRC-clean R12.1 -> SYS route without changing the board outline.

The canonical board may contain the rejected hand-routed trial identified by
TRIAL_UUIDS.  Every candidate is rebuilt from the canonical board with those
items removed.  KiCad DRC, including schematic parity, is authoritative.
"""
from __future__ import annotations

import heapq
import json
import math
import shutil
import subprocess
from pathlib import Path

import wx
import pcbnew as k


APP = wx.App(False)
ROOT = Path(__file__).resolve().parent
SOURCE = ROOT / "pendant-xe-minimal"
CANDIDATE = ROOT / "r12-sys-pullup-candidate"
REPORT = ROOT / "r12-sys-pullup-candidate-drc.json"
REVIEW = ROOT / "r12-sys-pullup-review.json"
CLI = "/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli"

TRIAL_UUIDS = {
    "48b1ca0e-acde-4c0d-b2b9-acde6e21ce12",
    "81679f79-acde-4cf9-b46d-62da72d42f61",
    "4ed933f9-6e8b-4cbd-82fc-584dcd721205",
    "65204bd0-b512-4487-bfe9-61fd0fe0927f",
    "93102d77-da28-4ed5-a9b3-056ec06ac349",
    "a658f73f-c8aa-4a4b-89a9-d2a0836f303b",
}
R12_SURFACE_UUID = "f142dc2e-9820-4288-bc77-278bad8e81db"
LAYERS = (k.In1_Cu, k.In2_Cu, k.In3_Cu, k.In4_Cu, k.B_Cu)
VIA_POINTS = sorted(
    ((x / 10, y / 10) for x in range(188, 236, 2) for y in range(228, 251, 2)),
    key=lambda point: math.dist(point, (18.795, 23.265)),
)


def mm(point):
    return k.ToMM(point.x), k.ToMM(point.y)


def vector(point):
    return k.VECTOR2I(k.FromMM(point[0]), k.FromMM(point[1]))


def point_segment_distance(point, start, end):
    dx, dy = end[0] - start[0], end[1] - start[1]
    if dx or dy:
        q = max(0.0, min(1.0, ((point[0] - start[0]) * dx + (point[1] - start[1]) * dy) / (dx * dx + dy * dy)))
    else:
        q = 0.0
    return math.hypot(point[0] - start[0] - q * dx, point[1] - start[1] - q * dy)


def clean_board():
    board = k.LoadBoard(str(SOURCE.with_suffix(".kicad_pcb")))
    for track in list(board.GetTracks()):
        if track.m_Uuid.AsString() in TRIAL_UUIDS:
            board.RemoveNative(track)
    surface = next(track for track in board.GetTracks() if track.m_Uuid.AsString() == R12_SURFACE_UUID)
    board.RemoveNative(surface)
    return board


def pad(board, ref, number):
    footprint = next(fp for fp in board.GetFootprints() if fp.GetReference() == ref)
    return next(item for item in footprint.Pads() if item.GetNumber() == number)


def through_via_clear(board, point, net_name):
    """Conservative all-copper-layer screen for a 0.35 mm through via."""
    for track in board.GetTracks():
        if track.GetNetname() == net_name:
            continue
        width = track.GetWidth(k.F_Cu) if isinstance(track, k.PCB_VIA) else track.GetWidth()
        radius = k.ToMM(width) / 2 + 0.175 + 0.1
        if point_segment_distance(point, mm(track.GetStart()), mm(track.GetEnd())) < radius:
            return False
    for footprint in board.GetFootprints():
        for item in footprint.Pads():
            if item.GetNetname() == net_name:
                continue
            box = item.GetBoundingBox()
            left = k.ToMM(box.GetX()) - 0.275
            top = k.ToMM(box.GetY()) - 0.275
            right = k.ToMM(box.GetRight()) + 0.275
            bottom = k.ToMM(box.GetBottom()) + 0.275
            if left < point[0] < right and top < point[1] < bottom:
                return False
    return True


def add_track(board, net, layer, start, end, width=0.1):
    track = k.PCB_TRACK(board)
    track.SetStart(vector(start))
    track.SetEnd(vector(end))
    track.SetLayer(layer)
    track.SetWidth(k.FromMM(width))
    track.SetNet(net)
    board.AddNative(track)
    track.thisown = False


def build_obstacles(board, layer, net_name, endpoints):
    lines, rectangles = [], []
    for track in board.GetTracks():
        if track.GetNetname() == net_name:
            continue
        is_via = isinstance(track, k.PCB_VIA)
        if is_via or track.GetLayer() == layer:
            width = k.ToMM(track.GetWidth(layer) if is_via else track.GetWidth())
            lines.append((mm(track.GetStart()), mm(track.GetEnd()), width / 2 + 0.15))
    for footprint in board.GetFootprints():
        for item in footprint.Pads():
            if item.GetNetname() == net_name or not item.IsOnLayer(layer):
                continue
            box = item.GetBoundingBox()
            rectangles.append((
                k.ToMM(box.GetX()) - 0.15,
                k.ToMM(box.GetY()) - 0.15,
                k.ToMM(box.GetRight()) + 0.15,
                k.ToMM(box.GetBottom()) + 0.15,
            ))

    def clear(point):
        if any(math.dist(point, endpoint) < 0.31 for endpoint in endpoints):
            return True
        x, y = point
        if not (0.3 < x < 26.7 and 0.3 < y < 26.7):
            return False
        if any(left < x < right and top < y < bottom for left, top, right, bottom in rectangles):
            return False
        return not any(point_segment_distance(point, start, end) < radius for start, end, radius in lines)

    def line_clear(start, end):
        count = max(1, math.ceil(math.dist(start, end) / 0.05))
        return all(clear((start[0] + (end[0] - start[0]) * i / count,
                          start[1] + (end[1] - start[1]) * i / count)) for i in range(count + 1))

    return clear, line_clear


def find_path(board, layer, start, destinations, net_name):
    clear, line_clear = build_obstacles(board, layer, net_name, [start, *destinations])
    step = 0.1
    points = {(x, y): (x * step, y * step)
              for x in range(3, 268) for y in range(3, 268)
              if clear((x * step, y * step))}
    starts = [node for node in sorted(points, key=lambda node: math.dist(points[node], start))[:30]
              if line_clear(start, points[node])]
    goal_nodes = {}
    for destination in destinations:
        for node in sorted(points, key=lambda item: math.dist(points[item], destination))[:30]:
            if line_clear(points[node], destination):
                goal_nodes[node] = destination
    costs, previous, queue = {}, {}, []
    for node in starts:
        costs[node] = math.dist(start, points[node])
        previous[node] = None
        heuristic = min(math.dist(points[node], destination) for destination in destinations)
        heapq.heappush(queue, (costs[node] + heuristic, node))
    found = None
    closed = set()
    while queue:
        _, node = heapq.heappop(queue)
        if node in closed:
            continue
        closed.add(node)
        if node in goal_nodes:
            found = node
            break
        for dx, dy in ((1, 0), (-1, 0), (0, 1), (0, -1), (1, 1), (1, -1), (-1, 1), (-1, -1)):
            neighbour = node[0] + dx, node[1] + dy
            if neighbour not in points or neighbour in closed or not line_clear(points[node], points[neighbour]):
                continue
            cost = costs[node] + step * math.hypot(dx, dy)
            if cost < costs.get(neighbour, 1e99):
                costs[neighbour] = cost
                previous[neighbour] = node
                heuristic = min(math.dist(points[neighbour], destination) for destination in destinations)
                heapq.heappush(queue, (cost + heuristic, neighbour))
    if found is None:
        return None
    destination = goal_nodes[found]
    path = [destination]
    node = found
    while node is not None:
        path.append(points[node])
        node = previous[node]
    path.append(start)
    path.reverse()
    simplified = [path[0]]
    index = 0
    while index < len(path) - 1:
        candidate = len(path) - 1
        while candidate > index + 1 and not line_clear(path[index], path[candidate]):
            candidate -= 1
        simplified.append(path[candidate])
        index = candidate
    return simplified


def run_drc(board):
    k.ZONE_FILLER(board).Fill(board.Zones())
    k.SaveBoard(str(CANDIDATE.with_suffix(".kicad_pcb")), board)
    subprocess.run([
        CLI, "pcb", "drc", str(CANDIDATE.with_suffix(".kicad_pcb")),
        "--schematic-parity", "--format", "json", "--severity-all", "-o", str(REPORT),
    ], check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    return json.loads(REPORT.read_text())


for extension in (".kicad_pro", ".kicad_dru", ".kicad_sch"):
    shutil.copyfile(SOURCE.with_suffix(extension), CANDIDATE.with_suffix(extension))

attempts = []
accepted = None
for via_point in VIA_POINTS:
    probe = clean_board()
    if not through_via_clear(probe, via_point, "/SYS"):
        attempts.append({"via_mm": via_point, "result": "VIA_CLEARANCE_SCREEN_REJECT"})
        continue
    for layer in LAYERS:
        board = clean_board()
        r12_pad = pad(board, "R12", "1")
        net = r12_pad.GetNet()
        start = mm(r12_pad.GetPosition())
        destinations = [mm(track.GetPosition()) for track in board.GetTracks()
                        if isinstance(track, k.PCB_VIA) and track.GetNetname() == "/SYS"]
        via = k.PCB_VIA(board)
        via.SetPosition(vector(via_point))
        via.SetWidth(k.FromMM(0.35))
        via.SetDrill(k.FromMM(0.15))
        via.SetLayerPair(k.F_Cu, k.B_Cu)
        via.SetNet(net)
        board.AddNative(via)
        via.thisown = False
        add_track(board, net, k.F_Cu, start, via_point, 0.15)
        path = find_path(board, layer, via_point, destinations, "/SYS")
        if path is None:
            attempts.append({"via_mm": via_point, "layer": board.GetLayerName(layer), "result": "NO_PATH"})
            continue
        for first, second in zip(path, path[1:]):
            add_track(board, net, layer, first, second)
        result = run_drc(board)
        summary = {
            "via_mm": via_point,
            "layer": board.GetLayerName(layer),
            "path_mm": path,
            "violations": len(result["violations"]),
            "schematic_parity": len(result["schematic_parity"]),
            "unconnected_items": len(result["unconnected_items"]),
        }
        attempts.append(summary)
        print(summary, flush=True)
        if not result["violations"] and not result["schematic_parity"] and not result["unconnected_items"]:
            accepted = summary
            break
    if accepted:
        break

REVIEW.write_text(json.dumps({"accepted": accepted, "attempts": attempts}, indent=2) + "\n")
if accepted is None:
    raise SystemExit("No DRC-clean R12 SYS route found")
print(json.dumps(accepted, indent=2))
