#!/usr/bin/env python3
"""Replace the R51 USB bridge with a TPS22950C 66mA-max limiter candidate."""
from pathlib import Path
import os
import math, heapq
import pcbnew as k
import wx

HERE = Path(__file__).resolve().parent
SRC = HERE / "pendant-xe-minimal.kicad_pcb"
OUT = Path(os.getenv("TPS22950_OUT", str(HERE / "tps22950-usb-limiter-candidate.kicad_pcb")))
app = wx.App(False)
board = k.LoadBoard(str(SRC))

def fp(ref):
    return next(x for x in board.GetFootprints() if x.GetReference() == ref)

old = fp("R51")
old_path = old.GetPath()
n_old_pads = [p.GetPosition() for p in old.Pads()]
n_vbus = board.FindNet("/VBUS")
n_out = board.FindNet("/VBUS_CHARGER")
n_gnd = board.FindNet("/GND")

# Remove the two short tails into the old bridge pads; preserve their other endpoints.
for t in list(board.GetTracks()):
    if isinstance(t, k.PCB_TRACK) and (t.GetStart() in n_old_pads or t.GetEnd() in n_old_pads):
        board.Remove(t)
board.Remove(old)

lib = "/Applications/KiCad/KiCad.app/Contents/SharedSupport/footprints/Package_TO_SOT_SMD.pretty"
u = k.FootprintLoad(lib, "SOT-23-6")
u.SetFPID(k.LIB_ID("Package_TO_SOT_SMD", "SOT-23-6"))
u.SetReference("U13")
u.SetValue("TPS22950CDDCR")
u.SetPath(old_path)
ux = float(os.getenv("U13_X", "12.30")); uy = float(os.getenv("U13_Y", "0.95"))
u.SetPosition(k.VECTOR2I(k.FromMM(ux), k.FromMM(uy)))
u.SetOrientationDegrees(180)
u.Reference().SetVisible(False)
pin_nets = {"1": n_vbus, "2": n_vbus, "3": n_gnd, "4": None, "5": n_out}
for p in u.Pads():
    if p.GetNumber() in pin_nets and pin_nets[p.GetNumber()] is not None:
        p.SetNet(pin_nets[p.GetNumber()])
board.Add(u)

# Pin 6 FLT is intentionally unused and gets a private no-connect net.
nc = k.NETINFO_ITEM(board, "unconnected-(U13-FLT-Pad6)")
board.Add(nc)
next(p for p in u.Pads() if p.GetNumber() == "6").SetNet(nc)

# Reuse R51 as the conservative 20k ILIM resistor. 19.2k has a guaranteed
# 66mA maximum; 20k (1%, minimum 19.8k) is strictly more conservative.
r = k.FootprintLoad(
    "/Applications/KiCad/KiCad.app/Contents/SharedSupport/footprints/Resistor_SMD.pretty",
    "R_0402_1005Metric",
)
r.SetFPID(k.LIB_ID("Resistor_SMD", "R_0402_1005Metric"))
r.SetReference("R51")
r.SetValue("RC0402FR-0720KL 20k 1%")
r.SetPosition(k.VECTOR2I(k.FromMM(9.2), k.FromMM(0.03)))
r.SetOrientationDegrees(0)
ilim = k.NETINFO_ITEM(board, "/USB_ILIM_SET")
board.Add(ilim)
for p in r.Pads(): p.SetNet(ilim if p.GetNumber() == "2" else n_gnd)
board.Add(r)
next(p for p in u.Pads() if p.GetNumber() == "4").SetNet(ilim)

def track(net, a, b, width=0.2, layer=k.F_Cu):
    t = k.PCB_TRACK(board)
    t.SetNet(net); t.SetLayer(layer); t.SetWidth(k.FromMM(width))
    t.SetStart(k.VECTOR2I(k.FromMM(a[0]), k.FromMM(a[1])))
    t.SetEnd(k.VECTOR2I(k.FromMM(b[0]), k.FromMM(b[1])))
    board.Add(t)

def via(net, xy):
    v = k.PCB_VIA(board)
    v.SetNet(net); v.SetPosition(k.VECTOR2I(k.FromMM(xy[0]), k.FromMM(xy[1])))
    v.SetWidth(k.FromMM(0.45)); v.SetDrill(k.FromMM(0.2))
    v.SetLayerPair(k.F_Cu, k.B_Cu); board.Add(v); return v

# Move two stitching/signal vias that occupy the selected SOT-6 land.
gnd_via = miso_via = None
for t in board.GetTracks():
    if type(t) is not k.PCB_VIA: continue
    p=t.GetPosition(); x, y = k.ToMM(p.x), k.ToMM(p.y)
    if abs(x-13.68) < 0.01 and abs(y-1.055) < 0.01 and t.GetNetname() == "/GND": gnd_via=t
    if abs(x-13.7) < 0.01 and abs(y-1.7) < 0.01 and t.GetNetname() == "/SD_MISO": miso_via=t
