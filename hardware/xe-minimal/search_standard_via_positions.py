"""DRC-search ordinary dogbone locations for the four remaining pad vias.

Each search starts from the canonical board and moves one via only.  A result
is accepted only when full PCB DRC and unconnected checks both remain zero.
"""
from pathlib import Path
import json, shutil, subprocess, tempfile, sys
import pcbnew as k
import wx

app = wx.App(False)
HERE = Path(__file__).resolve().parent
CLI = "/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli"
SRC = HERE / "pendant-xe-minimal.kicad_pcb"

targets = {
    # uuid: (pad point, outward unit vector, tangent unit vector)
    "58d8777e-5726-406c-9002-92c3cbdf22de": ((20.29, 10.5175), (1, 0), (0, 1)),
    "d5f838d5-49c4-4b63-814d-c51369fbaf3e": ((18.1025, 11.205), (0, 1), (1, 0)),
    "c2faa17a-0df5-46e8-b7e0-a5c8f86431a4": ((13.415, 6.0175), (-1, 0), (0, 1)),
    "cd6f76be-442e-464d-affc-2baf7a4eb158": ((21.485, 15.185), (1, 0), (0, 1)),
}


def prepare_one(uuid: str):
    b = k.LoadBoard(str(SRC))
    via = next(t for t in b.GetTracks() if isinstance(t, k.PCB_VIA) and t.m_Uuid.AsString() == uuid)
    old = via.GetPosition(); attached = []
    for t in b.GetTracks():
        if isinstance(t, k.PCB_VIA) or t.GetNetCode() != via.GetNetCode():
            continue
        if t.GetStart() == old or t.GetEnd() == old: attached.append(t)
    # Preserve every existing route.  Add short stubs from the old pad/via
    # coordinate to the new via on every layer that previously terminated at
    # the via.  B.Cu is always included because these are bottom-side pads.
    layer_widths = {k.B_Cu: k.FromMM(.15)}
    for t in attached: layer_widths[t.GetLayer()] = t.GetWidth()
    stubs = []
    for layer, width in layer_widths.items():
        t = k.PCB_TRACK(b); t.SetLayer(layer); t.SetNet(via.GetNet()); t.SetWidth(width)
        t.SetStart(old); t.SetEnd(old); b.Add(t); stubs.append(t)
    return b, via, stubs


def move_one(output: Path, prepared, xy):
    b, via, stubs = prepared
    new = k.VECTOR2I(k.FromMM(xy[0]), k.FromMM(xy[1]))
    via.SetPosition(new)
    for t in stubs: t.SetEnd(new)
    k.SaveBoard(str(output), b)


results = {}
requested = set(sys.argv[1:])
with tempfile.TemporaryDirectory(prefix="xe-via-search-") as td:
    td = Path(td)
    shutil.copyfile(HERE / "pendant-xe-minimal.kicad_dru", td / "candidate.kicad_dru")
    shutil.copyfile(HERE / "pendant-xe-minimal.kicad_pro", td / "candidate.kicad_pro")
    shutil.copyfile(HERE / "fp-lib-table", td / "fp-lib-table")
    shutil.copytree(HERE / "PendantXE.pretty", td / "PendantXE.pretty")
    shutil.copytree(HERE / "PendantMinimal.pretty", td / "PendantMinimal.pretty")
    shutil.copytree(HERE.parent / "mini-rect-v15" / "PendantD1.pretty", td / "PendantD1.pretty")
    shutil.copytree(HERE.parent / "mini-rect-v15" / "input-control-pa2-pb5" / "Pendant_Input.pretty", td / "Pendant_Input.pretty")
    table = (td / "fp-lib-table").read_text()
    table = table.replace('${KIPRJMOD}/../mini-rect-v15/PendantD1.pretty', '${KIPRJMOD}/PendantD1.pretty')
    table = table.replace('${KIPRJMOD}/../mini-rect-v15/input-control-pa2-pb5/Pendant_Input.pretty', '${KIPRJMOD}/Pendant_Input.pretty')
    (td / "fp-lib-table").write_text(table)
    for uuid, (pad, outward, tangent) in targets.items():
        if requested and uuid not in requested and uuid[:8] not in requested: continue
        prepared = prepare_one(uuid)
        tested = 0; accepted = None; best = None
        # Minimum 0.55 mm clears the elongated pad edge plus 0.20 mm hole rule.
        for outward_mm in [x / 100 for x in range(55, 126, 5)]:
            for tangent_mm in [x / 100 for x in range(0, 61, 5)]:
                for sign in ([1] if tangent_mm == 0 else [1, -1]):
                    xy = (pad[0] + outward[0] * outward_mm + tangent[0] * tangent_mm * sign,
                          pad[1] + outward[1] * outward_mm + tangent[1] * tangent_mm * sign)
                    move_one(td / "candidate.kicad_pcb", prepared, xy); tested += 1
                    subprocess.run([CLI, "pcb", "drc", str(td / "candidate.kicad_pcb"),
                                    "--refill-zones", "--format", "json", "--severity-all", "-o", str(td / "drc.json")],
                                   check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
                    d = json.loads((td / "drc.json").read_text())
                    score = len(d["violations"]) + len(d["unconnected_items"])
                    if best is None or score < best[0]: best = (score, xy, len(d["violations"]), len(d["unconnected_items"]))
                    if score == 0:
                        accepted = {"xy_mm": xy, "outward_mm": outward_mm,
                                    "tangent_mm": tangent_mm * sign, "tested": tested}
                        shutil.copyfile(td / "candidate.kicad_pcb", HERE / f"standard-via-{uuid[:8]}-candidate.kicad_pcb")
                        break
                if accepted: break
            if accepted: break
        results[uuid] = {"accepted": accepted, "best": best, "tested": tested}
        print(uuid, results[uuid], flush=True)

(HERE / "standard-via-position-search.json").write_text(json.dumps(results, indent=2) + "\n")
