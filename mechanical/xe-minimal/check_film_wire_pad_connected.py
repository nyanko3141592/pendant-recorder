"""Exact tangent circular bends, selected radii are hypotheses not wire specifications."""
from pathlib import Path
import cadquery as cq
import numpy as np
import math,json,hashlib
O=Path(__file__).resolve().parent
source=O/'film-wire-route-review.json';data=json.loads(source.read_text())
files={'board':'film-sensor-depopulated-board-study.step','separator':'film-wide-bridge-separator-trial.step','lower':'wider-right-support-lower-trial.step','upper':'tab-clearance-upper-trial.step','battery':'offset-pack-assembly-trial.step'}
shapes={k:cq.importers.importStep(str(O/v)).val() for k,v in files.items()}
def rounded(points,r):
 p=[np.array(x,dtype=float) for x in points]; corners={}; trims={}
 for i in range(1,len(p)-1):
  u=(p[i]-p[i-1]);u/=np.linalg.norm(u);v=p[i+1]-p[i];v/=np.linalg.norm(v)
  theta=math.acos(np.clip(np.dot(u,v),-1,1));t=r*math.tan(theta/2)
  a=p[i]-t*u;b=p[i]+t*v;n=v-np.dot(u,v)*u;n/=np.linalg.norm(n);c=a+r*n
  mid=c+r*((a-c)+(b-c))/np.linalg.norm((a-c)+(b-c))
  corners[i]=(a,mid,b);trims[i]=t
 for i in range(len(p)-1):
  if trims.get(i,0)+trims.get(i+1,0)>=np.linalg.norm(p[i+1]-p[i])-1e-7: raise ValueError('radius requires more tangent length than segment provides')
 edges=[];last=p[0]
 for i in range(1,len(p)-1):
  a,m,b=corners[i];edges.append(cq.Edge.makeLine(cq.Vector(*last),cq.Vector(*a)));edges.append(cq.Edge.makeThreePointArc(cq.Vector(*a),cq.Vector(*m),cq.Vector(*b)));last=b
 edges.append(cq.Edge.makeLine(cq.Vector(*last),cq.Vector(*p[-1])))
 path=cq.Wire.assembleEdges(edges);normal=cq.Vector(*(p[1]-p[0]))
 shape=cq.Workplane(cq.Plane(origin=cq.Vector(*p[0]),normal=normal)).circle(.155).sweep(cq.Workplane(obj=path),isFrenet=True).val()
 return shape,path.Length()
source=O/'film-wire-separated-review.json';previous=json.loads(source.read_text());base=previous['rows'][previous['displayed_row']]['paths_mm']
paths=[p+[[p[-1][0],p[-1][1],-.2]] for p in base]
rows=[];models=[]
for radius in [.5,.75,1.]:
 row={'radius_mm':radius,'paths_mm':paths}
 try:
  pairs=[rounded(p,radius) for p in paths];w=[x[0] for x in pairs];shape=cq.Compound.makeCompound(w)
  row.update(valid=all(x.isValid() for x in w),overlap_mm3={k:shape.intersect(v).Volume() for k,v in shapes.items()},clearance_mm={k:shape.distance(v) for k,v in shapes.items()},wire_to_wire_mm=w[0].distance(w[1]),lengths_mm=[x[1] for x in pairs]);models.append((len(rows),shape))
 except ValueError as e:row['error']=str(e)
 rows.append(row)
valid=[(i,s) for i,s in models if rows[i]['valid'] and max(rows[i]['overlap_mm3'].values())<1e-8 and rows[i]['wire_to_wire_mm']>0]
chosen=valid[-1] if valid else None
if chosen:
 a=cq.Assembly(name='continuous_pad_approach');a.add(shapes['board'],name='depopulated_board',color=cq.Color('#328866'));a.add(shapes['separator'],name='separator',color=cq.Color('#ddbb55'));a.add(chosen[1],name='wires',color=cq.Color('#bb44aa'));a.export(str(O/'film-wire-pad-connected-study.step'))
r={'status':'CONTINUOUS_ROUTE_TO_PAD_UNDERSIDE_NOT_SOLDER_QUALIFIED','rows':rows,'displayed_row':chosen[0] if chosen else None,'sources_sha256':{k:hashlib.sha256((O/v).read_bytes()).hexdigest() for k,v in files.items()},'limits':['Stops0.2mm below pad; stripped ends and solder not included.','Sensor joint exit, strain relief and assembly tolerance remain unqualified.','Bend radii are hypotheses, not manufacturer limits.']}
(O/'film-wire-pad-connected-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
