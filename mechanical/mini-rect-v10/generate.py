from pathlib import Path
import json,subprocess,copy,hashlib,math
R=Path(__file__).resolve().parents[2];H=R/'hardware/mini-rect-v10';P=Path('/Users/takahashinaoki/Downloads/Pendant-mini-rect-v10');P.mkdir(exist_ok=True);(P/'print').mkdir(exist_ok=True)
CLI=str(Path.home()/'.local/bin/solidcraft-cli');parts=json.loads((H/'placement.json').read_text());by={p['ref']:p for p in parts}
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
 c=[];box(c,name,11.5,12.5,0,23,25,14,3.5)
 c.append(dict(command='solid.fillet',params=dict(body=name,edges=[[11.5,0,0],[11.5,0,14]],radius=2)))
 box(c,'inner',11.5,12.5,1.2,21.4,23.4,12,2.7)
 c.append(dict(command='solid.fillet',params=dict(body='inner',edges=[[11.5,.8,1.2]],radius=1.2)))
 c.append(dict(command='solid.fillet',params=dict(body='inner',edges=[[11.5,.8,13.2]],radius=1)))
 c.append(dict(command='solid.combine',params=dict(target=name,tools=['inner'],operation='cut')))
 j=by['J1'];box(c,'usb_cut',1+j['x'],24,9.05,11.3,6,4.5,.4,'cut',name)
 for ref in ['SW1','D6']:
  p=by[ref];w=2.5 if ref=='SW1' else 1.4;box(c,'access_'+ref,1+p['x'],1+p['y'],10,w,w,5,.35,'cut',name)
 m=json.loads((H/'mic-port.json').read_text())[0];box(c,'mic',1+m['x'],1+m['y'],-.1,1,1,2,.35,'cut',name)
 color(c,name,'#397e79');return c
body=shell('case_body');box(body,'remove_top',13,14,11,40,45,5,.1,'cut','case_body')
for x in [4.9,18.1]:box(body,'battery_pad_'+str(x),x,11.5,1.1,1.2,11,.3,.1,'join','case_body')
# Supports at clear board ends; temporary tape closure, not a production latch.
for x,y in [(11.5,1.5),(11.5,23.5)]:box(body,'pcb_support_'+str(y),x,y,1.1,2,1,7.4,.1,'join','case_body')
lid=shell('case_lid');box(lid,'remove_bottom',13,14,-1,40,45,12,.1,'cut','case_lid')
board=[];box(board,'pcb_dummy',11.5,12.5,8.5,21,23,.8,2.5)

for p in parts:
 h=p['height'];z=9.28 if p['side']=='F' else 8.5-h
 box(board,p['ref'],1+p['x'],1+p['y'],z,p['w'],p['h'],h+.02,.08 if h>.05 else .02,'join','pcb_dummy')
color(board,'pcb_dummy','#337353')
battery=[];box(battery,'battery_dummy',11.5,11.5,1.4,15,17,6,.6);color(battery,'battery_dummy','#d8b255')
def run(name,c,printable=True):
 dest=P/'print' if printable else P;f=dest/(name+'.json');payload=json.dumps(dict(commands=c))
 if f.exists() and f.read_text()==payload and f.with_suffix('.step').exists() and (not printable or f.with_suffix('.3mf').exists()):return
 f.write_text(payload);args=[CLI,'run',str(f),'--out',str(f.with_suffix('.step')),'--save',str(f.with_suffix('.solidcraft')),'--quiet']
 if printable:args+=['--out',str(f.with_suffix('.stl')),'--out',str(f.with_suffix('.3mf'))]
 subprocess.run(args,check=True,stdout=subprocess.DEVNULL)
run('01_hollow_case_body',body)
lp=copy.deepcopy(lid);move(lp,'case_lid',[0,25,14],180);run('02_case_lid_open_side_up',lp)
bp=copy.deepcopy(board);move(bp,'pcb_dummy',[-1,-1,-min(8.5-p['height'] for p in parts if p['side']=='B')]);run('03_pcb_components_UNROUTED',bp)
batp=copy.deepcopy(battery);move(batp,'battery_dummy',[-4,-3,-1.4]);run('04_battery_pack_15x17x6',batp)
ab=copy.deepcopy(board)
for cmd in ab:
 if cmd['command']=='solid.extrude' and cmd['params'].get('operation')=='join':cmd['params']['operation']='new';cmd['params'].pop('targets',None)
