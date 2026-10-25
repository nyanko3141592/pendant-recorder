from pathlib import Path
import json,subprocess,copy
R=Path(__file__).resolve().parents[2];P=Path(__file__).parent;H=R/'hardware/compact-100-v5';cli=str(Path.home()/'.local/bin/solidcraft-cli')
parts=json.loads((H/'placement.json').read_text());W,D,T=26,31,14;px,py,pz=1,3,8.2
P.joinpath('print').mkdir(exist_ok=True)
def box(c,n,x,y,z,w,d,h,color='#526a77',op='new',target=None,r=.1):
 c.extend([dict(command='sketch.create',params=dict(plane='XY',offset=z,name=n+'_sketch')),dict(command='sketch.rectangle.rounded',params=dict(p0=[x-w/2,y-d/2],p1=[x+w/2,y+d/2],radius=min(r,w/4,d/4))),dict(command='sketch.finish',params={})]);p=dict(distance=h,operation=op,body_name=n)
 if target:p['targets']=[target]
 c.append(dict(command='solid.extrude',params=p))
 if op=='new':c.append(dict(command='appearance.assign',params=dict(bodies=[n],color=color)))
def run(name,c,printable=False):
 dest=P/'print' if printable else P;f=dest/(name+'.json');payload=json.dumps({'commands':c})
 if f.exists() and f.read_text()==payload and (dest/(name+'.step')).exists() and (not printable or (dest/(name+'.stl')).exists()):return
 f.write_text(payload);args=[cli,'run',str(f),'--out',str(dest/(name+'.step')),'--save',str(dest/(name+'.solidcraft')),'--quiet']
 if printable:args+=['--out',str(dest/(name+'.stl')),'--out',str(dest/(name+'.3mf'))]
 subprocess.run(args,check=True,stdout=subprocess.DEVNULL)
def height(p):
 r=p['ref'];return 3.56 if r=='J1' else 1.4 if r=='J2' else 1.6 if r=='SW1' else .05 if r=='J3' or r.startswith('TP') else 1.5 if r in ['U4','U6'] else 1.2 if r.startswith('U') else .6
body=[];box(body,'case',W/2,D/2,0,W,D,13,'#455d6a',r=2)
box(body,'cavity',W/2,16.5,1.2,W-1.6,27.6,13,op='cut',target='case',r=.5)
# Strap slot is separated from cavity by >=1.1mm of material.
box(body,'strap',W/2,1.1,0,6,1,13.2,op='cut',target='case',r=.4)
# USB clearance registered to actual connector envelope at board top edge.
j=next(p for p in parts if p['ref']=='J1');box(body,'usb',px+j['x'],D-.5,pz+.8-.2,11.3,4,4.1,op='cut',target='case',r=.4)
# End wall carries microphone inlet; acoustic sealing not yet qualified.
m=json.loads((H/'mic-port.json').read_text())[0];box(body,'mic_access',px+m['x'],py+m['y'],0,1,1,1.3,op='cut',target='case',r=.35)
for x in [.95,W-.95]:box(body,'pcb_rail_'+str(x),x,16.5,1.1,.3,26.2,7.1,op='join',target='case',r=.05)
lid=[];box(lid,'lid',W/2,D/2,0,W,D,1,'#617d8a',r=2)
box(lid,'strap_lid',W/2,1.1,0,6,1,1.2,op='cut',target='lid',r=.4)
# Lid is deliberately a removable visual/fit-check plate; no unqualified snap latch.
for p in parts:
 if p['ref'] in ['SW1','D1','D6']:
  w=2.3 if p['ref']=='SW1' else 1.2;box(lid,'access_'+p['ref'],px+p['x'],py+p['y'],0,w,w,1.2,op='cut',target='lid',r=.35)
