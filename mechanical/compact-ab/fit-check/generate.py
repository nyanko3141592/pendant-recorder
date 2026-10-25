"""Isolated fit-check artifacts; never modifies electrical design."""
import json,subprocess,copy,csv
from pathlib import Path
P=Path(__file__).resolve().parent; CLI=str(Path.home()/'.local/bin/solidcraft-cli')
parts=json.loads((P/'source/components.json').read_text()); manifest={}
class Model:
 def __init__(self):self.c=[]
 def cmd(self,c,**p):self.c.append(dict(command=c,params=p))
 def box(self,n,x,y,z,w,d,h,op='new',target=None,color='#597480',r=0):
  self.cmd('sketch.create',plane='XY',offset=z,name=n+'_sketch')
  self.cmd('sketch.rectangle.rounded' if r else 'sketch.rectangle.two_point',**dict(p0=[x,y],p1=[x+w,y+d],**({'radius':r} if r else {})))
  self.cmd('sketch.finish');self.cmd('solid.extrude',distance=h,operation=op,body_name=n,**({'targets':[target]} if target else {}))
  if op=='new':self.cmd('appearance.assign',bodies=[n],color=color)
 def save(self,path,export=True):
  path.parent.mkdir(parents=True,exist_ok=True);path.with_suffix('.json').write_text(json.dumps({'commands':self.c}))
  if export:
   subprocess.run([CLI,'run',str(path.with_suffix('.json')),'--out',str(path.with_suffix('.stl')),'--out',str(path.with_suffix('.3mf')),'--quiet'],check=True,stdout=subprocess.DEVNULL)
for v,W,T,px,pz in [('A',40,10.8,20,3.2),('B',22,16.4,2,9)]:
 H=41; py=5; bx=2 if v=='A' else 3.25
 models={};positions={}; shell=Model();shell.box(v+'_body',0,0,0,W,H,T-1.2,r=1)
 shell.box('cavity',1.2,1.2,1.2,W-2.4,H-2.4,T,op='cut',target=v+'_body')
 # Four narrow ledges contact the PCB's empty outer edge; all grow from the floor.
 for side,x in [('left',px-.85),('right',px+17.15)]:
  for y in [26,35]:shell.box('support_'+side+str(y),x,y,1.19,1.7,2,pz-1.19,op='join',target=v+'_body')
 # Battery stands 0.3 above floor, with low locator fences outside maximum pack outline.
 for x in [bx+1,bx+13]:shell.box('battery_pad'+str(x),x,8,1.19,1.5,23,.31,op='join',target=v+'_body')
 for x in [bx-.7,bx+15.8]:shell.box('battery_stop'+str(x),x,15,1.19,.4,8,1.11,op='join',target=v+'_body')
 shell.box('battery_end',bx+3,33.3,1.19,9,.4,1.11,op='join',target=v+'_body')
 shell.box('usb_access',px+3.2,39.7,pz+.6,11.6,1.5,4.2,op='cut',target=v+'_body')
 shell.box('finger_notch',0,19,T-2.4,1.4,5,1.3,op='cut',target=v+'_body')
 models['body']=shell;positions['body']=[0,0,0]
 # Lid printed exterior face down: raised locating rim. In assembly flip 180deg around X.
 lid=Model();lid.box(v+'_lid',0,0,0,W,H,1.2,r=1,color='#90a7ae')
 lid.box('rim',1.5,1.5,1.19,W-3,H-3,1.21,op='join',target=v+'_lid')
 lid.box('rim_void',2.3,2.3,1.2,W-4.6,H-4.6,1.3,op='cut',target=v+'_lid')
 models['lid']=lid;positions['lid']={'rotation_x_deg':180,'translation':[0,H,T]}
 pcb=Model();pcb.box(v+'_pcb',0,0,1.5,18,33,.8,color='#2a8d74')
 for p in parts:
  z=2.29 if p['side']=='F' else 1.5-p['height'];height=p['height']+.01
  pcb.box(p['ref'],p['x'],p['y'],z,p['w'],p['d'],height,op='join',target=v+'_pcb')
 models['pcb_components']=pcb;positions['pcb_components']=[px,py,pz-1.5]
 battery=Model();battery.box(v+'_battery',0,0,0,15.5,27,4.2,color='#d9ad53');models['battery']=battery;positions['battery']=[bx,6,1.5]
 harness=Model();start=bx+7.75;end=px+3.625;lo=min(start,end);span=abs(end-start);hz=6 if v=='A' else 11.5
 harness.box(v+'_harness_reservation',0,0,0,span+1.2,1.2,1.2,color='#d87945')
 for x in [0,span]:harness.box('bend_'+str(x),x,1.19,0,1.2,2.01,1.2,op='join',target=v+'_harness_reservation')
 models['harness_reservation']=harness;positions['harness_reservation']=[lo-.6,2.8,hz]
 for name,m in models.items():
  print(v,name,flush=True);m.save(P/v/name)
 # Exact combined CAD scene for analytic interference and clear exploded assembly views.
 for exploded in [False,True]:
  scene=Model()
  for name,m in models.items():
   scene.c+=copy.deepcopy(m.c);body=v+('_pcb' if name=='pcb_components' else '_'+name)
   pos=positions[name]
   if name=='lid':
    scene.cmd('solid.move',bodies=[body],axis=[1,0,0],angle=180);pos=pos['translation'].copy()
   else:pos=pos.copy()
   if exploded:pos[2]+={'body':0,'battery':12,'pcb_components':28,'harness_reservation':20,'lid':48}[name]
   scene.cmd('solid.move',bodies=[body],translate=pos)
  stem=P/v/('exploded' if exploded else 'assembled');scene.save(stem,False)
  subprocess.run([CLI,'run',str(stem.with_suffix('.json')),'--out',str(stem.with_suffix('.step')),'--quiet'],check=True,stdout=subprocess.DEVNULL)
  subprocess.run([CLI,'snapshot',str(stem.with_suffix('.json')),'--out',str(stem.with_suffix('.png')),'--width','1200','--height','1200','--view','iso','--no-grid','--no-axes'],check=True,stdout=subprocess.DEVNULL)
  if not exploded:
   scene.cmd('inspect.interference');scene.save(P/v/'interference',False)
   subprocess.run([CLI,'run',str(P/v/'interference.json'),'--results','--json-out',str(P/v/'interference-results.json'),'--quiet'],check=True,stdout=subprocess.DEVNULL)
 manifest[v]=dict(original_mm=[38,39,8.9] if v=='A' else [20,39,14.5],fit_case_mm=[W,H,T],assembly_transforms=positions,pcb_bottom_z=pz,wall=1.2,lid_clearance_per_side=.3,pcb_edge_support_overlap=.85,parts=75)
# Flat length gauges, measured from left to right, not substitute wires.
for L in [12,15,18]:
 m=Model();m.box('length_'+str(L),0,0,0,L,2,.8,color='#d87945');m.save(P/'gauges'/('lead_'+str(L)+'mm'))
(P/'dimensions-and-assembly.json').write_text(json.dumps(manifest,indent=2))
with (P/'component-envelopes.csv').open('w') as f:
 w=csv.DictWriter(f,fieldnames=parts[0]);w.writeheader();w.writerows(parts)
