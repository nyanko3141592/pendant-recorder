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
rect('C0',-51,17,23.8,34,14,2,'#b8c3ca');rect('D0',-17,12.75,25.5,25.5,14.5,3.5,'#83b5ad');disk('Omi_envelope',17,12.75,12.75,15,'#e1dfd5');disk('Coin',51,13.25,13.25,1.8,'#c3ad78');txt('Coin_text','500',51,11,1.8,5)
for n,x,title,dim,t in [('C',-51,'PREVIOUS C0','23.8 x 34.0','14.0 mm thick'),('D',-17,'NEW D0 STUDY','25.5 x 25.5','14.5 mm thick'),('O',17,'OMI ENVELOPE','D 25.5','15.0 mm thick'),('Y',51,'500 YEN','D 26.5','scale reference')]:
 txt(n+'title',title,x,-6,0,1.8);txt(n+'dim',dim,x,-10,0,1.8);txt(n+'thick',t,x,-14,0,1.5)
txt('Status','D0: UNROUTED / UNSOURCED PACK / NOT A FINISHED PRODUCT',0,-21,0,1.8)
(P/'comparison.json').write_text(json.dumps(dict(commands=c)))
