from pathlib import Path
import json,subprocess,copy
P=Path(__file__).parent;CLI=str(Path.home()/'.local/bin/solidcraft-cli')
def box(c,n,x,y,z,w,d,h,r,op='new',target=None):
 c.extend([{'command':'sketch.create','params':{'plane':'XY','offset':z,'name':n+'_sketch'}},{'command':'sketch.rectangle.rounded','params':{'p0':[x-w/2,y-d/2],'p1':[x+w/2,y+d/2],'radius':r}},{'command':'sketch.finish','params':{}}])
 p={'distance':h,'operation':op,'body_name':n}
 if target:p['targets']=[target]
 c.append({'command':'solid.extrude','params':p})
def base(z=0):
 c=[];box(c,'pebble',13,15.5,z,26,31,14,5)
 c.append({'command':'solid.fillet','params':{'body':'pebble','edges':[[13,0,z],[13,0,z+14]],'radius':3}})
 c.append({'command':'appearance.assign','params':{'bodies':['pebble'],'color':'#547888'}})
 # Through strap slot through the flat central land, clear of the peripheral R3 blend.
 box(c,'strap',13,4.6,z-0.1,6,1.4,14.2,.65,'cut','pebble')
 # Shallow USB representation: exterior size mockup, not a working connector cavity.
 box(c,'usb_recess',13,30.8,z+8.8,10,3,3.6,.5,'cut','pebble')
 return c
def run(name,c):
 f=P/'print'/(name+'.json');f.write_text(json.dumps({'commands':c}))
 subprocess.run([CLI,'run',str(f),'--out',str(f.with_suffix('.step')),'--out',str(f.with_suffix('.stl')),'--out',str(f.with_suffix('.3mf')),'--save',str(f.with_suffix('.solidcraft')),'--quiet'],check=True)
run('rounded_whole_26x31x14',base())
# Two solid visual halves with their broad mating faces on the bed. No latch; tape together.
a=base(-7);box(a,'remove_lower',13,15.5,-8,40,45,8,.1,'cut','pebble');run('rounded_front_half_print_flat',a)
# Back half omits the USB recess, otherwise symmetric to the front.
b=base(-7)[:-4];box(b,'remove_lower',13,15.5,-8,40,45,8,.1,'cut','pebble');run('rounded_back_half_print_flat',b)
c=base();(P/'assembled.json').write_text(json.dumps({'commands':c}))
subprocess.run([CLI,'snapshot',str(P/'assembled.json'),'--out',str(P/'rounded.png'),'--width','1200','--height','900','--view','iso','--no-grid','--no-axes'],check=True)
