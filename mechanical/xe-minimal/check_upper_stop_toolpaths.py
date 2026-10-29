from pathlib import Path
import json,re,math,hashlib,zipfile,xml.etree.ElementTree as ET
O=Path(__file__).resolve().parent;D=O/'home-case-slice-review/thickness-clearance-upper';p=D/'plate_1.gcode'
with zipfile.ZipFile(D/'upper.3mf') as archive:
 tree=ET.fromstring(archive.read('3D/3dmodel.model'));m=list(map(float,tree.find('.//{*}build/{*}item').attrib['transform'].split()))
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
 if de>0 and layer is not None and layer>=3.88 and feature!='Custom':paths.setdefault(layer,[]).append((points,width,feature))
 x,y,z=nx,ny,nz

def distance(p,a,b):
 dx,dy=b[0]-a[0],b[1]-a[1];l=dx*dx+dy*dy
 t=max(0,min(1,((p[0]-a[0])*dx+(p[1]-a[1])*dy)/l)) if l else 0
 return math.hypot(p[0]-a[0]-t*dx,p[1]-a[1]-t*dy)
rows=[]
for x0,y0 in [(.35,-3),(.35,-22),(23.65,-8),(21,-26.65)]:
 px,py=x0+1.1,-y0+1.3;point=(m[0]*px+m[3]*py+m[9],m[1]*px+m[4]*py+m[10])
 hits=[h for h,segments in sorted(paths.items()) if any(distance(point,a,b)<=w/2 for points,w,f in segments for a,b in zip(points,points[1:]))]
 rows.append({'original_xy_mm':[x0,y0],'bed_xy_mm':point,'covered_layer_z_mm':hits,'last_covered_z_mm':max(hits) if hits else None})
r={'status':'COMMAND_PATH_SCREEN_NOT_MEASURED','stop_cad_print_z_mm':4.2214001,'points':rows,'gcode_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'limits':['Only four stop center points checked; command bead width is not measured plastic width','Layer tops are commanded positions; actual shrinkage, extrusion and warpage unmeasured','Print-space reference differs from assembly datum; mating face quantization also matters']}
(D/'stop-toolpath-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
