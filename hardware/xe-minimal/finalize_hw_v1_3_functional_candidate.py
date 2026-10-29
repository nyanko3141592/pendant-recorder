#!/usr/bin/env python3
"""Import and audit the function-clustered V1.3 routing candidate."""
from pathlib import Path
import collections, hashlib, json, shutil, subprocess
import wx
import pcbnew as k

app=wx.App(False)
HERE=Path(__file__).resolve().parent
BASE=HERE/"costdown/HW-V1.3-EVT-ECONOMIC"
OUT=BASE/"functional-placement"
placement=OUT/"hw-v1.3-functional-placement.kicad_pcb"
session=OUT/"hw-v1.3-functional-placement-routed.ses"
candidate=OUT/"hw-v1.3-functional-routed-candidate.kicad_pcb"
plane_source=BASE/"hw-v1.3-evt-economic-4layer-single-side-candidate.kicad_pcb"
b=k.LoadBoard(str(placement)); assert k.ImportSpecctraSES(b,str(session))
for item in b.GetTracks():
    if not isinstance(item,k.PCB_VIA) and item.GetWidth()<k.FromMM(.09): item.SetWidth(k.FromMM(.09))
parent=k.LoadBoard(str(plane_source))
for original,layer in zip(list(parent.Zones()),(k.In1_Cu,k.In2_Cu)):
    zone=k.Cast_to_ZONE(original.Duplicate(False)); zone.UnFill(); zone.SetLayer(layer); b.Add(zone)
k.SaveBoard(str(candidate),b)
for suffix in (".kicad_pro",".kicad_dru"): shutil.copy2(placement.with_suffix(suffix),candidate.with_suffix(suffix))
cli="/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli"
drc_path=OUT/"candidate-drc.json"
subprocess.run([cli,"pcb","drc","--refill-zones","--save-board","--format","json","--output",str(drc_path),str(candidate)],check=True)
drc=json.loads(drc_path.read_text()); types=collections.Counter(v["type"] for v in drc["violations"])
geometric=sum(v for k0,v in types.items() if k0!="lib_footprint_issues")
# Reload after CLI zone refill and summarize critical routed nets.
b=k.LoadBoard(str(candidate)); route=collections.defaultdict(lambda:{"length_mm":0.0,"vias":0,"layers":set()})
for item in b.GetTracks():
    n=item.GetNetname()
    if isinstance(item,k.PCB_VIA): route[n]["vias"]+=1
    else:
        route[n]["length_mm"]+=k.ToMM(item.GetLength()); route[n]["layers"].add(b.GetLayerName(item.GetLayer()))
critical={}
for n in ("/USB_DP","/USB_DM","/PDM_CLK","/PDM_DATA","/SD_CLK","/SD_CMD","/SD_D0","/SD_D1","/SD_D2","/SD_D3","/SYS","/V3V3","/SD_V3","/VBUS"):
    critical[n]={"length_mm":round(route[n]["length_mm"],3),"vias":route[n]["vias"],"layers":sorted(route[n]["layers"])}
report={
 "version":"HW-V1.3-EVT-FUNCTIONAL-ROUTED-CANDIDATE", "board_mm":[36,36], "layers":4, "assembly_sides":1,
 "footprints":len(b.GetFootprints()), "tracks_and_vias":len(b.GetTracks()), "zones":len(b.Zones()),
 "drc_geometric_violations":geometric, "drc_library_provenance_warnings":types.get("lib_footprint_issues",0),
 "unconnected_items":len(drc["unconnected_items"]), "critical_routes":critical,
 "usb_pair_length_mismatch_mm":round(abs(critical["/USB_DP"]["length_mm"]-critical["/USB_DM"]["length_mm"]),3),
 "candidate_sha256":hashlib.sha256(candidate.read_bytes()).hexdigest(), "release_allowed":False,
 "remaining_gates":["Manually replace/review autorouted USB pair with controlled geometry and continuous reference plane.","Review power widths, decoupling loops, PDM/SPI return paths and plane cuts.","Review microphone keepout/acoustic hole, connector access and all component heights against case CAD.","Resolve footprint library provenance warnings, then generate synchronized CAM/BOM/CPL."]
}
(OUT/"candidate-review.json").write_text(json.dumps(report,ensure_ascii=False,indent=2)+"\n")
print(json.dumps(report,ensure_ascii=False))
