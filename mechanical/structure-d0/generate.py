"""SolidCraft geometry from the D0 actual-footprint placement feasibility study."""
import json
from pathlib import Path
P=Path(__file__).resolve().parent;ROOT=P.parents[1]
d=json.loads((ROOT/'hardware/omi-fit-d0/placement.json').read_text());parts=json.loads((ROOT/'hardware/omi-fit-d0/parts.json').read_text())
bodies=[]
for p in parts:
 r=p['ref'];v=d['placements'][r];w,h=v['bbox'][2:];w=max(.4,w-.4);h=max(.4,h-.4);t=.5;color='#c5bba3'
 if r in ['J3'] or r.startswith('TP'):t=.04;color='#dbb263'
 if r.startswith('U'):t=1.2;color='#293846'
 if r in ['U4','U6']:t=1.5
 if r=='U1':t=.6
 if r=='U11':t=1
 if r=='U8':t=1;color='#b5c3ce'
 if r=='J1':w,h,t=9,7.5,3.2;color='#b8c7d0'
 if r=='J2':t=2.95;color='#eadfc9' # Conservative envelope includes mating/wire reservation.
 if r=='SW1':t=1.6;color='#657a8a'
 if r.startswith('Q'):t=1.1
 if r in ['D1','D6']:color='#7acdb0'
 z=9.9 if v['side']=='F' else 9.1-t
 bodies.append(dict(name=r,x=v['x'],y=v['y'],z=z,w=w,d=h,h=t,color=color,side=v['side']))
(P/'bodies.json').write_text(json.dumps(bodies,indent=2))
for mode in ['assembled','exploded','interior']:
 c=[]
 def cmd(n,**p):c.append(dict(command=n,params=p))
 def rect(name,x,y,z,w,h,t,color,r=.15,op='new',target=None):
  cmd('sketch.create',plane='XY',offset=z,name=name+'_profile');cmd('sketch.rectangle.rounded',p0=[x-w/2,y-h/2],p1=[x+w/2,y+h/2],radius=min(r,w/4,h/4));cmd('sketch.finish')
  p=dict(distance=t,operation=op,body_name=name)
  if target:p['targets']=[target]
  cmd('solid.extrude',**p)
  if op=='new':cmd('appearance.assign',bodies=[name],color=color)
 def disk(name,x,y,z,r,h,color,op='new',target=None):
  cmd('sketch.create',plane='XY',offset=z,name=name+'_profile');cmd('sketch.circle.center',center=[x,y],radius=r);cmd('sketch.finish')
  p=dict(distance=h,operation=op,body_name=name)
  if target:p['targets']=[target]
  cmd('solid.extrude',**p)
  if op=='new':cmd('appearance.assign',bodies=[name],color=color)
 bo=7 if mode=='exploded' else 0;po=17 if mode=='exploded' else 0;lo=30 if mode=='exploded' else 0
 if mode!='interior':
  rect('Case_lower',0,0,0,25.5,25.5,13.5,'#394b58',r=3.5)
  rect('Cavity',0,0,1,23.5,23.5,12.7,'#000000',r=2.5,op='cut',target='Case_lower')
  # Open slot accommodates USB plug recess; dimensions remain provisional.
  rect('USB_opening',0,11.5,9.6,10.8,4.0,3.9,'#000000',r=.35,op='cut',target='Case_lower')
  rect('Case_lid',0,0,13.5+lo,25.5,25.5,1,'#8496a3',r=3.5)
  for r in ['D1','D6','SW1']:
   v=d['placements'][r];disk(r+'_access',v['x'],v['y'],13.4+lo,.55 if r!='SW1' else 1.1,1.3,'#000000',op='cut',target='Case_lid')
 # This entire orange envelope is an UNSOURCED completed-pack target, not a manufacturer STEP.
 disk('Pack_TARGET_D17_H6p1',0,0,1.2+bo,8.5,6.1,'#d4ad61')
 rect('PCM_side_reservation',10,0,1.5+bo,2.8,7,1.2,'#d88258')
 rect('Wire_riser_reservation',10.2,-7,2+bo,1.0,2.5,7,'#d88258')
 rect('PCB_23mm',0,0,9.1+po,23,23,.8,'#237967',r=2)
 for b in bodies:rect(b['name'],b['x'],b['y'],b['z']+po,b['w'],b['d'],b['h'],b['color'])
 # Board-mounted NTC couples to the pack through an insulating thermal pad; response unverified.
 v=d['placements']['TH1'];rect('NTC_thermal_pad_target',v['x'],v['y'],7.3+bo,2,2,1.3,'#8ad6d4')
 (P/(mode+'.json')).write_text(json.dumps(dict(commands=c),ensure_ascii=False))
(P/'dimensions.json').write_text(json.dumps(dict(status='MECHANICAL_ENVELOPE_STUDY_NOT_MANUFACTURING_RELEASE',case_mm=[25.5,25.5,14.5],case_corner_radius_mm=3.5,pcb_mm=[23,23,.8],pack_target_diameter_mm=17,pack_target_height_mm=6.1,pack_target_is_unsourced=True,battery_to_bottom_component_nominal_gap_mm=.3,usb_to_lid_nominal_gap_mm=.4,unresolved=['Final protected pack outline and harness','All body heights are simplified envelopes; supplier STEP/tolerances pending','Lid fastening, strap and microphone duct not designed','Complete solder fillet and wire bending validation','NTC thermal response','PCB routing, power integrity, firmware and measured runtime']),indent=2))
print('Generated 25.5 x 25.5 x 14.5 mm study; 76 reference locations')
