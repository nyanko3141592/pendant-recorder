from pathlib import Path
import json,re,math,hashlib
O=Path(__file__).resolve().parent
D=O/'home-case-slice-review/diagonal-tray-mounted-lower'
p=D/'plate_1.gcode'
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

from shapely.geometry import LineString,box
from shapely.ops import unary_union
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
# This 3mf uses a 180-degree XY rotation and translation(103.1,104.8).
# Input STL translated by(1.1,28.3), so CAD→bed is(102-x,76.5-y).
roi=box(79.5,77,86,84)
heights=[h for h in sorted(paths) if 4.8<h<5.13]
fig,axes=plt.subplots(1,len(heights),figsize=(4*len(heights),4),squeeze=False)
rows=[]
for ax,h in zip(axes.flat,heights):
 prev=max(k for k in paths if k<h)
 def beads(z):return unary_union([LineString(pts).buffer(w/2) for pts,w,f in paths[z]]).intersection(roi)
 current=beads(h);prior=beads(prev);unsupported=current.difference(prior)
 features={}
 for pts,w,f in paths[h]:
  line=LineString(pts)
  if not line.intersects(roi):continue
  features[f]=features.get(f,0)+1
  ax.plot(*zip(*pts),color='#247b87',linewidth=.7)
 for poly in ([unsupported] if unsupported.geom_type=='Polygon' else getattr(unsupported,'geoms',[])):
  if poly.geom_type=='Polygon':ax.fill(*poly.exterior.xy,color='#dc745d',alpha=.6)
 ax.set_xlim(79.5,86);ax.set_ylim(77,84);ax.set_aspect('equal');ax.set_title(f'Layer {h:.2f} mm')
 rows.append({'layer_mm':h,'previous_layer_mm':prev,'roi_bead_area_mm2':current.area,'roi_area_without_previous_bead_mm2':unsupported.area,'features':features})
fig.suptitle('Tray pedestal transition: nominal commanded bead support');fig.tight_layout();fig.savefig(D/'tray-transition-review.png',dpi=160)
r={'status':'TRAY_TOOLPATH_SCREEN_NOT_PRINT_QUALIFICATION','gcode_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'roi_bed_xy_mm':[79.5,77,86,84],'cad_to_bed_xy':'(102-x,76.5-y), verified from current 3mf transform and STL translation','rows':rows,'limits':['ROI includes surrounding case features; unsupported area is not exclusively tray.','Nominal bead overlap does not prove deposition or strength.','Overhang/Bridge classification is not physical support validation.']}
(D/'tray-transition-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(rows,indent=2))
