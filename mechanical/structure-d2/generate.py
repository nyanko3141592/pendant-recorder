"""D2 pendant features using the D1 actual-footprint placement feasibility study."""
import json,math
from pathlib import Path
P=Path(__file__).resolve().parent;ROOT=P.parents[1]
d=json.loads((ROOT/'hardware/omi-fit-d1/placement.json').read_text());parts=json.loads((ROOT/'hardware/omi-fit-d1/parts.json').read_text())
bodies=[]
for p in parts:
 r=p['ref'];v=d['placements'][r];w,h=v['bbox'][2:];w=max(.4,w-.4);h=max(.4,h-.4);t=.5;color='#c5bba3'
 if r in ['J3'] or r.startswith('TP'):t=.04;color='#dbb263'
 if r.startswith('U'):t=1.2;color='#293846'
 if r in ['U4','U6']:t=1.5
 if r=='U1':t=.6
 if r=='U9':t=.55
 if r=='U11':t=1
 if r=='U8':t=1;color='#b5c3ce'
 if r=='J1':w,h,t=9,7.5,3.56;color='#b8c7d0'
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
  disk('Case_lower',0,0,0,12.75,13.5,'#394b58')
  disk('Cavity',0,0,1,11.75,12.7,'#000000',op='cut',target='Case_lower')
  # Open slot accommodates USB plug recess; dimensions remain provisional.
  rect('USB_opening',0,11.5,9.6,10.8,4.0,3.9,'#000000',r=.35,op='cut',target='Case_lower')
  disk('Case_lid',0,0,13.5+lo,12.75,1,'#8496a3')
  # GCT B4 3.31mm height +0.15 general tolerance +0.10 solder allowance.
  rect('USB_lid_relief',0,7.5,13.3+lo,9.8,7.8,.4,'#000000',r=.25,op='cut',target='Case_lid')
  for r in ['D1','D6','SW1']:
   v=d['placements'][r];disk(r+'_access',v['x'],v['y'],13.4+lo,.55 if r!='SW1' else 1.1,1.3,'#000000',op='cut',target='Case_lid')
 # This entire orange envelope is an UNSOURCED completed-pack target, not a manufacturer STEP.
 disk('Pack_TARGET_D17_H6p1',0,0,1.2+bo,8.5,6.1,'#d4ad61')
 rect('PCM_side_reservation',9.8,0,1.5+bo,2.2,5.5,1.2,'#d88258')
 rect('Wire_riser_reservation',9.4,4.0,2+bo,1.0,2.5,7,'#d88258')
 disk('PCB_D23',0,0,9.1+po,11.5,.8,'#237967')
 for b in bodies:
  rect(b['name'],b['x'],b['y'],b['z']+po,b['w'],b['d'],b['h'],b['color'])
  if b['name']=='J1':
   # Simplified socket mouth; CAD enclosure study, not manufacturer USB STEP.
   cmd('sketch.create',plane={'origin':[0,b['y']+b['d']/2+.05,0],'x_dir':[1,0,0],'y_dir':[0,0,1]},name='USB_socket_mouth')
   cmd('sketch.rectangle.rounded',p0=[-4.0,b['z']+po+.4],p1=[4.0,b['z']+po+2.8],radius=.7);cmd('sketch.finish');cmd('solid.extrude',distance=1.8,operation='cut',targets=['J1'])
 # Board-mounted NTC couples to the pack through an insulating thermal pad; response unverified.
 v=d['placements']['TH1'];rect('NTC_thermal_pad_target',v['x'],v['y'],7.3+bo,2,2,1.3,'#8ad6d4')
 # Pendant engineering features. Bayonet and acoustic geometry require fabrication tests.
 def sector(name,r0,r1,a0,a1,z,h,op,target=None):
  pts=[]
  steps=max(2,int(abs(a1-a0)/2))
  angles=[a0+(a1-a0)*i/steps for i in range(steps+1)]
  for rr,aa in [(r1,angles),(r0,list(reversed(angles)))]:
   pts.extend([[rr*math.cos(math.radians(a)),rr*math.sin(math.radians(a))] for a in aa])
  cmd('sketch.create',plane='XY',offset=z,name=name+'_profile');cmd('sketch.line',points=pts,closed=True);cmd('sketch.finish')
  pp=dict(distance=h,operation=op,body_name=name)
  if target:pp['targets']=[target]
  cmd('solid.extrude',**pp)
 if mode!='interior':
  # Cord tunnel stays inside circular OD; reinforcement band is clipped to case outline.
  rect('Cord_bridge',0,-10.2,.9,25,2.6,4.6,'#394b58')
  disk('Bridge_clip',0,0,.9,12.75,4.6,'#394b58')
  cmd('solid.combine',target='Cord_bridge',tools=['Bridge_clip'],operation='intersect')
  cmd('solid.combine',target='Case_lower',tools=['Cord_bridge'],operation='join')
  cmd('sketch.create',plane={'origin':[-14,0,0],'x_dir':[0,1,0],'y_dir':[0,0,1]},name='Cord_tunnel')
  cmd('sketch.circle.center',center=[-10.2,3.3],radius=.8);cmd('sketch.finish');cmd('solid.extrude',distance=28,operation='cut',targets=['Case_lower'])
  # Three PCB supports avoid both-side component envelopes at final orientation.
  for a in [25,120,285]:
   sector('PCB_seat_'+str(a),10.65,11.85,a-4,a+4,8.5,.5,'join','Case_lower')
   sector('Seat_adhesive_'+str(a),10.7,11.4,a-3,a+3,9.0,.1,'new')
  # Acoustic duct starts at the actual U8 NPTH, not footprint-box center.
  rect('Acoustic_duct',3,-9.45,7.8,2.0,5.1,1.3,'#394b58',op='join',target='Case_lower')
  rect('Duct_channel',3,-10.2,8.1,.8,7,.7,'#000000',op='cut',target='Case_lower')
  disk('Mic_inlet',3,-7.39,8.3,.4,1.0,'#000000',op='cut',target='Case_lower')
  # Bayonet: enter -15deg, turn +15deg to end stops. No snap-beam flex assumed.
  sector('Lid_rim',11.0,11.6,140,400,11.8+lo,1.7,'new')
  cmd('solid.combine',target='Case_lid',tools=['Lid_rim'],operation='join')
  for a in [0,180]:
   sector('Bayonet_entry_'+str(a),11.65,12.1,a-20,a-10,11.9,1.7,'cut','Case_lower')
   sector('Bayonet_track_'+str(a),11.65,12.1,a-20,a+5,11.9,.75,'cut','Case_lower')
   sector('Bayonet_lug_'+str(a),11.4,12.0,a-4,a+4,12.05+lo,.45,'join','Case_lid')
 # Actual microphone acoustic via through the PCB model.
 disk('Mic_pcb_hole',3,-7.39,9.0+po,.3,1.0,'#000000',op='cut',target='PCB_D23')
 (P/(mode+'.json')).write_text(json.dumps(dict(commands=c),ensure_ascii=False))
