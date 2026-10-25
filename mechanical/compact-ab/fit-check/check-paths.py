import json,subprocess
from pathlib import Path
P=Path(__file__).resolve().parent;CLI=str(Path.home()/'.local/bin/solidcraft-cli');summary={}
for v in ['A','B']:
 c=[];events=[]
 def move(name,z):c.append(dict(command='solid.move',params=dict(bodies=[v+'_'+name],translate=[0,0,z])))
 def check(label):c.append(dict(command='inspect.interference',params={}));events.append(label)
 # Reverse of the assembly order. All movement is straight vertical and reversible.
 for name in ['lid','harness_reservation','pcb','battery']:
  current=0
  for absolute in [.2,.5,1,2,5,10,20,40]:
   move(name,absolute-current);current=absolute;check(name+' +'+str(absolute)+'mm')
  move(name,160) # park well clear before lifting the next body
 path=P/v/'withdrawal-paths.json';path.write_text(json.dumps(dict(commands=c)))
 out=P/v/'withdrawal-results.json'
 subprocess.run([CLI,'run',str(path),'--in',str(P/v/'assembled.step'),'--results','--json-out',str(out),'--quiet'],check=True,stdout=subprocess.DEVNULL)
 data=json.loads(out.read_text());hits=[a for a in data if isinstance(a,dict) and 'interferences' in a]
 assert len(hits)==len(events),(len(hits),len(events))
 summary[v]=[]
 for name,result in zip(events,hits):
  assert result['count']==0 and not result['unchecked'] and not result['truncated'],(v,name,result)
  summary[v].append(dict(position=name,count=result['count'],unchecked=result['unchecked']))
(P/'withdrawal-validation.json').write_text(json.dumps(dict(scope='32 discrete vertical withdrawal poses per variant, exact CAD solid tests. Not a continuous swept-volume proof or physical assembly.',variants=summary),indent=2));print('PASS withdrawal poses')
