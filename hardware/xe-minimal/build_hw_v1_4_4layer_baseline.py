#!/usr/bin/env python3
"""Create the fixed-27.5 mm HW-V1.4 four-layer reroute baseline.

This never modifies the canonical six-layer board.  It folds the removed
layers only to expose conflicts quantitatively; the output is not fabrication
data until rerouted and all release checks pass.
"""
from pathlib import Path
import hashlib, json, shutil, subprocess
import wx
import pcbnew as k

app=wx.App(False)
HERE=Path(__file__).resolve().parent
OUT=HERE/"costdown/HW-V1.4-EVT-4LAYER-27P5"
OUT.mkdir(parents=True,exist_ok=True)
source=HERE/"pendant-xe-minimal.kicad_pcb"
candidate=OUT/"hw-v1.4-evt-4layer-27p5-baseline.kicad_pcb"
b=k.LoadBoard(str(source))

# Preserve F/B and the first two inner routing layers. Fold former In3/In4
# objects onto In1/In2 so DRC identifies every required reroute.
mapping={k.In3_Cu:k.In1_Cu,k.In4_Cu:k.In2_Cu}
track_counts={b.GetLayerName(x):0 for x in [k.F_Cu,k.In1_Cu,k.In2_Cu,k.In3_Cu,k.In4_Cu,k.B_Cu]}
for item in b.GetTracks():
    if not isinstance(item,k.PCB_VIA): track_counts[b.GetLayerName(item.GetLayer())]+=1
    if item.GetLayer() in mapping: item.SetLayer(mapping[item.GetLayer()])
for zone in list(b.Zones()):
    if zone.GetLayer()==k.In3_Cu: b.RemoveNative(zone)
    elif zone.GetLayer()==k.In4_Cu: zone.SetLayer(k.In2_Cu)
b.SetCopperLayerCount(4)
k.SaveBoard(str(candidate),b)
for suffix in (".kicad_pro",".kicad_dru"):
    shutil.copy2(HERE/("pendant-xe-minimal"+suffix),candidate.with_suffix(suffix))

cli="/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli"
drc_path=OUT/"baseline-drc.json"
subprocess.run([cli,"pcb","drc","--schematic-parity","--format","json","--severity-all","--output",str(drc_path),str(candidate)],check=False)
drc=json.loads(drc_path.read_text())
report={
 "version":"HW-V1.4-EVT-4LAYER-27P5",
 "status":"FOUR_LAYER_BASELINE_NOT_FABRICATION_READY",
 "source":"hardware/xe-minimal/pendant-xe-minimal.kicad_pcb",
 "candidate":str(candidate.relative_to(HERE.parents[1])),
 "board_outline_mm":[27.5,27.5],"assembly_sides":2,"copper_layers":4,
 "functional_changes":0,"placement_changes":0,
 "original_track_segments_by_layer":track_counts,
 "transform":"In3->In1, In4->In2, duplicate In3 zone removed; conflicts require reroute",
 "drc_violations":len(drc.get("violations",[])),
 "unconnected_items":len(drc.get("unconnected_items",[])),
 "schematic_parity":len(drc.get("schematic_parity",[])),
 "source_sha256":hashlib.sha256(source.read_bytes()).hexdigest(),
 "candidate_sha256":hashlib.sha256(candidate.read_bytes()).hexdigest(),
 "release_allowed":False,
 "next_gate":"Reroute to DRC0/unconnected0 while preserving USB reference return, power integrity and four current POFV nets or replace them with qualified dogbones",
 "external_actions":{"upload":False,"order":False,"payment":False,"supplier_contact":False}
}
(OUT/"baseline-review.json").write_text(json.dumps(report,ensure_ascii=False,indent=2)+"\n")
print(json.dumps(report,ensure_ascii=False))
