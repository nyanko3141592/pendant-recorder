"""Find candidate attachment corridors; not a CAD collision/strength approval."""
from pathlib import Path
import json,hashlib
P=Path(__file__).resolve().parent;H=P.parents[1]/'hardware/mini-rect-v13'
s=H/'usb-ground-plane-candidate.mechanical-handoff.json';h=json.loads(s.read_text());rows=[]
for side,x in [('left',1.2),('right',21.8)]:
 for y in [5,9,13,17,21]:
  overlaps=[];gap=.2
  for p in h['parts']:
   z=10.38 if p['side']=='F' else 9.45-p['height_mm']
   b=[1+p['x_mm']-p['w_mm']/2,1+p['x_mm']+p['w_mm']/2,1+p['y_mm']-p['d_mm']/2,1+p['y_mm']+p['d_mm']/2,z,z+p['height_mm']+.02]
   if min(x+.8+gap,b[1])-max(x-.8-gap,b[0])>0 and min(y+2+gap,b[3])-max(y-2-gap,b[2])>0 and min(13+gap,b[5])-max(11.3-gap,b[4])>0:overlaps.append(p['ref'])
  rows.append(dict(side=side,center_xy_mm=[x,y],envelope_mm=[1.6,4,1.7],z_min_mm=11.3,required_component_gap_mm=gap,conflicts=overlaps))
r=dict(status='ATTACHMENT_CORRIDOR_SCREEN_ONLY',board_max_thickness_mm=.93,board_bottom_z_mm=9.45,handoff_sha256=hashlib.sha256(s.read_bytes()).hexdigest(),candidates=rows,limitations=['AABB screen of current component envelopes only; not a CAD interference result','Does not include unqualified harness, fillets, battery swelling or supplier tolerance','No retention strength or printability established','Currentr8 still uses temporary tape; no released latch'],next_design='Only use corridors above z11.3 with max0.93mm board; old z11.1 corridor results are obsolete. Existing0.9mm tall tongues are alignment features, not qualified flexible snaps. Develop retention coupons before adoption.')
(P/'lid-attachment-screen-r8.json').write_text(json.dumps(r,indent=2)+'\n')
print([(r['side'],r['center_xy_mm'][1],r['conflicts']) for r in rows])
