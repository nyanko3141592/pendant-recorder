import ast,json,hashlib,collections
from pathlib import Path
import wx,pcbnew as k
app=wx.App(False);w=Path(__file__).resolve().parent
source=w.parent/'costdown/HW-V1.4-EVT-4LAYER-27P5/route/hw-v1.4-evt-4layer-27p5-routed-candidate.kicad_pcb';import sys
p=w/(sys.argv[1] if len(sys.argv)>1 else 'usb-corridor-routed.kicad_pcb')
# Reuse the read-only reference sampler without running its file-writing main code.
module=ast.parse((w.parent/'audit_hw_v1_4_route_quality.py').read_text());node=next(n for n in module.body if isinstance(n,ast.FunctionDef) and n.name=='reference');import math
exec(compile(ast.Module(body=[node],type_ignores=[]),'<reference-sampler>','exec'))
b=k.LoadBoard(str(p));old=k.LoadBoard(str(source));hits=[]
for t in b.GetTracks():
 if not isinstance(t,k.PCB_VIA):continue
 for f in b.GetFootprints():
  for pad in f.Pads():
   for layer in (k.F_Cu,k.B_Cu):
    if pad.IsOnLayer(layer) and pad.GetEffectiveShape(layer).Collide(t.GetPosition(),t.GetDrillValue()//2):hits.append([f.GetReference(),pad.GetNumber(),str(t.GetNetname())])
d=json.loads((w/(p.stem.replace('-routed','')+'-drc.json')).read_text());types=collections.Counter(v['type'] for v in d['violations'])
r={'status':'TRIAL_REVIEW_NOT_ADOPTED','sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'geometric':sum(v for t,v in types.items() if t!='lib_footprint_issues'),'types':dict(types),'unconnected':len(d['unconnected_items']),'parity':len(d['schematic_parity']),'hole_over_pad_hits':hits,'via_counts':{'before':sum(isinstance(t,k.PCB_VIA) for t in old.GetTracks()),'after':sum(isinstance(t,k.PCB_VIA) for t in b.GetTracks())},'reference_before':reference(old,['/USB_DP','/USB_DM']),'reference_after':reference(b,['/USB_DP','/USB_DM']),'limitations':['Centerline sampling does not prove connected plane or impedance','Router narrowed 28 segments to 0.0952mm; expanded to minimum0.1 before this DRC','Power widths and original USB geometry must be compared before adoption'],'release_allowed':False}
(w/(p.stem+'-audit.json')).write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r))
