from pathlib import Path
import json,re,math,hashlib,zipfile,sys,xml.etree.ElementTree as ET
O=Path(__file__).resolve().parent
candidate=sys.argv[1] if len(sys.argv)>1 else 'fine-lower'
assert candidate in ['fine-lower','solid-fine-lower','four-wall-lower','arachne-lower','arachne-four-wall-lower','wider-right-lower']
D=O/'home-case-slice-review'/candidate;p=D/'plate_1.gcode'
with zipfile.ZipFile(D/(candidate+'.3mf')) as archive:
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
 if de>0 and layer is not None and feature!='Custom' and any(math.dist(a,b)>1e-7 for a,b in zip(points,points[1:])):paths.setdefault(layer,[]).append((points,width,feature))
 x,y,z=nx,ny,nz

import numpy as np
from shapely.geometry import LineString,Polygon,GeometryCollection
from shapely.ops import unary_union,polygonize
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
with zipfile.ZipFile(D/(candidate+'.3mf')) as archive:
 component=tree.find('.//{*}component');c=list(map(float,component.attrib['transform'].split()))
 object_path=next(v for k,v in component.attrib.items()if k.endswith('path')).lstrip('/')
 model=ET.fromstring(archive.read(object_path))
 verts=np.array([[float(v.attrib[k])for k in ['x','y','z']]for v in model.findall('.//{*}vertex')])
 for transform in [c,m]:verts=verts@np.array(transform[:9]).reshape(3,3)+np.array(transform[9:])
 faces=np.array([[int(t.attrib[k])for k in ['v1','v2','v3']]for t in model.findall('.//{*}triangle')]);triangles=verts[faces]
def section(z):
 lines=[]
 for tri in triangles:
  points=[]
  for a,b in zip(tri,np.roll(tri,-1,axis=0)):
   if (a[2]<z<b[2])or(b[2]<z<a[2]):points.append(tuple(np.round((a+(b-a)*(z-a[2])/(b[2]-a[2]))[:2],7)))
  if len(points)==2 and points[0]!=points[1]:lines.append(LineString(points))
 contours=list(polygonize(unary_union(lines)))
 shape=GeometryCollection()
 # Each polygonized face has one exterior boundary. XOR nested exteriors
 # recovers material/void alternation for closed, nonintersecting mesh contours.
 for poly in contours:shape=shape.symmetric_difference(Polygon(poly.exterior))
 assert not shape.is_empty and shape.is_valid,(z,'empty or invalid section')
 return shape
shift=np.array(json.loads((D/'review.json').read_text())['translation_mm'])
def original(x,y):return (np.array([x,y,7.6])-np.array(m[9:]))@np.linalg.inv(np.array(m[:9]).reshape(3,3))-shift
rows=[]
for z in [7.561,7.58,7.599,7.601,7.62,7.639]:
 sh=section(z);beads=unary_union([LineString(pts).buffer(w/2)for pts,w,f in paths[7.64]])
 miss=sh.difference(beads);polys=[miss]if miss.geom_type=='Polygon'else list(miss.geoms);regions=[]
 for g in polys:
  if g.area<.05:continue
  x0,y0,x1,y1=g.bounds;v=np.array([original(x,y)for x in [x0,x1]for y in [y0,y1]])
  regions.append({'area_mm2':g.area,'case_xy_bounds_mm':[v[:,0].min(),v[:,1].min(),v[:,0].max(),v[:,1].max()]})
 rows.append({'sample_height_mm':z,'uncovered_mm2':miss.area,'outside_mm2':beads.difference(sh).area,'large_regions':regions})
(D/'fine-gap-location-review.json').write_text(json.dumps({'status':'DIAGNOSTIC_NOT_PRINT_APPROVAL','candidate':candidate,'rows':rows},indent=2)+'\n');print(json.dumps(rows,indent=2))
