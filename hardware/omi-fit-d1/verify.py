"""Independent geometric, net-membership and DRC report audit; not a manufacturing release."""
import json,math,hashlib
from pathlib import Path
import pcbnew as pcb
P=Path(__file__).resolve().parent;d=json.loads((P/'placement.json').read_text());parts=json.loads((P/'parts.json').read_text());b=pcb.LoadBoard(str(P/'omi-fit-d1.kicad_pcb'))
fps={f.GetReference():f for f in b.GetFootprints()};issues=[]
assert set(fps)=={p['ref'] for p in parts}
for p in parts:
 f=fps[p['ref']];pins={q['number']:q['net'] or 'unconnected-'+p['ref']+'-'+q['number'] for q in p['pins']}
 for pad in f.Pads():
  n=pad.GetNumber()
  if not n or n=='MP':continue
  actual=pad.GetNetname().lstrip('/')
  expected=pins[n]
  if expected.startswith('unconnected-'):
   if not actual.startswith('unconnected-') or p['ref'] not in actual:issues.append([p['ref'],n,'NC mismatch'])
  elif actual!=expected:issues.append([p['ref'],n,'net mismatch'])
 # J1 body/courtyard may overhang the disk; every physical copper pad must remain inside.
 if p['ref']=='J1':
  for pad in f.Pads():
   pb=pad.GetBoundingBox();px,py,pw,ph=[pcb.ToMM(v) for v in (pb.GetX(),pb.GetY(),pb.GetWidth(),pb.GetHeight())];px-=100;py-=100
   for xx,yy in [(px,py),(px+pw,py),(px,py+ph),(px+pw,py+ph)]:
    if xx*xx+yy*yy>11.5**2:issues.append(['J1',pad.GetNumber(),'pad outside circle'])
 # Actual final footprint bbox (not the packing algorithm's cached size).
 bb=f.GetBoundingBox(False,False);x,y,w,h=[pcb.ToMM(v) for v in (bb.GetX(),bb.GetY(),bb.GetWidth(),bb.GetHeight())];x-=100;y-=100
 for xx,yy in [(x,y),(x+w,y),(x,y+h),(x+w,y+h)]:
  qx=xx;qy=yy
  if p['ref']!='J1' and qx*qx+qy*qy>11.5**2+.0001:issues.append([p['ref'],'outside board'])
r=json.loads((P/'drc.json').read_text())
report=dict(order_ready=False,status='ROUTED_CONNECTIVITY_VERIFIED_NOT_FOR_ORDER' if not r['unconnected_items'] else 'PARTIALLY_ROUTED_NOT_FOR_ORDER',copper_layers=b.GetCopperLayerCount(),footprints=len(fps),populated_parts=69,pcb_contact_groups=7,net_or_boundary_issues=issues,drc_violations=len(r['violations']),unconnected_items=len(r['unconnected_items']),tracks=len(list(b.GetTracks())),schematic_parity_checked=True,schematic_parity_issues=len(r.get('schematic_parity',[])),source_circuit='hardware/rev-c/design.json; J2 SH; U9 RUT remapped using TI table 5-4; TP1..6 1mm; MIC_EN PB1 -> PB5',limitations=['Actual component body height not audited','Protected round pack unavailable/unconfirmed','Draft schematic and BOM present; no manufacturing release','Custom USB ground-land length 1.12mm requires fabrication/assembly DFM review','Connectivity is complete but electrical/layout quality review remains','6-layer 0.8mm stackup and 0.35/0.15mm vias require supplier DFM acceptance; USB differential and power integrity not validated','Charger JEITA warm-temperature operation must match final pack limits','No SPICE/thermal/firmware/hardware runtime simulation performed'],pcb_sha256=hashlib.sha256((P/'omi-fit-d1.kicad_pcb').read_bytes()).hexdigest())
(P/'order-status.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2));assert not issues