c=body+lid+ab+battery;run('assembled',c,False)
check=copy.deepcopy(c);check.append(dict(command='inspect.clearance',params=dict(bodies=['case_body','case_lid'],against=['pcb_dummy','battery_dummy']+[p['ref'] for p in parts],min_volume=.001,clearance=.1)))
check.append(dict(command='inspect.clearance',params=dict(bodies=['battery_dummy'],against=[p['ref'] for p in parts]+['pcb_dummy'],min_volume=.001,clearance=.1)))
f=P/'collision-check.json';f.write_text(json.dumps(dict(commands=check)));subprocess.run([CLI,'run',str(f),'--results','--json-out',str(P/'collision-results.json'),'--quiet'],check=True,stdout=subprocess.DEVNULL)
e=copy.deepcopy(body)+copy.deepcopy(battery);move(e,'battery_dummy',[0,0,5]);e+=copy.deepcopy(ab)
for name in ['pcb_dummy']+[p['ref'] for p in parts]:move(e,name,[0,0,15])
e+=copy.deepcopy(lid);move(e,'case_lid',[0,0,28]);run('exploded',e,False)
# Exact previous printed model's exterior, same scale. Omi is a dimensional envelope, not a replica.
comp=[]
box(comp,'baseline_printed_v7',13,15.5,0,26,31,14,5);comp.append(dict(command='solid.fillet',params=dict(body='baseline_printed_v7',edges=[[13,0,0],[13,0,14]],radius=3)));color(comp,'baseline_printed_v7','#547888')
box(comp,'round_v9',47,14,0,26,28,14,12.9);comp.append(dict(command='solid.fillet',params=dict(body='round_v9',edges=[[47,0,0],[47,0,14]],radius=2)));color(comp,'round_v9','#397e79')
box(comp,'rect_v10',80,12.5,0,23,25,14,3.5);comp.append(dict(command='solid.fillet',params=dict(body='rect_v10',edges=[[80,0,0],[80,0,14]],radius=2)));color(comp,'rect_v10','#b27e45')
box(comp,'Omi_reference_envelope',113,12.75,0,25.5,25.5,15,12.749);color(comp,'Omi_reference_envelope','#b7b8b6')
run('comparison_same_scale',comp,False)
# Separate printable Omi size gauge; no claim to be actual case CAD.
om=[];box(om,'Omi_size_gauge',12.75,12.75,0,25.5,25.5,15,12.749);run('05_Omi_D25_5x15_REFERENCE_ONLY',om)
for n in ['assembled','exploded','comparison_same_scale']:
 subprocess.run([CLI,'snapshot',str(P/(n+'.json')),'--out',str(P/(n+'.png')),'--width','1400','--height','900','--view','iso','--no-grid','--no-axes'],check=True,stdout=subprocess.DEVNULL)
manifest=dict(status='UNROUTED_CIRCUIT_AND_FIT_STUDY',baseline='/Users/takahashinaoki/Downloads/Pendant-rounded-fit-v7',baseline_mm=[26,31,14],new_mm=[23,25,14],round_v9_mm=[26,28,14],omi_reference_mm=[25.5,25.5,15],baseline_plan_area_mm2=26*31-(4-math.pi)*25,new_plan_area_mm2=23*25-(4-math.pi)*3.5**2,round_v9_plan_area_mm2=26*28-(4-math.pi)*12.9**2,omi_plan_area_mm2=math.pi*12.75**2,battery_mm=[15,17,6],battery_capacity_mAh=100,pcb_z_mm=8.5,pcb_thickness_mm=.8,parts=len(parts),source_sha256=hashlib.sha256((H/'placement.json').read_bytes()).hexdigest(),limitations=['Unrouted circuit, not for manufacture','Battery envelope and harness unqualified; no cable dummy included','Component heights are conservative envelopes, not vendor STEP','Tape closure and two temporary supports; retention and lanyard not designed','Omi is a cylindrical dimensional reference, not an exact industrial design'])
(P/'dimensions.json').write_text(json.dumps(manifest,indent=2));print(P)