if gnd_via is not None: board.Remove(gnd_via)
if miso_via is not None:
    oldp=miso_via.GetPosition(); newp=k.VECTOR2I(k.FromMM(float(os.getenv('MISO_X','15.0'))),k.FromMM(float(os.getenv('MISO_Y','3.0'))))
    inner_to_replace=None
    for q in board.GetTracks():
        if q is miso_via: continue
        if q.GetLayer()==k.In2_Cu and (q.GetStart()==oldp or q.GetEnd()==oldp): inner_to_replace=q
        elif q.GetStart()==oldp: q.SetStart(newp)
        elif q.GetEnd()==oldp: q.SetEnd(newp)
    miso_via.SetPosition(newp)
    assert inner_to_replace is not None
    goalp = inner_to_replace.GetEnd() if inner_to_replace.GetStart()==oldp else inner_to_replace.GetStart()
    board.Remove(inner_to_replace)

    def xy(p): return (k.ToMM(p.x),k.ToMM(p.y))
    start, goal = xy(newp), xy(goalp)
    def point_seg_dist(p,s,e):
        dx,dy=e[0]-s[0],e[1]-s[1]
        q=max(0,min(1,((p[0]-s[0])*dx+(p[1]-s[1])*dy)/(dx*dx+dy*dy))) if dx or dy else 0
        return math.hypot(p[0]-s[0]-q*dx,p[1]-s[1]-q*dy)
    obs=[]; rect=[]
    for q in board.GetTracks():
        if q.GetNetCode()==miso_via.GetNetCode(): continue
        if type(q) is k.PCB_VIA:
            obs.append((xy(q.GetStart()),xy(q.GetEnd()),k.ToMM(q.GetWidth(k.In2_Cu))/2+.18))
        elif q.GetLayer()==k.In2_Cu:
            obs.append((xy(q.GetStart()),xy(q.GetEnd()),k.ToMM(q.GetWidth())/2+.18))
    for f in board.GetFootprints():
        for p in f.Pads():
            if p.GetNetCode()==miso_via.GetNetCode() or not p.IsOnLayer(k.In2_Cu): continue
            bb=p.GetBoundingBox(); m=.29 if p.GetAttribute()==k.PAD_ATTRIB_NPTH else .18
            rect.append((k.ToMM(bb.GetX())-m,k.ToMM(bb.GetY())-m,k.ToMM(bb.GetRight())+m,k.ToMM(bb.GetBottom())+m))
    def clear(p):
        if math.dist(p,start)<.3 or math.dist(p,goal)<.3: return True
        x,y=p
        return .25<x<27.25 and -.25<y<26.75 and not any(l<x<r and u<y<d for l,u,r,d in rect) and not any(point_seg_dist(p,s,e)<rad for s,e,rad in obs)
    def clear_line(s,e):
        n=max(1,math.ceil(math.dist(s,e)/.05))
        return all(clear((s[0]+(e[0]-s[0])*i/n,s[1]+(e[1]-s[1])*i/n)) for i in range(n+1))
    step=.1
    points={(x,y):(x*step,y*step) for x in range(70,181) for y in range(10,111) if clear((x*step,y*step))}
    starts=sorted(points,key=lambda z:math.dist(points[z],start))[:32]
    goals={z for z in points if math.dist(points[z],goal)<.3 and clear_line(points[z],goal)}
    cost={};prev={};queue=[]
    for z in starts:
        if clear_line(start,points[z]):
            cost[z]=math.dist(start,points[z]);prev[z]=None
            heapq.heappush(queue,(cost[z]+math.dist(points[z],goal),z))
    end=None;closed=set()
    while queue:
        _,z=heapq.heappop(queue)
        if z in closed: continue
        closed.add(z)
        if z in goals: end=z; break
        for dx,dy in ((1,0),(-1,0),(0,1),(0,-1),(1,1),(1,-1),(-1,1),(-1,-1)):
            w=(z[0]+dx,z[1]+dy)
            if w not in points or w in closed or not clear_line(points[z],points[w]): continue
            nc=cost[z]+step*math.hypot(dx,dy)
            if nc<cost.get(w,1e99):
                cost[w]=nc;prev[w]=z;heapq.heappush(queue,(nc+math.dist(points[w],goal),w))
    assert end is not None, 'no clear SD_MISO inner route'
    path=[];z=end
    while z is not None: path.append(points[z]);z=prev[z]
    path=[start]+list(reversed(path))+[goal]
    simple=[path[0]];i=0
    while i<len(path)-1:
        j=len(path)-1
        while j>i+1 and not clear_line(path[i],path[j]): j-=1
        simple.append(path[j]);i=j
    for a,b in zip(simple,simple[1:]): track(miso_via.GetNet(),a,b,.2,k.In2_Cu)

