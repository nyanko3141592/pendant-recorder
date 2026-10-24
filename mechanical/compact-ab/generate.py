import json,math,csv
from pathlib import Path
R=Path(__file__).resolve().parents[2];P=Path(__file__).parent
allc=[];summary=[]
for v,W,H,T,px,pz,shift in [('a',38,39,8.9,19,2.9,0),('b',20,39,14.5,1,8.6,48)]:
 parts=json.loads((R/f'hardware/compact-{v}/placement.json').read_text())
 for exploded in [False,True]:
  c=[];bounds=[]
  def cmd(n,**p):c.append(dict(command=n,params=p))
  def box(n,x,y,z,w,d,h,color,op='new',target=None,r=.15):
   cmd('sketch.create',plane='XY',offset=z,name=n+'_profile');cmd('sketch.rectangle.rounded',p0=[x-w/2,y-d/2],p1=[x+w/2,y+d/2],radius=min(r,w/4,d/4));cmd('sketch.finish')
   p=dict(distance=h,operation=op,body_name=n)
   if target:p['targets']=[target]
   cmd('solid.extrude',**p)
   if op=='new':cmd('appearance.assign',bodies=[n],color=color)
  pre=v.upper()+'_';body=pre+'shell';lid=pre+'lid';po=16 if exploded else 0;lo=34 if exploded else 0;bo=5 if exploded else 0
  box(body,W/2,H/2,0,W,H,T-1,'#334652',r=2)
  box(pre+'cavity',W/2,20.75,1,W-2,34.5,T,'#000000','cut',body,r=.8)
  box(lid,W/2,H/2,T-1+lo,W,H,1,'#778e97',r=2)
  for target,z in [(body,0),(lid,T-1+lo)]:box(pre+'cord_slot_'+target,W/2,1.7,z,6,1.5,T,'#000000','cut',target,r=.6)
  box(pre+'USB_open',px+9,38,pz+.8,11.3,5,4,'#000000','cut',body)
  # Tongues in the wall region; 0.2mm socket allowance is a print assumption.
  for x in [.7,W-.7]:
   box(pre+'socket'+str(x),x,35,T-2,.8,3,1.1,'#000000','cut',body)
   box(pre+'lid_tab'+str(x),x,35,T-1.8+lo,.4,2.6,.8,'#778e97')
  bx=9.75 if v=='a' else 10
  box(pre+'battery_XE',bx,17.5,1.3+bo,15.5,27,4.2,'#cca65c')
  box(pre+'insulation',bx,17.5,5.55+bo,16,27.5,.15,'#d4d7cf')
  # Reservation, not a validated cable shape or manufacturer lead length.
  box(pre+'harness_reservation',18.25 if v=='a' else 10,19 if v=='a' else 33,1.3+bo,1.2 if v=='a' else 15,28 if v=='a' else 2,3.8,'#c8754d')
  box(pre+'PCB',px+9,20.5,pz+po,18,33,.8,'#237963')
  for p in parts:
   ref=p['ref'];h=.6
   if ref.startswith('U'):h=1.2
   if ref in ['U4','U6']:h=1.5
   if ref=='J1':h=3.56
   if ref=='J2':h=1.4
   if ref=='SW1':h=1.6
   if ref=='J3' or ref.startswith('TP'):h=.05
   x=px+p['x'];y=4+p['y'];z=pz+.8 if p['side']=='F' else pz-h
   # Full footprint envelope, including lands/courtyard; conservative XY, assumed height.
   box(pre+ref,x,y,z+po,p['w'],p['h'],h,'#bec7cb' if ref.startswith('J') else '#26323d')
   bounds.append(dict(ref=ref,x=x,y=y,z=z,w=p['w'],d=p['h'],h=h,side=p['side'],height_status='assumed'))
   if ref in ['SW1','D1','D6']:
    hole=2 if ref=='SW1' else 1.1
    box(pre+'access_'+ref,x,y,T-1+lo,hole,hole,1.2,'#000000','cut',lid,r=.3)
    base=z+h
    box(pre+'plunger_'+ref,x,y,base+lo,hole-.3,hole-.3,T-.15-base,'#b6cdd2',r=.2)
   if ref=='U8':
    port=json.loads((R/f'hardware/compact-{v}/mic-port.json').read_text())[0];mx=px+port['x'];my=4+port['y']
    box(pre+'mic_PCB_hole',mx,my,pz+po,.6,.6,.8,'#000000','cut',pre+'PCB',r=.25)
    if v=='a':
     box(pre+'acoustic_gasket',mx,my,1+po,1.6,1.6,pz-1,'#647f88')
     box(pre+'gasket_bore',mx,my,1+po,.7,.7,pz-1,'#000000','cut',pre+'acoustic_gasket',r=.25)
     box(pre+'mic_back_port',mx,my,0,.7,.7,1.1,'#000000','cut',body,r=.25)
    else:
     # Shared void between battery and rear components. Routed duct is a reservation for a molded/printed part.
     box(pre+'acoustic_duct',(mx+W)/2,my,5.8+po,W-mx,1.6,1.1,'#647f88')
     box(pre+'duct_channel',(mx+W)/2,my,6.1+po,W-mx+.1,.7,.5,'#000000','cut',pre+'acoustic_duct')
     box(pre+'acoustic_riser',mx,my,6.1+po,1.6,1.6,pz-6.1,'#647f88')
     box(pre+'riser_bore',mx,my,6.1+po,.7,.7,pz-6.1,'#000000','cut',pre+'acoustic_riser',r=.25)
     box(pre+'duct_inlet',mx+.2,my,6.1+po,.9,.7,.9,'#000000','cut',pre+'acoustic_duct',r=.25)
     box(pre+'mic_side_port',W-.5,my,6.1,2,.7,.5,'#000000','cut',body)
  # PCB supports in free bottom corners, to be checked against pad envelopes.
  for x in [px+.4,px+17.6]:box(pre+'support'+str(x),x,36.5,1,.6,1,pz-1,'#607783')
  (P/f'{v}-{"exploded" if exploded else "assembled"}.json').write_text(json.dumps({'commands':c}))
  if not exploded:
   # Translation is applied to profile coordinates to build a true shared-scale CAD scene.
   shifted=json.loads(json.dumps(c))
   for a in shifted:
    if a['command']=='sketch.rectangle.rounded':
     a['params']['p0'][0]+=shift;a['params']['p1'][0]+=shift
   allc+=shifted
   (P/f'{v}-envelopes.json').write_text(json.dumps(bounds,indent=2))
 summary.append(dict(variant=v,case_mm=[W,H,T],front_bbox_mm2=W*H,envelope_mm3=W*H*T,pcb_mm=[18,33,.8],parts=len(parts)))
