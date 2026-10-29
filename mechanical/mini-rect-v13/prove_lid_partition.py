"""Prove nominal non-overlap by construction, not by a failed whole-shell boolean.
No claim about mesh approximation, physical fit, tolerances or retention.
"""
from pathlib import Path
import hashlib,json,struct
D=Path('/Users/takahashinaoki/Downloads')
a=D/'Pendant-mini-rect-v13-fit-study-r3';b=D/'Pendant-mini-rect-v13-fit-study-r4'
x=json.loads((a/'assembled.json').read_text())['commands']
y=json.loads((b/'assembled.json').read_text())['commands']
def sketch(cmds,name):
 return next(i for i,c in enumerate(cmds) if c['command']=='sketch.create' and c['params'].get('name')==name)
i=sketch(x,'pcb_dummy_sketch');j=sketch(y,'pcb_dummy_sketch')
assert x[:i]==y[:i] and x[i:]==y[j:]
added=y[i:j];assert len(added)==32
names=[c['params']['body_name'] for c in added if c['command']=='solid.extrude']
assert len(names)==8 and all(n.startswith(('bridge_','tongue_')) for n in names)
idx=sketch(x,'remove_bottom_sketch');clip=x[idx:idx+4]
assert clip[0]['params']['offset']==-1
assert clip[1]['params']['p0']==[-7.0,-8.5] and clip[1]['params']['p1']==[33.0,36.5]
assert clip[3]['params']['distance']==12.81 and clip[3]['params']['operation']=='cut'
assert clip[3]['params']['targets']==['case_lid']
body=(b/'print/01_hollow_case_body.stl').read_bytes()
assert body==(a/'print/01_hollow_case_body.stl').read_bytes()
n=struct.unpack_from('<I',body,80)[0];z=[]
for k in range(n):
 v=struct.unpack_from('<12f',body,84+50*k)[3:];z.extend(v[2::3])
assert abs(max(z)-11.81)<.00001
r=json.loads((b/'alignment-features-results.json').read_text())[-1]
assert r['bodies']==8 and r['pairs_checked']==8 and not r['unchecked'] and not r['overlaps'] and not r['truncated']
report={'status':'NOMINAL_CONSTRUCTION_PARTITION_PASS','proof':['r4 differs from r3 assembled commands only by eight added solids','Base lid cut removes all material below z11.81 over complete shell XY envelope','Unchanged body mesh has maximum z11.81; common boundary has no volume','Each of eight added solids has successful non-overlap check against body; union cannot introduce additional material'], 'input_sha256':{str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in [a/'assembled.json',b/'assembled.json',b/'alignment-features-results.json',b/'print/01_hollow_case_body.stl']},'limits':['Whole-shell CAD boolean still fails; this is a separate construction proof','Mesh bounds are tessellated, not exact B-rep extrema','No print-tolerance, fit, strength or harness qualification']}
(b/'lid-partition-proof.json').write_text(json.dumps(report,indent=2)+'\n');print(report['status'])
