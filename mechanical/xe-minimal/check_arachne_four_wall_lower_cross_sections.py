from pathlib import Path
import json,re,math,hashlib,zipfile,xml.etree.ElementTree as ET
O=Path(__file__).resolve().parent;D=O/'home-case-slice-review/arachne-four-wall-lower';p=D/'plate_1.gcode'
with zipfile.ZipFile(D/'arachne-four-wall-lower.3mf') as archive:
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
with zipfile.ZipFile(D/'arachne-four-wall-lower.3mf') as archive:
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
heights=sorted(paths);selected=[heights[i]for i in [0,6,7,8,len(heights)-6,len(heights)-1]]
fig,axes=plt.subplots(2,3,figsize=(12,8));axs=dict(zip(selected,axes.flat));rows=[];last=0.
for height in heights:
 sample=(last+height)/2;last=height;shape=section(sample)
 beads=unary_union([LineString(pts).buffer(w/2)for pts,w,f in paths[height]])
 missing=shape.difference(beads);outside=beads.difference(shape)
 polys=lambda g:[g]if g.geom_type=='Polygon'else list(getattr(g,'geoms',[]))
 rows.append({'layer_top_mm':height,'sample_z_mm':sample,'cross_section_area_mm2':shape.area,'uncovered_area_mm2':missing.area,'outside_area_mm2':outside.area,'coverage_fraction':1-missing.area/shape.area,'largest_uncovered_region_mm2':max([g.area for g in polys(missing)]or[0])})
 if height in axs:
  ax=axs[height]
  for g in polys(shape):
   ax.fill(*g.exterior.xy,color='#ddd')
   for ring in g.interiors:ax.fill(*ring.xy,color='white')
  for pts,w,f in paths[height]:ax.plot(*zip(*pts),color='#247b87',linewidth=.5)
  for g in polys(missing):
   if g.geom_type=='Polygon'and not g.is_empty:ax.fill(*g.exterior.xy,color='#d84a40')
  ax.set_aspect('equal');ax.set_title(f'Top {height:.2f}, slice {sample:.2f} mm')
fig.suptitle('Lower case mesh cross-sections versus nominal commanded beads')
fig.text(.04,.01,'Red: cross-section area outside nominal beads. Mid-layer sample; not measured plastic or a strength result.')
fig.tight_layout(rect=(0,.03,1,.95));fig.savefig(D/'cross-section-review.png',dpi=140);plt.close(fig)
r={'status':'MID_LAYER_MESH_BEAD_COMPARISON_NOT_PRINT_APPROVAL','sources_sha256':{f:hashlib.sha256((D/f).read_bytes()).hexdigest()for f in ['plate_1.gcode','arachne-four-wall-lower.3mf']},'rows':rows,'limits':['3MF mesh transformed using component and build placement','Cross-sections sampled at layer midpoint; not exact slicer sampling or full layer volume','XOR assumes closed nonintersecting contour nesting; not a general self-intersecting mesh repair','Commanded bead width is not actual deposited plastic','Sparse infill and boundary discretization can produce intentional uncovered regions','No strength, fit, adhesion, tolerance or contact safety qualification']}
(D/'cross-section-review.json').write_text(json.dumps(r,indent=2)+'\n');print('Compared',len(rows),'layers; minimum nominal coverage',min(v['coverage_fraction']for v in rows))
