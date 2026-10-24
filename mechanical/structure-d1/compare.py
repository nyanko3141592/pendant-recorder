import json
from pathlib import Path
P=Path(__file__).resolve().parent;c=[]
def cmd(n,**p):c.append(dict(command=n,params=p))
def rect(n,x,y,w,h,t,r,color):
 cmd('sketch.create',plane='XY',name=n+'_profile');cmd('sketch.rectangle.rounded',p0=[x-w/2,y-h/2],p1=[x+w/2,y+h/2],radius=r);cmd('sketch.finish');cmd('solid.extrude',distance=t,operation='new',body_name=n);cmd('appearance.assign',bodies=[n],color=color)
def disk(n,x,y,r,h,color):
 cmd('sketch.create',plane='XY',name=n+'_profile');cmd('sketch.circle.center',center=[x,y],radius=r);cmd('sketch.finish');cmd('solid.extrude',distance=h,operation='new',body_name=n);cmd('appearance.assign',bodies=[n],color=color)
def txt(n,s,x,y,z,size=2):
 cmd('sketch.create',plane='XY',offset=z,name=n+'_profile');cmd('sketch.text',text=s,at=[x,y],height=size,align='center');cmd('sketch.finish');cmd('solid.extrude',distance=.05,operation='new',body_name=n);cmd('appearance.assign',bodies=[n],color='#31465a')
rect('C0',-68,17,23.8,34,14,2,'#bbc5cc');rect('D0',-34,12.75,25.5,25.5,14.5,3.5,'#b5c8c3');disk('D1',0,12.75,12.75,14.5,'#63ac9a');disk('Omi_envelope',34,12.75,12.75,15,'#e1dfd5');disk('Coin',68,13.25,13.25,1.8,'#c3ad78');txt('Coin_text','500',68,11,1.8,5)
for n,x,title,dim,t in [('C',-68,'OLDER C0','23.8 x 34.0','T 14.0 mm'),('D',-34,'PREVIOUS D0','25.5 x 25.5','T 14.5 mm'),('N',0,'NEW ROUND D1','D 25.5','T 14.5 mm'),('O',34,'OMI ENVELOPE','D 25.5','T 15.0 mm'),('Y',68,'500 YEN','D 26.5','scale reference')]:
 txt(n+'title',title,x,-6,0,1.8);txt(n+'dim',dim,x,-10,0,1.8);txt(n+'thick',t,x,-14,0,1.5)
txt('Status','D1: ALL 76 LOCATIONS / UNROUTED / PACK DIMENSIONS UNCONFIRMED',0,-21,0,1.8)
(P/'comparison.json').write_text(json.dumps(dict(commands=c)))