# Existing raw VBUS endpoint -> VIN, existing charger endpoint -> VOUT.
track(n_vbus, (15.0125, 2.0), (14.25, uy), 0.25)
track(n_vbus, (14.25, uy), (ux+1.1375, uy), 0.25)
track(n_out, (12.55, 2.55), (12.55, uy), 0.25)
track(n_out, (12.55, uy), (ux-1.1375, uy), 0.25)
# ON tied to VIN: dead-battery recovery does not depend on firmware.
track(n_vbus, (ux+1.1375, uy), (ux+1.1375, uy + 0.95), 0.2)
# GND pads connect directly to the refilled front ground zone; ILIM is local.
track(ilim, (ux-1.1375, uy - 0.95), (10.6, 0.03), 0.2)
track(ilim, (10.6, 0.03), (9.71, 0.03), 0.2)
track(n_gnd, (8.69, 0.03), (2.325, 0.03), 0.2)
track(n_gnd, (2.325, 0.03), (2.325, 0.45), 0.2)
# Explicitly join the limiter ground pin to the existing upper-left ground
# stitching network; the short detour avoids the ILIM trace.
track(n_gnd, (ux+1.1375, uy - 0.95), (ux+1.1375, -0.05), 0.2)
track(n_gnd, (ux+1.1375, -0.05), (17.3025, -0.05), 0.2)
track(n_gnd, (17.3025, -0.05), (17.3025, 1.029999), 0.2)

# The former straight PDM_DATA top-edge run intersects the new limiter. Remove
# only those two long segments and find a local front-copper detour, preserving
# both validated endpoint fanouts.
pdm = board.FindNet('/PDM_DATA')
pdm_start, pdm_goal = (19.75, 3.715), (18.1, 11.5)
# Replace the legacy multi-branch PDM route as one unit. This avoids preserving
# redundant stubs while making room for the USB limiter at the top edge.
for q in list(board.GetTracks()):
    if q.GetNetCode()==pdm.GetNetCode(): board.RemoveNative(q)
# U1 is bottom-mounted; retain its short bottom fanout to a standard via.
goal_via=via(pdm, pdm_goal)
goal_via.SetWidth(k.FromMM(.35)); goal_via.SetDrill(k.FromMM(.15))
track(pdm, (18.1025,11.205), pdm_goal, .15, k.B_Cu)
for q in list(board.GetTracks()):
    if (isinstance(q, k.PCB_TRACK) and q.GetNetCode() == pdm.GetNetCode()
            and q.GetLayer() == k.F_Cu
            and max(k.ToMM(q.GetStart().y), k.ToMM(q.GetEnd().y)) < 4.0):
        board.Remove(q)
for q in list(board.GetTracks()):
    if (type(q) is k.PCB_TRACK and q.GetNetCode()==pdm.GetNetCode()
            and q.GetLayer()==k.F_Cu and abs(k.ToMM(q.GetLength())-.3162278)<.001):
        board.Remove(q)
for q in list(board.GetTracks()):
    if (type(q) is k.PCB_TRACK and q.GetNetCode()==pdm.GetNetCode()
            and q.GetLayer()==k.F_Cu and abs(k.ToMM(q.GetLength())-1.45602199)<.001):
        board.Remove(q)
# The removed top run made its old 6.4/2.2 transition and short bottom stub
# redundant; remove both rather than leaving an antenna-like dangling branch.
for q in list(board.GetTracks()):
    if q.GetNetCode() != pdm.GetNetCode(): continue
    if type(q) is k.PCB_VIA:
        p=q.GetPosition()
        if abs(k.ToMM(p.x)-6.4)<.001 and abs(k.ToMM(p.y)-2.2)<.001: board.Remove(q)
    elif q.GetLayer()==k.B_Cu:
        pts={(round(k.ToMM(q.GetStart().x),3),round(k.ToMM(q.GetStart().y),3)),
             (round(k.ToMM(q.GetEnd().x),3),round(k.ToMM(q.GetEnd().y),3))}
        if (6.4,2.2) in pts and (7.3,5.6) in pts: board.Remove(q)
for q in list(board.GetTracks()):
    if type(q) is k.PCB_VIA and q.GetNetCode()==pdm.GetNetCode():
        p=q.GetPosition()
        if abs(k.ToMM(p.x)-7.3)<.001 and abs(k.ToMM(p.y)-5.6)<.001: board.Remove(q)
