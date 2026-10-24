"""Generate enclosure envelope + interior from Rev C PCB placement, not a separate fictitious PCB."""
import json
from pathlib import Path
P=Path(__file__).resolve().parent;R=P.parents[1]
d=json.loads((R/'hardware/rev-c/placement-report.json').read_text());parts=json.loads((R/'hardware/rev-c/design.json').read_text())['parts'];W,H,_=d['board_mm'];EW,EH,T=W+2.8,H+3,14.0
bodies=[]
def add(n,x,y,z,w,h,t,color,group):bodies.append(dict(name=n,x=x,y=y,z=z,w=w,d=h,h=t,color=color,group=group))
add('DTP401525_max_pack',0,0,1.2,15.5,27,4.2,'#d5af58',1)
add('PCB_Rev_C',0,0,6.9,W,H,.8,'#176b57',2)
for p in parts:
 r=p['ref'];v=d['placements'][r];x,y=v['x']-W/2,v['y']-H/2
 if r.startswith('TP') or r=='J3':continue
 w,h=v['bbox'][2:];w=max(.4,w-.4);h=max(.4,h-.4);t=.5;color='#baad94'
 if r.startswith('U'):t=1;color='#333c49'
 if r=='U1':w,h,t=7,7,.6;color='#303843'
 if r=='U11':w,h,t=8,6.2,1;color='#30343d'
 if r=='U8':w,h,t=3.5,2.65,.98;color='#b8c1c9'
 if r=='J1':w,h,t=9,7.5,3.2;color='#b9c4d3'
 if r=='J2':w,h,t=8,9.5,5;color='#eee9dc'
 if r=='SW1':w,h,t=2.5,3,1.6;color='#66717a'
 if r.startswith('D') and r!='D2':color='#a0dc8a';t=.5
 if r.startswith('Q'):t=1.1
 if r=='U2':t=.6
 if r=='U3':t=.7
 if r=='U10':t=.6
 if r=='Y1':t=.9
 z=7.7 if v['side']=='F' else 6.9-t
 add(r+'_'+p['value'].split(' ')[0],x,y,z,w,h,t,color,2)
# This is a clearance reservation, not a claim that unmeasured factory leads have fitted.
add('Factory_wire_reservation',-9.2,0,1.2,1.5,27,4.2,'#e58b50',1)
# Mating plug is a provisional clearance block, not a supplier-verified model.
add('PH_mated_plug_reservation',5.6,2.0,9.0,8,5,3,'#d1a374',2)
(P/'structure.json').write_text(json.dumps(bodies,indent=2))
for mode in ['assembled','exploded','interior']:
 c=[]
 def command(n,**p):c.append({'command':n,'params':p})
 def rect(name,x,y,z,w,h,t,color,op='new',target=None,r=.25):
  command('sketch.create',plane='XY',offset=z,name=name+'_profile')
  command('sketch.rectangle.rounded',p0=[x-w/2,y-h/2],p1=[x+w/2,y+h/2],radius=min(r,w/5,h/5))
  command('sketch.finish')
  kw=dict(distance=t,operation=op,body_name=name)
  if target:kw['targets']=[target]
  command('solid.extrude',**kw)
  if op=='new':command('appearance.assign',bodies=[name],color=color)
 def circlecut(name,x,y,z,r,t,target):
  command('sketch.create',plane='XY',offset=z,name=name)
  command('sketch.circle.center',center=[x,y],radius=r);command('sketch.finish');command('solid.extrude',distance=t,operation='cut',targets=[target])
 if mode!='interior':
  rect('Case_lower',0,0,0,EW,EH,13.0,'#3d4550',r=2)
  rect('Cavity',0,0,1.0,EW-2.4,EH-2.4,12.2,'#000000',op='cut',target='Case_lower',r=.3)
  # Direct USB-C opening, with no protruding case ridge over the plug tongue.
  command('sketch.create',plane={'origin':[0,EH/2+.1,0],'x_dir':[1,0,0],'y_dir':[0,0,1]},name='USB_opening')
  command('sketch.rectangle.rounded',p0=[-9.6,7.35],p1=[.2,11.3],radius=.5);command('sketch.finish');command('solid.extrude',distance=2,operation='cut',targets=['Case_lower'])
  # Board seats avoid antenna end and leave the battery expansion space open.
  for x in [-10.4,10.4]:rect('PCB_seat_'+str(x),x,3,6.2,.6,22,.7,'#3d4550',op='join',target='Case_lower')
  lz=13.0+(27 if mode=='exploded' else 0)
  rect('Case_lid',0,0,lz,EW,EH,1.0,'#77848f',r=2)
  # Two indicator apertures and direct button access. Fastening remains a release blocker.
  for ref in ['D1','D6']:
   v=d['placements'][ref];circlecut(ref+'_window',v['x']-W/2,v['y']-H/2,lz-.1,.65,1.5,'Case_lid')
  v=d['placements']['SW1'];circlecut('Button_access',v['x']-W/2,v['y']-H/2,lz-.1,1.2,1.5,'Case_lid')
 for i,p in enumerate(bodies):
  z=p['z']+({1:7,2:16}.get(p['group'],0) if mode=='exploded' else 0)
  rect(str(i)+'_'+p['name'],p['x'],p['y'],z,p['w'],p['d'],p['h'],p['color'])
 (P/(mode+'.json')).write_text(json.dumps({'commands':c},ensure_ascii=False))
(P/'dimensions.json').write_text(json.dumps({'enclosure_mm':[EW,EH,T],'pcb_mm':[W,H,.8],'battery_max_mm':[15.5,27,4.2],'status':'ENGINEERING FIT STUDY; NOT PRINT/FABRICATION RELEASE','unresolved':['lid fastening and seal','microphone bottom-port side duct','mated battery plug and uncut leads measured fit','NTC thermal pad contact','all component height/manufacturer tolerances','PCB routing and power validation','PH mated plug clearance and uncut wire folding','13.8mm target not achieved; 14mm draft']},indent=2))
print('Generated',EW,EH,T,'mm')
