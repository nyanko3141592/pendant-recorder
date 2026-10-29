"""Experimental recessed closure; geometry evidence only, no thread qualification."""
from pathlib import Path
import json, copy, subprocess
root=Path(__file__).resolve().parent
source=root/'generate_six_layer_acoustic_r8.py'
ns={'__file__':str(source)}
exec(compile(source.read_text().split("run('CASE_R8_ACOUSTIC_CLEARANCE_FIT_ONLY',body)")[0],str(source),'exec'),ns)
body,lid=copy.deepcopy(ns['body']),copy.deepcopy(ns['lid'])
box=ns['box']
def cylinder(c,name,x,y,z,r,h,op='new',target=None):
 c.extend([dict(command='sketch.create',params=dict(plane='XY',offset=z,name=name+'_profile')),dict(command='sketch.circle.center',params=dict(center=[x,y],radius=r)),dict(command='sketch.finish',params={})])
 p=dict(distance=h,operation=op,body_name=name)
 if target:p['targets']=[target]
 c.append(dict(command='solid.extrude',params=p))
screws=[]
for side,x in [('left',1.4),('right',21.6)]:
 y=5
 box(body,'boss_'+side,x,y,11.6,2.4,2.4,.9,.3,'join','case_body')
 # Pilot only. Machined female thread or validated plastic fastening still required.
 cylinder(body,'pilot_'+side,x,y,11.4,.475,1.2,'cut','case_body')
 box(lid,'boss_clearance_'+side,x,y,11.7,2.6,2.6,.9,.3,'cut','case_lid')
 box(lid,'seat_support_'+side,x,y,12.6,2.4,2.4,.9,.3,'join','case_lid')
 cylinder(lid,'head_recess_'+side,x,y,13.5,1,2,'cut','case_lid')
 cylinder(lid,'shank_clearance_'+side,x,y,12.5,.7,1.1,'cut','case_lid')
 cylinder(screws,'screw_'+side,x,y,11.5,.6,2)
 cylinder(screws,'head_'+side,x,y,13.5,.9,.5,'join','screw_'+side)
board=copy.deepcopy(ns['board']);front={p['ref'] for p in ns['parts'] if p['side']=='F'}
for c in board:
 p=c['params']
 if c['command']=='sketch.create' and p.get('name') in {r+'_sketch' for r in front}:p['offset']+=.13
 if c['command']=='solid.extrude':
  if p.get('body_name')=='pcb_dummy':p['distance']=.93
  if p.get('body_name')=='pcb_acoustic_port':p['distance']=.95
  if p.get('operation')=='join':p['operation']='new';p.pop('targets',None)
parts=['pcb_dummy','battery_dummy']+[p['ref'] for p in ns['parts']]+['usb_stake_'+str(x)+'_'+str(y) for x in [-4.32,4.32] for y in [-3.105,1.075]]
c=body+lid+board+ns['battery']+screws
c.append(dict(command='inspect.clearance',params=dict(bodies=['case_body','case_lid','screw_left','screw_right'],against=parts,min_volume=.001,clearance=.2)))
c.append(dict(command='inspect.clearance',params=dict(bodies=['case_body'],against=['case_lid'],min_volume=.001,clearance=.01)))
out=root/'recessed-screw-cad-trial';out.mkdir(exist_ok=True)
f=out/'commands.json';f.write_text(json.dumps(dict(commands=c)))
subprocess.run([ns['CLI'],'run',str(f),'--out',str(out/'ASSEMBLY-NOT-PRINT-RELEASE.step'),'--results','--json-out',str(out/'results.json'),'--quiet'],check=True)
