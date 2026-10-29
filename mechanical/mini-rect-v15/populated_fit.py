"""Actual V15 placement envelope fit; no manufacturing approval."""
from pathlib import Path
import json,hashlib
import cadquery as cq
P=Path(__file__).resolve().parent;root=P.parents[1];source=root/'hardware/mini-rect-v15/xe-terminal-candidate.mechanical-handoff.json';h=json.loads(source.read_text());O=Path('/Users/takahashinaoki/Downloads/Pendant-v15-XE-populated-fit');O.mkdir(exist_ok=True)
def box(x,y,z,w,l,t):return cq.Workplane('XY').box(w,l,t).val().translate((x+w/2,y+l/2,z+t/2))
body=box(0,0,0,30,32,13.6).cut(box(1.2,1.2,1.2,27.6,29.6,14));lid=box(0,0,13.6,30,32,1.2);battery=box(1.5,1.5,1.5,15.5,27,4.2);pcb=box(2,1.5,8.6,*h['board_mm']);parts=[];checks=[]
for r in h['parts']:
 z=8.6+h['board_mm'][2] if r['side']=='F' else 8.6-r['height_mm'];shape=box(2+r['x_mm']-r['w_mm']/2,1.5+r['y_mm']-r['d_mm']/2,z,r['w_mm'],r['d_mm'],r['height_mm']);parts.append((r['ref'],shape))
 for name,target in [('body',body),('lid',lid),('battery',battery)]:
  vol=shape.intersect(target).Volume()
  if vol>1e-6:checks.append(dict(part=r['ref'],target=name,overlap_mm3=vol))
assembly=cq.Compound.makeCompound([body,lid,battery,pcb]+[s for _,s in parts]);cq.exporters.export(assembly,str(O/'XE-populated-NOT-MANUFACTURING.step'))
r=dict(status='POPULATED_ENVELOPE_SCREEN_NOT_RELEASED',source_board_sha256=h['source_sha256'],case_mm=[30,32,14.8],board_mm=h['board_mm'],component_count=len(parts),component_vs_body_lid_battery_intersections=checks,thermal_sensor_contact_gap_mm=8.6-.6-5.7,limitations=h['limitations']+['Conservative component envelopes can overstate body size','No USB opening, supports, closure, acoustic passage or thermal pad yet','Wire routing and mated connector insertion envelope are not included','Battery swelling and assembly tolerances are not qualified']);(P/'populated-fit-review.json').write_text(json.dumps(r,indent=2)+'\n');(O/'review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
