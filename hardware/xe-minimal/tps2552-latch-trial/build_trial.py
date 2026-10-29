#!/usr/bin/env python3
"""Build a non-canonical TPS2552DBVR-1 routing trial from the current board."""

from pathlib import Path
import shutil
import pcbnew
import wx

HERE = Path(__file__).resolve().parent
SOURCE = HERE.parent / "pendant-xe-minimal.kicad_pcb"
OUTPUT = HERE / "pendant-xe-tps2552-latch-trial.kicad_pcb"


def mm(x: float) -> int:
    return pcbnew.FromMM(x)


def point(x: float, y: float) -> pcbnew.VECTOR2I:
    return pcbnew.VECTOR2I(mm(x), mm(y))


app = wx.App(False)
board = pcbnew.LoadBoard(str(SOURCE))
u13 = board.FindFootprintByReference("U13")
r51 = board.FindFootprintByReference("R51")
assert u13
if u13.GetValue() == "TPS2552DBVR-1" and r51 is None:
    pcbnew.SaveBoard(str(OUTPUT), board)
    shutil.copyfile(HERE.parent / "pendant-xe-minimal.kicad_pro", HERE / "pendant-xe-tps2552-latch-trial.kicad_pro")
    shutil.copyfile(HERE.parent / "pendant-xe-minimal.kicad_dru", HERE / "pendant-xe-tps2552-latch-trial.kicad_dru")
    print(OUTPUT)
    raise SystemExit(0)
assert r51
u13.SetValue("TPS2552DBVR-1")

nets = {name: board.FindNet(name) for name in ("/VBUS_OVP", "/VBUS_CHARGER", "/GND", "/SYS", "/V3V3")}
assert all(nets.values())
fault_unconnected = pcbnew.NETINFO_ITEM(board, "unconnected-(U13-FAULT-Pad4)")
board.Add(fault_unconnected)

# Remove the former TPS22950 programming net and only the former U13 top-layer
# fanout. Preserve the downstream charger and upstream VBUS_OVP vias/inner routes.
remove_items = []
old_charger_via = None
for item in list(board.GetTracks()):
    if isinstance(item, pcbnew.PCB_VIA):
        x = pcbnew.ToMM(item.GetPosition().x)
        y = pcbnew.ToMM(item.GetPosition().y)
        if item.GetNetname() == "/VBUS_CHARGER" and abs(x - 11.5375) < 0.01 and abs(y - 1.25) < 0.01:
            old_charger_via = item
        continue
    if item.GetNetname() == "/USB_ILIM_SET":
        remove_items.append(item)
        continue
    coordinates = [
        pcbnew.ToMM(item.GetStart().x),
        pcbnew.ToMM(item.GetStart().y),
        pcbnew.ToMM(item.GetEnd().x),
        pcbnew.ToMM(item.GetEnd().y),
    ]
    if item.GetNetname() == "/GND" and min(coordinates[0], coordinates[2]) < 9.0 and max(coordinates[1], coordinates[3]) < 0.1:
        remove_items.append(item)
        continue
    if item.GetNetname() == "/GND" and any(
        abs(pcbnew.ToMM(pos.x) - 2.325) < 0.01 and abs(pcbnew.ToMM(pos.y) - 0.03) < 0.01
        for pos in (item.GetStart(), item.GetEnd())
    ):
        remove_items.append(item)
        continue
    if item.GetNetname() == "/SYS" and item.GetLayer() == pcbnew.In2_Cu and max(coordinates[1], coordinates[3]) <= 1.1:
        remove_items.append(item)
        continue
    if item.GetNetname() == "/V3V3" and item.GetLayer() == pcbnew.In4_Cu and min(coordinates[0], coordinates[2]) < 3.0 and max(coordinates[0], coordinates[2]) > 17.0:
        remove_items.append(item)
        continue
    if not isinstance(item, pcbnew.PCB_TRACK) or isinstance(item, pcbnew.PCB_VIA):
        continue
    if item.GetLayer() != pcbnew.F_Cu:
        continue
    if item.GetNetname() not in ("/VBUS_OVP", "/VBUS_CHARGER"):
        continue
    if min(coordinates[0], coordinates[2]) >= 10.5 and max(coordinates[0], coordinates[2]) <= 15.5 and max(coordinates[1], coordinates[3]) <= 3.0:
        remove_items.append(item)
assert old_charger_via is not None
old_via_position = old_charger_via.GetPosition()
for item in list(board.GetTracks()):
    if item is old_charger_via:
        continue
    if item.GetNetname() == "/VBUS_CHARGER" and (item.GetStart() == old_via_position or item.GetEnd() == old_via_position):
        if item not in remove_items:
            remove_items.append(item)
for item in remove_items:
    board.Remove(item)
board.Remove(old_charger_via)
board.Remove(r51)

