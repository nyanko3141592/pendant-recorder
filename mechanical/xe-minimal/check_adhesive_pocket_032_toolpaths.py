from pathlib import Path
import cadquery as cq,json,re,math,hashlib,zipfile,xml.etree.ElementTree as ET
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
O=Path(__file__).resolve().parent;D=O/'home-case-slice-review';s=cq.importers.importStep(str(O/'rounded-glue-reinforced-lower-study.step')).val();b=s.BoundingBox()
r=json.loads((D/'adhesive-pocket-032/result.json').read_text());box=r['sliced_plates'][0]['objects'][0]['bbox'];center=(21.93-b.xmin+box['x'],-4.565-b.ymin+box['y']);top=-.15-b.zmin
with zipfile.ZipFile(D/'adhesive-pocket-032/adhesive-pocket.3mf') as archive:
 tree=ET.fromstring(archive.read('3D/3dmodel.model'));item=tree.find('.//{*}build/{*}item');m=list(map(float,item.attrib['transform'].split()));px,py=21.93-b.xmin,-4.565-b.ymin;center=(m[0]*px+m[3]*py+m[9],m[1]*px+m[4]*py+m[10])
p=D/'adhesive-pocket-032/plate_1.gcode';x=y=z=0.;layer=None;width=.42;feature='';relative=False;old_e=0;paths={}
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
 if de>0 and layer is not None and layer>=7.72 and feature!='Custom':paths.setdefault(layer,[]).append((points,width,feature))
 x,y,z=nx,ny,nz

fig,axs=plt.subplots(1,len(paths),figsize=(11,4));rows=[]
for ax,(h,segments) in zip(axs,sorted(paths.items())):
 for points,w,f in segments:ax.plot([a for a,_ in points],[a for _,a in points],color='tab:blue',lw=1)
 ax.set_aspect('equal');ax.set_title(f'Z={h:.2f} mm');ax.set(xlim=(76,104),ylim=(74,106))
 rows.append({'z_mm':h,'extruding_segments':len(segments),'xy_extrusion_length_mm':sum(sum(math.hypot(bx-ax,by-ay)for (ax,ay),(bx,by)in zip(points,points[1:]))for points,_,_ in segments)})
fig.tight_layout();fig.savefig(D/'adhesive-pocket-032/top-layers.png',dpi=160)
(D/'adhesive-pocket-032/toolpath-review.json').write_text(json.dumps({'status':'TOP_LAYER_PATH_REVIEW','layers':rows,'gcode_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'nominal_recess_top_z_mm':7.80,'nominal_stop_top_z_mm':8.12,'limits':['Layer positions and command paths only, not printed dimensions or adhesive bond qualification']},indent=2));print(rows)
