"""Read nominal deposited XY paths; widths are slicer commands, not measurements."""
import re, math

def read_paths(p):
    x=y=z=0.;layer=None;width=.42;feature='';relative=False;old_e=0;paths={}
    for line in p.read_text().splitlines():
     if line.startswith('; Z_HEIGHT:'):layer=float(line.split(':')[1])
     if line.startswith('; LINE_WIDTH:'):width=float(line.split(':')[1])
     if line.startswith('; FEATURE:'):feature=line.split(':',1)[1].strip()
     code=line.split(';')[0].strip();cmd=code.split(' ')[0];v={k:float(n)for k,n in re.findall(r'([XYZIJEF])(-?\d*\.?\d+)',code)}
     if cmd=='M83':relative=True
     if cmd=='M82':relative=False
     if cmd=='G92':old_e=v.get('E',old_e);continue
     if cmd not in ['G0','G1','G2','G3']:continue
     nx,ny,nz=v.get('X',x),v.get('Y',y),v.get('Z',z);de=v.get('E',0) if relative else v.get('E',old_e)-old_e
     if 'E'in v:old_e=v['E'] if not relative else old_e+v['E']
     points=[(x,y),(nx,ny)]
     if cmd in ['G2','G3'] and ('I'in v or 'J'in v):
      cx,cy=x+v.get('I',0),y+v.get('J',0);rad=math.hypot(x-cx,y-cy);a=math.atan2(y-cy,x-cx);end=math.atan2(ny-cy,nx-cx);sweep=(end-a)%(2*math.pi) if cmd=='G3'else-((a-end)%(2*math.pi));steps=max(2,math.ceil(abs(sweep)*rad/.01));points=[(cx+rad*math.cos(a+sweep*i/steps),cy+rad*math.sin(a+sweep*i/steps))for i in range(steps+1)]
     if de>0 and layer is not None and feature!='Custom' and any(math.dist(a,b)>1e-7 for a,b in zip(points,points[1:])):paths.setdefault(layer,[]).append((points,width,feature))
     x,y,z=nx,ny,nz
    return paths