# TPS2552 DBV: 1=IN, 2=GND, 3=active-low EN, 4=FAULT, 5=ILIM, 6=OUT.
pad_nets = {
    "1": "/VBUS_OVP",
    "2": "/GND",
    "3": "/GND",
    "4": "",
    "5": "/VBUS_OVP",
    "6": "/VBUS_CHARGER",
}
for pad in u13.Pads():
    target = pad_nets[pad.GetNumber()]
    if target:
        pad.SetNet(nets[target])
    else:
        pad.SetNet(fault_unconnected)


def track(net: str, start: tuple[float, float], end: tuple[float, float], width: float = 0.25, layer: int = pcbnew.F_Cu) -> None:
    segment = pcbnew.PCB_TRACK(board)
    segment.SetNet(nets[net])
    segment.SetLayer(layer)
    segment.SetWidth(mm(width))
    segment.SetStart(point(*start))
    segment.SetEnd(point(*end))
    board.Add(segment)


def via(net: str, xy: tuple[float, float], diameter: float = 0.45, drill: float = 0.20) -> pcbnew.PCB_VIA:
    item = pcbnew.PCB_VIA(board)
    item.SetNet(nets[net])
    item.SetPosition(point(*xy))
    item.SetWidth(pcbnew.F_Cu, mm(diameter))
    item.SetDrill(mm(drill))
    item.SetLayerPair(pcbnew.F_Cu, pcbnew.B_Cu)
    board.Add(item)
    return item


# IN and its local C31 retain the existing upstream inner-layer anchor.
track("/VBUS_OVP", (13.6375, 1.9), (15.0125, 2.0))
track("/VBUS_OVP", (15.02, 0.95), (15.0125, 2.0))

# ILIM-to-IN is the datasheet's guaranteed 50..100mA configuration. The board
# already requires filled/capped POFV; use one additional POFV in pad 5 rather
# than weaken the current bound or squeeze copper past the adjacent GND pad.
ilim_via = via("/VBUS_OVP", (11.3625, 0.95), 0.35, 0.15)
ilim_via.SetFillingMode(pcbnew.FILLING_MODE_FILLED)
ilim_via.SetCappingMode(pcbnew.CAPPING_MODE_CAPPED)
track("/VBUS_OVP", (11.3625, 0.95), (15.0125, 2.0), 0.20, pcbnew.In1_Cu)

# Detour the two former straight inner-layer rails around the new through via.
track("/SYS", (2.6, 1.0), (10.6, 0.35), 0.25, pcbnew.In2_Cu)
track("/SYS", (10.6, 0.35), (12.2, 0.20), 0.25, pcbnew.In2_Cu)
track("/SYS", (12.2, 0.20), (14.0, 0.60), 0.25, pcbnew.In2_Cu)
track("/SYS", (14.0, 0.60), (16.4, 1.0), 0.25, pcbnew.In2_Cu)
track("/SYS", (16.4, 1.0), (16.4, 0.35), 0.25, pcbnew.In2_Cu)
track("/SYS", (16.4, 0.35), (17.6, 0.35), 0.25, pcbnew.In2_Cu)
track("/SYS", (17.6, 0.35), (17.6, 0.6), 0.25, pcbnew.In2_Cu)
track("/V3V3", (17.3, 0.6), (12.2, 0.15), 0.25, pcbnew.In4_Cu)
track("/V3V3", (12.2, 0.15), (10.5, 0.15), 0.25, pcbnew.In4_Cu)
track("/V3V3", (10.5, 0.15), (2.7, 0.7), 0.25, pcbnew.In4_Cu)

# OUT rejoins the downstream charger route through a relocated via.
via("/VBUS_CHARGER", (10.0, 2.8))
track("/VBUS_CHARGER", (11.3625, 1.9), (10.75, 2.45))
track("/VBUS_CHARGER", (10.75, 2.45), (10.0, 2.8))
track("/VBUS_CHARGER", (10.0, 2.8), (4.4, 9.8), 0.25, pcbnew.In2_Cu)
track("/VBUS_CHARGER", (10.0, 2.8), (11.28, 1.8), 0.20, pcbnew.B_Cu)

# GND/EN use the former board-edge ground escape from pad 3.
track("/GND", (13.6375, 0.95), (13.6375, 0.0), 0.20)

board.BuildConnectivity()
pcbnew.ZONE_FILLER(board).Fill(board.Zones())
pcbnew.SaveBoard(str(OUTPUT), board)
shutil.copyfile(HERE.parent / "pendant-xe-minimal.kicad_pro", HERE / "pendant-xe-tps2552-latch-trial.kicad_pro")
shutil.copyfile(HERE.parent / "pendant-xe-minimal.kicad_dru", HERE / "pendant-xe-tps2552-latch-trial.kicad_dru")
print(OUTPUT)