for q in list(board.GetTracks()):
    if (type(q) is k.PCB_TRACK and q.GetNetCode()==pdm.GetNetCode()
            and q.GetLayer()==k.F_Cu
            and min(k.ToMM(q.GetStart().x),k.ToMM(q.GetEnd().x)) < 10
            and max(k.ToMM(q.GetStart().y),k.ToMM(q.GetEnd().y)) < 9.8):
        board.Remove(q)

def route_astar(net, start, goal, layer):
    def pxy(p): return (k.ToMM(p.x), k.ToMM(p.y))
    def dseg(p,s,e):
        dx,dy=e[0]-s[0],e[1]-s[1]
        z=max(0,min(1,((p[0]-s[0])*dx+(p[1]-s[1])*dy)/(dx*dx+dy*dy))) if dx or dy else 0
        return math.hypot(p[0]-s[0]-z*dx,p[1]-s[1]-z*dy)
    obs=[]; rect=[]
    for q in board.GetTracks():
        if q.GetNetCode()==net.GetNetCode(): continue
        if type(q) is k.PCB_VIA:
            obs.append((pxy(q.GetStart()),pxy(q.GetEnd()),k.ToMM(q.GetWidth(layer))/2+.18))
        elif q.GetLayer()==layer:
            obs.append((pxy(q.GetStart()),pxy(q.GetEnd()),k.ToMM(q.GetWidth())/2+.18))
    for f in board.GetFootprints():
        for p in f.Pads():
            if p.GetNetCode()==net.GetNetCode() or not p.IsOnLayer(layer): continue
            bb=p.GetBoundingBox(); m=.29 if p.GetAttribute()==k.PAD_ATTRIB_NPTH else .18
            rect.append((k.ToMM(bb.GetX())-m,k.ToMM(bb.GetY())-m,k.ToMM(bb.GetRight())+m,k.ToMM(bb.GetBottom())+m))
    def clear(p):
        if math.dist(p,start)<.8 or math.dist(p,goal)<.8: return True
        x,y=p
        return (.25<x<27.25 and .25<y<26.75 and
                not any(l<x<r and u<y<d for l,u,r,d in rect) and
                not any(dseg(p,s,e)<rad for s,e,rad in obs))
    def line(s,e):
        n=max(1,math.ceil(math.dist(s,e)/.05))
        return all(clear((s[0]+(e[0]-s[0])*i/n,s[1]+(e[1]-s[1])*i/n)) for i in range(n+1))
    step=.1
    pts={(x,y):(x*step,y*step) for x in range(3,273) for y in range(3,268) if clear((x*step,y*step))}
    starts=sorted(pts,key=lambda z:math.dist(pts[z],start))[:32]
    goals={z for z in pts if math.dist(pts[z],goal)<.3 and line(pts[z],goal)}
    cost={}; prev={}; queue=[]
    for z in starts:
        if line(start,pts[z]):
            cost[z]=math.dist(start,pts[z]); prev[z]=None
            heapq.heappush(queue,(cost[z]+math.dist(pts[z],goal),z))
    end=None; closed=set()
    while queue:
        _,z=heapq.heappop(queue)
        if z in closed: continue
        closed.add(z)
        if z in goals: end=z; break
        for dx,dy in ((1,0),(-1,0),(0,1),(0,-1),(1,1),(1,-1),(-1,1),(-1,-1)):
            w=(z[0]+dx,z[1]+dy)
            if w not in pts or w in closed or not line(pts[z],pts[w]): continue
            nc=cost[z]+step*math.hypot(dx,dy)
            if nc<cost.get(w,1e99):
                cost[w]=nc; prev[w]=z
                heapq.heappush(queue,(nc+math.dist(pts[w],goal),w))
    assert end is not None, 'no clear PDM_DATA front route'
    path=[]; z=end
    while z is not None: path.append(pts[z]); z=prev[z]
    path=[start]+list(reversed(path))+[goal]; simple=[path[0]]; i=0
    while i<len(path)-1:
        j=len(path)-1
        while j>i+1 and not line(path[i],path[j]): j-=1
        simple.append(path[j]); i=j
    for a,b in zip(simple,simple[1:]): track(net,a,b,.15,layer)

# A DRC sweep identified 19/5 as a collision-free through-via site. Fan out
# there on the component side, then use In3 to reach the existing PDM via.
pdm_drop=(23.5,5.0)
via(pdm, pdm_drop)
route_astar(pdm, pdm_start, pdm_drop, k.F_Cu)
route_astar(pdm, pdm_drop, pdm_goal, k.In3_Cu)

k.ZONE_FILLER(board).Fill(board.Zones())
k.SaveBoard(str(OUT), board)
print(OUT)