# Official published 2.5cm x1.5cm interpreted as cylinder; chain/case excluded.
allc += [dict(command='sketch.create',params=dict(plane='XY',offset=0,name='omi_profile')),dict(command='sketch.circle.center',params=dict(center=[90,19.5],radius=12.5)),dict(command='sketch.finish',params={}),dict(command='solid.extrude',params=dict(distance=15,operation='new',body_name='Omi_25x15_approximation')),dict(command='appearance.assign',params=dict(bodies=['Omi_25x15_approximation'],color='#dfd7c5'))]
(P/'comparison.json').write_text(json.dumps(dict(commands=allc)))
(P/'dimensions.json').write_text(json.dumps(dict(variants=summary,omi=dict(diameter_mm=25,thickness_mm=15,front_mm2=math.pi*12.5**2,cylinder_mm3=math.pi*12.5**2*15,source='https://get.omi.me/omi-quantity',approximation=True)),indent=2))
rows=[]
for use in [.6,.7,.8,.9]:
 for current in [3,3.5,4,4.5,4.8125,5,6,8]:rows.append(dict(usable_fraction=use,current_ma=current,runtime_h=110*use/current,passes_16h=110*use/current>=16))
with (P/'runtime.csv').open('w') as f:
 w=csv.DictWriter(f,fieldnames=rows[0]);w.writeheader();w.writerows(rows)
