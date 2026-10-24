import json
from pathlib import Path
P=Path(__file__).parent;R=P.parents[1]
placements=json.loads((R/'hardware/rev-e/placement.json').read_text())
for exploded in [False,True]:
 c=[]
 def cmd(n,**p):c.append(dict(command=n,params=p))
 def box(n,x,y,z,w,d,h,color,op='new',target=None,r=.2):
  cmd('sketch.create',plane='XY',offset=z,name=n+'_profile');cmd('sketch.rectangle.rounded',p0=[x-w/2,y-d/2],p1=[x+w/2,y+d/2],radius=min(r,w/4,d/4));cmd('sketch.finish')
  p=dict(distance=h,operation=op,body_name=n)
  if target:p['targets']=[target]
  cmd('solid.extrude',**p)
  if op=='new':cmd('appearance.assign',bodies=[n],color=color)
 po=14 if exploded else 0;lo=28 if exploded else 0;bo=5 if exploded else 0
 box('Case_lower',0,-1.5,0,28,34,12.8,'#384858',r=1.5)
 box('Cavity',0,-1.5,1,26,32,12,'#000000','cut','Case_lower',r=.5)
 box('Case_lid',0,-1.5,12.8+lo,28,34,1,'#8197a3',r=1.5)
 box('USB_opening',0,14,8.1,10.8,6,4.3,'#000000','cut','Case_lower')
 box('Battery_XE_envelope',0,-1.5,1.3+bo,15.5,27,4.2,'#d6af64')
 box('Wire_space_UNQUALIFIED',10,-4,1.3+bo,3,22,4.2,'#da8053')
 box('PCB',0,-1.5,7.8+po,25,31,.8,'#287b69')
 for p in placements:
  ref=p['ref'];h=.5
  if ref.startswith('U'):h=1.2
  if ref in ['U4','U6']:h=1.5
  if ref=='J1':h=3.56
  if ref=='J2':h=1.4
  if ref=='SW1':h=1.6
  if ref=='J3' or ref.startswith('TP'):h=.05
  z=8.6+po if p['side']=='F' else 7.8+po-h
  box(ref,p['x'],p['y'],z,max(.4,p['w']-.4),max(.4,p['h']-.4),h,'#b6c2cb' if ref.startswith('J') else '#303b48')
 # Thin side reservation deliberately not claimed as validated strap attachment.
 for x in [-11.5,11.5]:box('Support_'+str(x),x,10,5.7,1.3,2,2,'#728492')
 (P/('exploded.json' if exploded else 'assembled.json')).write_text(json.dumps({'commands':c}))
(P/'dimensions.json').write_text(json.dumps({'status':'ENVELOPE_DRAFT_NOT_RELEASED','case_mm':[28,34,13.8],'pcb_mm':[25,31,.8],'battery_envelope_mm':[15.5,27,4.2],'unresolved':['lead length and bend radius','lid fastening and cord attachment','acoustic duct and controls','actual component STEP and solder heights','support interference and print tolerance']},indent=2))
