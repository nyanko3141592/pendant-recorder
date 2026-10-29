"""Build a non-canonical candidate using DTP401525-XE's own 10k NTC."""

from __future__ import annotations

import hashlib
import json
import shutil
import subprocess
from pathlib import Path

import pcbnew as k
import wx


HERE = Path(__file__).resolve().parent
OUT = HERE / "pack-ntc-candidate"
PYTHON = Path(
    "/Applications/KiCad/KiCad.app/Contents/Frameworks/Python.framework/Versions/Current/bin/python3"
)
KICAD = "/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli"


def modify_design() -> None:
    data = json.loads((OUT / "design.json").read_text())
    by_ref = {part["ref"]: part for part in data["parts"]}
    j2 = by_ref["J2"]
    pin2 = next(pin for pin in j2["pins"] if pin["number"] == "2")
    assert pin2["net"] is None
    pin2["name"] = "PACK_NTC_10K"
    pin2["net"] = "BAT_TS"
    j2["note"] = (
        "DTP401525-XE fixed pack: P1 red BAT+, P2 white built-in 10k NTC, P3 black GND. "
        "Pack NTC drives the independent hardware hot/cold charge-inhibit comparators directly. "
        "Exact R-T curve remains a receiving-inspection and EVT requirement; no user wiring."
    )
    data["parts"] = [part for part in data["parts"] if part["ref"] != "TH1"]
    u10 = by_ref["U10"]
    ct = next(pin for pin in u10["pins"] if pin["number"] == "4")
    assert not ct["net"]
    ct["net"] = "unconnected-(U10-CT-Pad4)"
    data["temperature_sensor"] = "DTP401525-XE internal 10k NTC on connector pin 2"
    (OUT / "design.json").write_text(json.dumps(data, ensure_ascii=False, indent=2) + "\n")


def modify_board() -> None:
    app = wx.App(False)
    board_path = OUT / "pendant-xe-minimal.kicad_pcb"
    board = k.LoadBoard(str(board_path))
    j2 = board.FindFootprintByReference("J2")
    th1 = board.FindFootprintByReference("TH1")
    assert j2 and th1
    pad2 = j2.FindPadByNumber("2")
    bat_ts = board.FindNet("/BAT_TS")
    assert pad2.GetNetname().startswith("unconnected-(J2-") and bat_ts
    pad2.SetNet(bat_ts)
    u10 = board.FindFootprintByReference("U10")
    assert u10
    ct_net = board.FindNet("/unconnected-(U10-CT-Pad4)")
    if not ct_net:
        ct_net = k.NETINFO_ITEM(board, "/unconnected-(U10-CT-Pad4)")
        board.Add(ct_net)
    u10.FindPadByNumber("4").SetNet(ct_net)
    removed_pad_positions = [th1.FindPadByNumber(number).GetPosition() for number in ("1", "2")]
    for item in list(board.GetTracks()):
        if (
            isinstance(item, k.PCB_TRACK)
            and any(
                (item.GetStart() - point).EuclideanNorm() <= k.FromMM(0.01)
                or (item.GetEnd() - point).EuclideanNorm() <= k.FromMM(0.01)
                for point in removed_pad_positions
            )
        ):
            board.Delete(item)
    board.Delete(th1)

    # Safety takes precedence over the 0.5 mm size increase: extend the north
    # board edge and use the now-clear B.Cu strip instead of adding a blind via.
    old_edge_y = k.FromMM(0.0)
    new_edge_y = k.FromMM(-0.5)
    for drawing in board.GetDrawings():
        if drawing.GetLayer() != k.Edge_Cuts:
            continue
        start, end = drawing.GetStart(), drawing.GetEnd()
        if start.y == old_edge_y:
            drawing.SetStart(k.VECTOR2I(start.x, new_edge_y))
        if end.y == old_edge_y:
            drawing.SetEnd(k.VECTOR2I(end.x, new_edge_y))

    points = [
        pad2.GetPosition(),
        k.VECTOR2I(k.FromMM(3.525), k.FromMM(-0.2)),
        k.VECTOR2I(k.FromMM(17.6), k.FromMM(-0.2)),
        k.VECTOR2I(k.FromMM(17.6), k.FromMM(0.3)),
    ]
    for start, end in zip(points, points[1:]):
        track = k.PCB_TRACK(board)
        track.SetStart(start)
        track.SetEnd(end)
        track.SetLayer(k.B_Cu)
        track.SetWidth(k.FromMM(0.15))
        track.SetNet(bat_ts)
        board.Add(track)
    board.BuildConnectivity()
    k.ZONE_FILLER(board).Fill(board.Zones())
    k.SaveBoard(str(board_path), board)
    del app


