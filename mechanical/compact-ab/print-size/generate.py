from pathlib import Path
import json,subprocess
P=Path(__file__).resolve().parent
for v,w,d,h in [('A',38,39,8.9),('B',20,39,14.5)]:
 name=f'Pendant_{v}_size_{w}x{d}x{h}mm';c=[]
 def cmd(command,**params):c.append(dict(command=command,params=params))
 cmd('sketch.create',plane='XY',offset=0,name='outline');cmd('sketch.rectangle.rounded',p0=[0,0],p1=[w,d],radius=2);cmd('sketch.finish');cmd('solid.extrude',distance=h,operation='new',body_name='size_mockup')
 cmd('sketch.create',plane='XY',offset=0,name='cord_slot');cmd('sketch.rectangle.rounded',p0=[w/2-3,.95],p1=[w/2+3,2.45],radius=.6);cmd('sketch.finish');cmd('solid.extrude',distance=h,operation='cut',targets=['size_mockup'])
 (P/f'{name}.json').write_text(json.dumps({'commands':c},indent=2))
 subprocess.run([str(Path.home()/'.local/bin/solidcraft-cli'),'run',str(P/f'{name}.json'),'--out',str(P/f'{name}.stl'),'--out',str(P/f'{name}.3mf'),'--quiet'],check=True)