run('case_body',body,True);run('case_lid',lid,True)
size=[];box(size,'size_mockup',W/2,D/2,0,W,D,T,'#455d6a',r=2);box(size,'strap',W/2,1.1,0,6,1,T+.2,op='cut',target='size_mockup',r=.4);run('whole_size_26x31x14',size,True)
bat=[];box(bat,'battery_dummy',7.5,8.5,0,15,17,6,'#d6ad55',r=.6);run('battery_100mAh_15x17x6',bat,True)
board=[];box(board,'pcb_dummy',12,13.5,1.6,24,27,.8,'#347b68',r=.2)
for p in parts:
 ht=height(p);z=2.4-.02 if p['side']=='F' else 1.6-ht
 box(board,p['ref'],p['x'],p['y'],z,p['w'],p['h'],ht+.02,op='join',target='pcb_dummy',r=.08)
# Dummy is one connected solid, bottom Z may be >0; rebase below when exporting.
minz=min([1.6]+[1.6-height(p) for p in parts if p['side']=='B'])
for cmd in board:
 if cmd['command']=='sketch.create':cmd['params']['offset']-=minz
run('pcb_with_component_envelopes',board,True)
flat=[];box(flat,'bare_pcb',12,13.5,0,24,27,.8,'#347b68',r=.2);run('pcb_bare_24x27x0.8',flat,True)
for exploded in [False,True]:
 c=copy.deepcopy(body);lo=30 if exploded else 13
 for cmd in copy.deepcopy(lid):
  if cmd['command']=='sketch.create':cmd['params']['offset']+=lo
  c.append(cmd)
 bo=4 if exploded else 0;po=15 if exploded else 0
 box(c,'battery',13,14.5,1.4+bo,15,17,6,'#d6ad55',r=.6)
 box(c,'insulation',13,14.5,7.45+bo,16,18,.15,'#dad8ca')
 box(c,'pcb',13,16.5,pz+po,24,27,.8,'#347b68',r=.2)
 box(c,'mic_duct_reservation',px+m['x'],py+m['y'],1.2,1.6,1.6,pz-1.2,'#798c95',r=.4)
 box(c,'mic_duct_bore',px+m['x'],py+m['y'],1.2,.8,.8,pz-1.2,op='cut',target='mic_duct_reservation',r=.3)
 box(c,'pcb_mic_hole',px+m['x'],py+m['y'],pz+po,.6,.6,.8,op='cut',target='pcb',r=.25)
 for p in parts:
  ht=height(p);z=pz+.8 if p['side']=='F' else pz-ht
  box(c,p['ref'],px+p['x'],py+p['y'],z+po,p['w'],p['h'],ht,'#b4bdc2' if p['ref'].startswith('J') else '#303943')
 # Cable envelope in peripheral space, not a validated bend radius.
 box(c,'harness_reservation',2.2,14,1.5+bo,1.8,16,3,'#bc7951')
 run('exploded' if exploded else 'assembled',c)
 subprocess.run([cli,'snapshot',str(P/('exploded.json' if exploded else 'assembled.json')),'--out',str(P/('exploded.png' if exploded else 'assembled.png')),'--width','1100','--height','850','--view','iso','--no-grid','--no-axes'],check=True,stdout=subprocess.DEVNULL)
(P/'dimensions.json').write_text(json.dumps({'case_mm':[W,D,T],'pcb_mm':[24,27,.8],'battery_mm':[15,17,6],'footprints':len(parts),'pcb_bottom_z_mm':pz,'lid_bottom_z_mm':13,'usb_top_z_mm':pz+.8+3.56,'usb_nominal_clearance_mm':13-(pz+.8+3.56),'status':'DESIGN_AND_SIZE_PROTOTYPE_NOT_MANUFACTURING_RELEASE','assumptions':['Battery PCM envelope is supplier listing, custom NTC/harness envelope unconfirmed','Component heights are conservative type assumptions, not supplier STEP maxima','Lid is loose fit-check plate; use temporary tape, latch/retention unqualified','PCB edge rails support z=8.2; acoustic sealing and assembly retention remain unqualified','Print at 100%, mm; battery/PCB pieces are inert dummies']},indent=2)+'\n')