OUT.mkdir(exist_ok=True)
for name in (
    "design.json",
    "pendant-xe-minimal.kicad_pcb",
    "pendant-xe-minimal.kicad_pro",
    "pendant-xe-minimal.kicad_dru",
    "fp-lib-table",
):
    shutil.copyfile(HERE / name, OUT / name)
for directory, source_dir in (
    ("Pendant.pretty", HERE / "Pendant.pretty"),
    ("PendantD1.pretty", HERE.parent / "mini-rect-v15/PendantD1.pretty"),
    ("PendantMinimal.pretty", HERE / "PendantMinimal.pretty"),
    ("PendantXE.pretty", HERE / "PendantXE.pretty"),
):
    if source_dir.exists():
        shutil.copytree(source_dir, OUT / directory, dirs_exist_ok=True)
fp_table = OUT / "fp-lib-table"
fp_table.write_text(
    fp_table.read_text().replace(
        "${KIPRJMOD}/../mini-rect-v15/PendantD1.pretty",
        "${KIPRJMOD}/PendantD1.pretty",
    )
)
modify_design()
modify_board()
subprocess.run([str(PYTHON), str(HERE / "generate_schematic.py"), "xe-minimal", str(OUT)], check=True)
subprocess.run(
    [
        KICAD,
        "pcb",
        "drc",
        str(OUT / "pendant-xe-minimal.kicad_pcb"),
        "--schematic-parity",
        "--format",
        "json",
        "--severity-all",
        "-o",
        str(OUT / "drc.json"),
    ],
    check=True,
)
drc = json.loads((OUT / "drc.json").read_text())
report = {
    "status": "PACK_NTC_ELECTRICAL_CANDIDATE_NOT_ADOPTED",
    "source_board_sha256": hashlib.sha256((HERE / "pendant-xe-minimal.kicad_pcb").read_bytes()).hexdigest(),
    "candidate_board_sha256": hashlib.sha256((OUT / "pendant-xe-minimal.kicad_pcb").read_bytes()).hexdigest(),
    "drc": {
        "violations": len(drc["violations"]),
        "schematic_parity": len(drc["schematic_parity"]),
        "unconnected_items": len(drc["unconnected_items"]),
    },
    "removed": ["TH1 NCU18XH103F60RB", "case thermal-gap-pad dependency"],
    "added": ["J2 pin 2 PACK_NTC_10K to BAT_TS"],
    "safety_basis": [
        "DTP401525-XE public product specification identifies the middle lead as NTC.",
        "Retail product specification identifies the embedded thermistor as 10k 0603.",
        "The existing dual-comparator resistance window is retained, so the MCU cannot override hot/cold charge inhibit.",
    ],
    "release_blockers": [
        "Confirm actual NTC resistance at controlled 0C, 10C, 25C, 35C and 45C for every approved pack lot.",
        "Confirm connector pin order from the mating side and open/short fault behavior.",
        "Run installed charge cutoff/recovery and thermal-lag EVT before enabling charge by default.",
    ],
}
(OUT / "review.json").write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n")
print(json.dumps(report, ensure_ascii=False))
