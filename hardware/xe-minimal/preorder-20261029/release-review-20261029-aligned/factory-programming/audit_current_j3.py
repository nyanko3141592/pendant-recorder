from pathlib import Path
import wx,pcbnew as k,json,hashlib
app=wx.App(False);p=Path('hardware/xe-minimal/preorder-20261029/release-review-20261029-aligned');src=p/'design/pendant-review.kicad_pcb';b=k.LoadBoard(str(src));j=next(f for f in b.GetFootprints() if f.GetReference()=='J3');rows=[]
for pad in j.Pads():rows.append({'pin':pad.GetNumber(),'net':pad.GetNetname(),'pcb_xy_mm':[k.ToMM(pad.GetPosition().x),k.ToMM(pad.GetPosition().y)],'pad_size_mm':[k.ToMM(pad.GetSize().x),k.ToMM(pad.GetSize().y)],'layer':b.GetLayerName(pad.GetLayer())})
out=p/'factory-programming';out.mkdir(exist_ok=True)
r={'pcb_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'connector':'J3 PCB pogo pads, not fitted connector','view':'KiCad board coordinates, top-view datum; backside fixture requires explicit mirror transform','footprint_layer':b.GetLayerName(j.GetLayer()),'pads':rows,'limits':['No physical pogo continuity/contact test','Coordinates are not a manufacturing fixture approval','V3V3 is VTREF sense; do not inject programmer power without validated power procedure']}
(out/'current-j3-interface.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r))