(P/'dimensions.json').write_text(json.dumps(dict(status='MECHANICAL_ENVELOPE_STUDY_NOT_MANUFACTURING_RELEASE',case_mm=[25.5,25.5,14.5],case_shape='cylinder',strap_hole_diameter_mm=1.6,strap_attachment_within_case_envelope=True,cord_and_knot_included_in_dimensions=False,bayonet_lugs=2,bayonet_rotation_degrees=15,pcb_support_count=3,case_diameter_mm=25.5,pcb_mm=[23,23,.8],pcb_shape='circle',pcb_diameter_mm=23,pack_target_diameter_mm=17,pack_target_height_mm=6.1,pack_target_is_unsourced=True,battery_to_bottom_component_nominal_gap_mm=.3,usb_to_lid_nominal_gap_mm=.24,usb_body_allowance_height_mm=3.56,usb_lid_relief_ceiling_mm=13.7,mic_pcb_hole_mm=.6,copper_layers=6,unresolved=['Final protected pack outline and harness','All body heights are simplified envelopes; supplier STEP/tolerances pending','Bayonet retention/cord load/duct acoustics untested; adhesive seat material not selected','Complete solder fillet and wire bending validation','NTC thermal response','Electrical layout quality, power integrity, firmware and measured runtime']),indent=2))
print('Generated D25.5 x 14.5 mm circular study; 76 reference locations')
