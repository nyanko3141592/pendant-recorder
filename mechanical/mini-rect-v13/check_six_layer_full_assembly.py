"""Full component-envelope check of max-thickness PCB and relief lid; not release qualification."""
from pathlib import Path
import json,subprocess,copy
root=Path(__file__).resolve().parent;source=root/'generate_six_layer_lid_relief.py'
ns={'__file__':str(source)}
exec(compile(source.read_text().split("lp=copy.deepcopy(lid)")[0],str(source),'exec'),ns)
board=copy.deepcopy(ns['board']);front={p['ref'] for p in ns['parts'] if p['side']=='F'}
for c in board:
 v=c['params']
 if c['command']=='sketch.create':
  if v.get('name') in {n+'_sketch' for n in front}:v['offset']+=.13
 if c['command']=='solid.extrude':
  if v.get('body_name')=='pcb_dummy':v['distance']=.93
  if v.get('body_name')=='pcb_acoustic_port':v['distance']=.95
  if v.get('operation')=='join':v['operation']='new';v.pop('targets',None)
cmds=ns['body']+ns['lid']+board+ns['battery']
parts=['pcb_dummy','battery_dummy']+[p['ref'] for p in ns['parts']]+['usb_stake_'+str(x)+'_'+str(y) for x in [-4.32,4.32] for y in [-3.105,1.075]]
cmds.append(dict(command='inspect.clearance',params=dict(bodies=['case_body','case_lid'],against=parts,min_volume=.001,clearance=.2)))
cmds.append(dict(command='inspect.clearance',params=dict(bodies=['battery_dummy'],against=[x for x in parts if x!='battery_dummy'],min_volume=.001,clearance=.2)))
p=ns['P'];f=p/'full-assembly-check.json';f.write_text(json.dumps(dict(commands=cmds)))
subprocess.run([ns['CLI'],'run',str(f),'--results','--json-out',str(p/'full-assembly-results.json'),'--quiet'],check=True)
