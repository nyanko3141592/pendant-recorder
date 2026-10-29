"""Isolate added lid features for CAD clearance when coplanar shell boolean fails."""
from pathlib import Path
import json, subprocess, sys
p=Path(sys.argv[1]) if len(sys.argv)>1 else Path('/Users/takahashinaoki/Downloads/Pendant-mini-rect-v13-fit-study-r4')
d=json.loads((p/'assembled.json').read_text()); names=[]
for c in d['commands']:
    v=c.get('params',{}); n=v.get('body_name','')
    if c['command']=='solid.extrude' and n.startswith(('bridge_','tongue_')):
        v['operation']='new'; v.pop('targets',None); names.append(n)
assert len(names)==8, names
d['commands'].append({'command':'inspect.clearance','params':{'bodies':names,'against':['case_body'],'min_volume':.0001,'clearance':.25}})
f=p/'alignment-features-check.json'; f.write_text(json.dumps(d))
out=p/'alignment-features-results.json'
subprocess.run([str(Path.home()/'.local/bin/solidcraft-cli'),'run',str(f),'--results','--json-out',str(out),'--quiet'],check=True)
r=json.loads(out.read_text())[-1]
assert not r['overlaps'] and not r['unchecked'] and not r['truncated'],r
print(json.dumps(r,indent=2))
