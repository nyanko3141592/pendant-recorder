"""Envelope screen of a metal-nut alternative, not a finished closure."""
from pathlib import Path
import json,math,hashlib
p=Path(__file__).resolve().parent;hpath=p.parents[1]/'hardware/mini-rect-v13/usb-ground-plane-candidate.mechanical-handoff.json';h=json.loads(hpath.read_text())
rows=[]
for x in [2.2,20.8]:
 for y in [5,9,13]:
  envs={'nut_carrier':[x-1.7,x+1.7,y-1.9,y+1.9,12.3,13.7],'screw':[x-.5,x+.5,y-.5,y+.5,12.1,14.1]}
  conflicts={}
  for name,b in envs.items():
   refs=[]
   for q in h['parts']:
    z=10.38 if q['side']=='F' else 9.45-q['height_mm'];a=[1+q['x_mm']-q['w_mm']/2,1+q['x_mm']+q['w_mm']/2,1+q['y_mm']-q['d_mm']/2,1+q['y_mm']+q['d_mm']/2,z,z+q['height_mm']+.02]
    if all(min(b[k+1]+.2,a[k+1])>max(b[k]-.2,a[k]) for k in [0,2,4]):refs.append(q['ref'])
   conflicts[name]=refs
  edge=min(x,23-x)-.9;roof=12.81+math.sqrt(4-(2-edge)**2)
  rows.append(dict(x=x,y=y,component_conflicts=conflicts,head_to_curved_roof_mm=roof-14.55))
r=dict(status='METAL_NUT_ENVELOPE_CANDIDATE_NOT_CAD_APPROVED',handoff_sha256=hashlib.sha256(hpath.read_bytes()).hexdigest(),screw=dict(mpn='SNZS-M1-2',pitch_mm=.25,length_mm=2,head_diameter_mm=1.8,head_height_mm=.45,source='https://static.nbk1560.com/products/specialscrew/nedzicom/miniaturescrew/SNZS-M/SNZS-M1/'),nut=dict(mpn='SHNS-M1',across_flats_mm=2.5,height_mm=.8,source='https://www.nbk1560.com/images/ja-JP/product/miniaturescrew/SHNS/SHNS_1.pdf'),stack_mm=dict(carrier_bottom=12.3,nut_bottom=12.6,nut_top=13.4,carrier_cap_top=13.7,lid_support_bottom=13.8,head_seat=14.1,head_top=14.55,screw_tip=12.1),rows=rows,limitations=['Carrier cap must retain nut against upward screw load; an open-top pocket alone is insufficient','Side loading slot and keeper, lid relief and carrier/root connection not modeled','Envelope includes screw shaft but not carrier root or lid support','Straight side roof approximation only','Print and supplier tolerances, strength and costs unqualified'])
(p/'captive-nut-envelope-screen.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(rows,indent=2))
