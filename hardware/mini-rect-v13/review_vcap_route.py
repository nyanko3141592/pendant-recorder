"""VCAP trace inventory bound to current microphone trial; not SI simulation."""
from pathlib import Path
import json,hashlib,wx,pcbnew as k
app=wx.App(False);p=Path(__file__).resolve().parent;src=p/'mic-jlc-overlap-candidate.kicad_pcb';b=k.LoadBoard(str(src));pads=[];tracks=[];vias=[]
for f in b.GetFootprints():
 for a in f.Pads():
  if a.GetNetname()=='/VCAP':pads.append(dict(ref=f.GetReference(),pad=a.GetNumber(),x_mm=k.ToMM(a.GetPosition().x),y_mm=k.ToMM(a.GetPosition().y),layer=f.GetLayerName()))
for t in b.GetTracks():
 if t.GetNetname()!='/VCAP':continue
 if isinstance(t,k.PCB_VIA):vias.append(dict(x_mm=k.ToMM(t.GetPosition().x),y_mm=k.ToMM(t.GetPosition().y),drill_mm=k.ToMM(t.GetDrillValue())))
 else:tracks.append(dict(start_mm=[k.ToMM(t.GetStart().x),k.ToMM(t.GetStart().y)],end_mm=[k.ToMM(t.GetEnd().x),k.ToMM(t.GetEnd().y)],width_mm=k.ToMM(t.GetWidth()),length_mm=k.ToMM(t.GetLength()),layer=t.GetLayerName()))
assert len(pads)==2
r=dict(status='ROUTE_INVENTORY_NOT_LOOP_QUALIFICATION',board_sha256=hashlib.sha256(src.read_bytes()).hexdigest(),pads=pads,tracks=tracks,vias=vias,total_trace_length_mm=sum(t['length_mm'] for t in tracks),limitations=['Trace length sums segments, not package/internal or ground return length','Ground return geometry and parasitics not characterized','Does not prove regulator stability'])
(p/'vcap-route-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
