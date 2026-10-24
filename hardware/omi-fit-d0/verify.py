"""Independent geometric and net-membership audit; does not establish routability."""
import json,math,hashlib
from pathlib import Path
import pcbnew as pcb
P=Path(__file__).resolve().parent;d=json.loads((P/'placement.json').read_text());parts=json.loads((P/'parts.json').read_text());b=pcb.LoadBoard(str(P/'omi-fit-d0.kicad_pcb'))
fps={f.GetReference():f for f in b.GetFootprints()};issues=[]
assert set(fps)=={p['ref'] for p in parts}
for p in parts:
 f=fps[p['ref']];pins={q['number']:q['net'] or 'unconnected-'+p['ref']+'-'+q['number'] for q in p['pins']}
 for pad in f.Pads():
  n=pad.GetNumber()
  if not n or n=='MP':continue
  if pad.GetNetname()!=pins[n]:issues.append([p['ref'],n,'net mismatch'])
 # Actual final footprint bbox (not the packing algorithm's cached size).
 bb=f.GetBoundingBox(False,False);x,y,w,h=[pcb.ToMM(v) for v in (bb.GetX(),bb.GetY(),bb.GetWidth(),bb.GetHeight())];x-=100;y-=100
 for xx,yy in [(x,y),(x+w,y),(x,y+h),(x+w,y+h)]:
  qx=max(abs(xx)-9.5,0);qy=max(abs(yy)-9.5,0)
  if qx*qx+qy*qy>4+.0001:issues.append([p['ref'],'outside board'])
r=json.loads((P/'drc.json').read_text())
report=dict(order_ready=False,status='UNROUTED_FIT_STUDY',footprints=len(fps),populated_parts=69,pcb_contact_groups=7,net_or_boundary_issues=issues,drc_violations=len(r['violations']),unconnected_items=len(r['unconnected_items']),tracks=len(list(b.GetTracks())),schematic_parity_checked=False,source_circuit='hardware/rev-c/design.json; J2 SH footprint substituted, same 2-pin nets',limitations=['Actual component body height not audited','Protected round pack unavailable/unconfirmed','No new schematic release; not manufacturing BOM','USB through-hole clearance violations remain','PCB is wholly unrouted','No SPICE/thermal/firmware/hardware runtime simulation performed'],pcb_sha256=hashlib.sha256((P/'omi-fit-d0.kicad_pcb').read_bytes()).hexdigest())
(P/'order-status.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2));assert not issues
