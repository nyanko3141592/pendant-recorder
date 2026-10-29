#!/usr/bin/env python3
"""Verify carrier DRC and exact inverse-translated unit serialization."""
from collections import Counter
from pathlib import Path
import hashlib
import json
import re

import pcbnew as k
import wx

app = wx.App(False)
HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
directory = HERE / "canonical-single-carrier-v1"
review_path = directory / "carrier-review.json"
review = json.loads(review_path.read_text())
source = ROOT / review["source"]
carrier = ROOT / review["carrier"]
drc_path = directory / "carrier-drc.json"
drc = json.loads(drc_path.read_text())

assert hashlib.sha256(source.read_bytes()).hexdigest() == review["source_sha256"]
assert hashlib.sha256(carrier.read_bytes()).hexdigest() == review["carrier_sha256"]
assert not drc["violations"] and not drc["unconnected_items"]
assert review["carrier_mm"] == [70, 70] and review["finished_board_mm"] == [27.5, 27.5]
assert review["finished_outline_changed"] is False
assert len(review["tooling_holes"]) == 3 and len(review["fiducials"]) == 3
assert len(review["retention_tabs"]) == 2 and all(tab["width_mm"] == 5.0 for tab in review["retention_tabs"])

a = k.LoadBoard(str(source))
b = k.LoadBoard(str(carrier))
source_refs = {fp.GetReference() for fp in a.GetFootprints()}
for fp in list(b.GetFootprints()):
    if fp.GetReference() not in source_refs:
        b.RemoveNative(fp)
delta = k.VECTOR2I(-k.FromMM(review["translation_mm"][0]), -k.FromMM(review["translation_mm"][1]))
for collection in (b.GetFootprints(), b.GetTracks(), b.Zones()):
    for item in collection:
        item.Move(delta)
for board in (a, b):
    for item in list(board.GetDrawings()):
        if item.GetLayer() == k.Edge_Cuts:
            board.RemoveNative(item)
for item in b.GetDrawings():
    item.Move(delta)

normalized_source = directory / "unit-normalized-source.kicad_pcb"
inverse_unit = directory / "unit-inverse-translated.kicad_pcb"
k.SaveBoard(str(normalized_source), a)
k.SaveBoard(str(inverse_unit), b)

def blocks(path, tag):
    text = path.read_text(); found = []
    for match in re.finditer(r"(?m)^\t\(" + re.escape(tag) + r"\b", text):
        start = match.start() + 1; depth = 0; quoted = False; escaped = False
        for index in range(start, len(text)):
            char = text[index]
            if quoted:
                if escaped: escaped = False
                elif char == "\\": escaped = True
                elif char == '"': quoted = False
            elif char == '"': quoted = True
            elif char == "(": depth += 1
            elif char == ")":
                depth -= 1
                if depth == 0:
                    found.append(text[start:index + 1]); break
    return Counter(found)

tags = ("footprint", "segment", "via", "arc", "zone", "gr_line", "gr_arc", "gr_rect", "gr_circle", "gr_poly", "gr_text")
comparisons = []
for tag in tags:
    left, right = blocks(normalized_source, tag), blocks(inverse_unit, tag)
    comparisons.append({"kind": tag, "source_count": sum(left.values()), "carrier_unit_count": sum(right.values()), "identical": left == right, "missing": sum((left-right).values()), "changed_or_extra": sum((right-left).values())})
assert all(row["identical"] for row in comparisons), comparisons

result = {
    "status": "PASS_CANONICAL_CARRIER_DRC_ZERO_AND_UNIT_SERIALIZATION_EQUAL",
    "source_sha256": review["source_sha256"],
    "carrier_sha256": review["carrier_sha256"],
    "drc_sha256": hashlib.sha256(drc_path.read_bytes()).hexdigest(),
    "drc_violations": 0,
    "unconnected_items": 0,
    "comparisons": comparisons,
    "limitations": ["CAD equivalence does not qualify router radius, tabs, double-reflow stiffness, depanelization or supplier acceptance."],
}
(directory / "carrier-equivalence-review.json").write_text(json.dumps(result, ensure_ascii=False, indent=2) + "\n")
print(json.dumps({"status": result["status"], "comparisons": len(comparisons)}))
