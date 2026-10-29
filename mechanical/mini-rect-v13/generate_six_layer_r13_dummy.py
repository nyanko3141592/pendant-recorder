from pathlib import Path
import json,subprocess,copy,hashlib,math
R=Path(__file__).resolve().parents[2];H=R/'hardware/mini-rect-v13';P=Path('/Users/takahashinaoki/Downloads/Pendant-v13-six-layer-r13-fit-r7');P.mkdir(exist_ok=True);(P/'print').mkdir(exist_ok=True)
CLI=str(Path.home()/'.local/bin/solidcraft-cli');handoff=json.loads((H/'acoustic-r13-placement-candidate.mechanical-handoff.json').read_text());parts=[dict(ref=p['ref'],x=p['x_mm'],y=p['y_mm'],w=p['w_mm'],h=p['d_mm'],height=p['height_mm'],side=p['side']) for p in handoff['parts']];by={p['ref']:p for p in parts}
def box(c,n,x,y,z,w,d,h,r=.1,op='new',target=None):
 c.extend([dict(command='sketch.create',params=dict(plane='XY',offset=z,name=n+'_sketch')),dict(command='sketch.rectangle.rounded',params=dict(p0=[x-w/2,y-d/2],p1=[x+w/2,y+d/2],radius=r)),dict(command='sketch.finish',params={})]);p=dict(distance=h,operation=op,body_name=n)
 if target:p['targets']=[target]
 c.append(dict(command='solid.extrude',params=p))
def move(c,name,t,angle=0):
 p=dict(bodies=[name],translate=t)
 if angle:p.update(axis=[1,0,0],angle=angle)
 c.append(dict(command='solid.move',params=p))
def color(c,n,s):c.append(dict(command='appearance.assign',params=dict(bodies=[n],color=s)))
def shell(name):
 c=[];box(c,name,11.5,12.5,0,23,25,14.81,3.5)
 c.append(dict(command='solid.fillet',params=dict(body=name,edges=[[11.5,0,0],[11.5,0,14.81]],radius=2)))
 box(c,'inner',11.5,12.5,1.2,21.4,23.4,12.81,2.7)
 c.append(dict(command='solid.fillet',params=dict(body='inner',edges=[[11.5,.8,1.2]],radius=1.2)))
 c.append(dict(command='solid.fillet',params=dict(body='inner',edges=[[11.5,.8,14.01]],radius=1)))
 c.append(dict(command='solid.combine',params=dict(target=name,tools=['inner'],operation='cut')))
 j=by['J1'];box(c,'usb_cut',1+j['x'],24,10.0,11.3,6,4.5,.4,'cut',name)
 for ref in ['SW1','D6']:
  p=by[ref];w=2.5 if ref=='SW1' else 1.4;box(c,'access_'+ref,1+p['x'],1+p['y'],(0 if p['side']=='B' else 10.95),w,w,(2 if p['side']=='B' else 5),.35,'cut',name)
 # Acoustic bore is cut once through the joined floor and riser below.
 color(c,name,'#303b40');return c
body=shell('case_body');box(body,'remove_top',13,14,11.81,40,45,5,.1,'cut','case_body')
for x in [4.9,18.1]:box(body,'battery_pad_'+str(x),x,11.5,1.1,1.2,11,.3,.1,'join','case_body')
# Supports at clear board ends; temporary tape closure, not a production latch.
for x,y,w,d in [(1.5,20,1,2),(11.5,23.5,2,1)]:box(body,'pcb_support_'+str(y),x,y,1.1,w,d,8.35,.1,'join','case_body')
# Narrow sealed acoustic riser outside battery envelope. Final0.3mm gap
# reserves compressible acoustic gasket, not a claimed qualified seal.
m=dict(x=handoff['acoustic_ports'][0]['x_mm'],y=handoff['acoustic_ports'][0]['y_mm']);mx,my=1+m['x'],1+m['y']
box(body,'acoustic_riser',mx,my-.1,1.1,1.4,1.4,8.05,.35,'join','case_body')
body.extend([dict(command='sketch.create',params=dict(plane='XY',offset=-.1,name='bore_profile')),dict(command='sketch.circle.center',params=dict(center=[mx,my],radius=.3)),dict(command='sketch.finish',params={}),dict(command='solid.extrude',params=dict(distance=9.35,operation='cut',targets=['case_body'],body_name='acoustic_bore'))])
lid=shell('case_lid');box(lid,'remove_bottom',13,14,-1,40,45,12.81,.1,'cut','case_lid')
# Four lid alignment tongues;0.2mm wall clearance. No snap retention claim.
for side,x,bridge in [('left',1.4,1.1),('right',21.6,21.9)]:
 for y in [9,13]:
  box(lid,'bridge_'+side+str(y),bridge,y,11.9,1.6,3.4,0.5,.1,'join','case_lid')
  box(lid,'tongue_'+side+str(y),x,y,11.1,.8,2.8,1.1,.1,'join','case_lid')
board=[];box(board,'pcb_dummy',11.5,12.5,9.45,21,23,.93,2.5)

for p in parts:
 h=p['height'];z=10.36 if p['side']=='F' else 9.45-h
 box(board,p['ref'],1+p['x'],1+p['y'],z,p['w'],p['h'],h+.02,.08 if h>.05 else .02,'join','pcb_dummy')
box(board,'pcb_acoustic_port',mx,my,9.44,.8,.8,.95,.30,'cut','pcb_dummy')
# Four conservative stake envelopes from the actual J1 footprint origin
# (10.5,18.99), not the placement bounding-box centre. Solder fillets excluded.
for sx in [-4.32,4.32]:
 for sy,depth in [(-3.105,1.75),(1.075,1.45)]:
  box(board,'usb_stake_'+str(sx)+'_'+str(sy),11.5+sx,19.99+sy,9.15,.6,depth,.32,.08,'join','pcb_dummy')
color(board,'pcb_dummy','#337353')
battery=[];box(battery,'battery_dummy',11.5,11.5,1.4,15,17,6,.6);color(battery,'battery_dummy','#d8b255')
def run(name,c,printable=True):
 dest=P/'print' if printable else P;f=dest/(name+'.json');payload=json.dumps(dict(commands=c))
 if f.exists() and f.read_text()==payload and f.with_suffix('.step').exists() and (not printable or f.with_suffix('.3mf').exists()):return
 f.write_text(payload);args=[CLI,'run',str(f),'--out',str(f.with_suffix('.step')),'--save',str(f.with_suffix('.solidcraft')),'--quiet']
 if printable:args+=['--out',str(f.with_suffix('.stl')),'--out',str(f.with_suffix('.3mf'))]
 subprocess.run(args,check=True,stdout=subprocess.DEVNULL)

bp=copy.deepcopy(board);move(bp,'pcb_dummy',[-1,-1,-min(9.45-p['height'] for p in parts if p['side']=='B')]);run('PCB_0_93mm_COMPONENTS_FIT_ONLY',bp)
(P/'README.txt').write_text('6-layer candidate maximum PCB thickness 0.93 mm fit dummy. Uses existing component envelopes. Not a manufacturing model, not sliced G-code. Existing r4 case is unchanged. Nominal inner roof 14.01 mm; USB envelope top 13.94 mm gives only 0.07 mm flat-roof margin, before fillets, tolerances, solder and print error. No fit guarantee.\n')
