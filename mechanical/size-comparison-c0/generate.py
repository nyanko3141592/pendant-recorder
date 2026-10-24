import json
from pathlib import Path
P=Path(__file__).resolve().parent
commands=[]
def cmd(n,**p):commands.append({'command':n,'params':p})
for folder,prefix,x,y in [('structure-b0','B0_',-54,23.25),('structure-c0','C0_',-18,17)]:
 src=json.loads((P.parent/folder/'assembled.json').read_text())['commands']
 names=set()
 bodies=[]
 for c in src:
  p=c['params']
  for k in ['name','body_name']:
   if k in p:names.add(p[k])
  if c['command']=='solid.extrude' and p.get('operation')=='new':bodies.append(p['body_name'])
 def replace(v):
  if isinstance(v,str):return prefix+v if v in names else v
  if isinstance(v,list):return [replace(i) for i in v]
  if isinstance(v,dict):return {k:replace(i) for k,i in v.items()}
  return v
 commands.extend(replace(c) for c in src)
 cmd('solid.move',bodies=[prefix+n for n in bodies],translate=[x,y,0])
def disk(name,r,z,h,color,inner=None,center=(54,13.25)):
 cmd('sketch.create',plane='XY',offset=z,name=name+'_sketch')
 cmd('sketch.circle.center',center=list(center),radius=r)
 if inner:cmd('sketch.circle.center',center=list(center),radius=inner)
 cmd('sketch.finish');cmd('solid.extrude',distance=h,operation='new',body_name=name)
 cmd('appearance.assign',bodies=[name],color=color)
def text(name,s,x,y,z,size,color='#28394a'):
 cmd('sketch.create',plane='XY',offset=z,name=name+'_sketch')
 cmd('sketch.text',text=s,at=[x,y],height=size,align="center")
 cmd('sketch.finish');cmd('solid.extrude',distance=.06,operation='new',body_name=name)
 cmd('appearance.assign',bodies=[name],color=color)
disk('Coin_outer',13.25,0,1.8,'#c1a568',9.5)
disk('Coin_center',9.5,0,1.8,'#c9cbd0')
disk('Coin_rim',13.25,1.8,.12,'#d2b87a',12.7)
text('Coin_500','500',54,11,1.8,5,'#797c80')
disk('Omi_envelope',12.5,0,15,'#eceae5',center=(18,12.5))
text('Omi_mark','omi',18,11,15,3,'#777777')
for name,x,title,dim in [('Old',-54,'Rev B','24.8 x 46.5'),('New',-18,'Rev C*','23.8 x 34.0'),('Omi',18,'Omi*','D 25 mm'),('Yen',54,'500 YEN','D 26.5 mm')]:
 text(name+'_title',title,x,-6,0,2.6)
 text(name+'_dim',dim,x,-11,0,1.8)
 if name!='Yen':text(name+'_thickness','T 15 mm' if name=='Omi' else ('T 14.0 mm' if name=='New' else 'T 12.8 mm'),x,-15,0,1.8)
(P/'comparison.json').write_text(json.dumps({'commands':commands},ensure_ascii=False))
