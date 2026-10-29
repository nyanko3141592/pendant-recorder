"""Exact tangent circular bends, selected radii are hypotheses not wire specifications."""
from pathlib import Path
import cadquery as cq
import numpy as np
import math,json,hashlib
O=Path(__file__).resolve().parent
source=O/'film-wire-route-review.json';data=json.loads(source.read_text())
files={'board':'ncu-candidate-integrated-board.step','separator':'film-wide-bridge-separator-trial.step','lower':'wider-right-support-lower-trial.step','upper':'tab-clearance-upper-trial.step','battery':'offset-pack-assembly-trial.step'}
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
rows=[];models=[]
for z in [-1.55,-1.45]:
 for lane in [-1.5,-2.,-2.5]:
  for second_x in [13.,14.]:
   paths=[[(8.1,-.5,-1.72),(10.1,lane,z),(14.48,-1.055,z)],[(9.9,-.5,-1.72),(second_x,-.4,z),(16.13,-1.055,z)]]
   row={'z_mm':z,'first_lane_y_mm':lane,'second_midpoint_x_mm':second_x,'radius_mm':1.5,'paths_mm':paths}
   try:
    pairs=[rounded(p,1.5) for p in paths];wires=[p[0] for p in pairs];shape=cq.Compound.makeCompound(wires)
    gaps={k:shape.distance(v) for k,v in shapes.items()}; mutual=wires[0].distance(wires[1])
    row.update(status='EVALUATED',valid=all(w.isValid() for w in wires),clearance_mm=gaps,wire_to_wire_mm=mutual,minimum_mm=min([*gaps.values(),mutual]),lengths_mm=[p[1] for p in pairs]);models.append((len(rows),shape))
   except ValueError as e:row.update(status='RADIUS_DOES_NOT_FIT',reason=str(e))
   rows.append(row)
chosen=max(models,key=lambda x:rows[x[0]]['minimum_mm']) if models else None
if chosen:
 a=cq.Assembly(name='film_separated_lanes');a.add(shapes['board'],name='board',color=cq.Color('#328866'));a.add(shapes['separator'],name='separator',color=cq.Color('#ddbb55'));a.add(chosen[1],name='wires',color=cq.Color('#bb44aa'));a.export(str(O/'film-wire-separated-study.step'))
out={'status':'PARTIAL_SEPARATED_LANES_NOT_QUALIFIED','rows':rows,'displayed_row':chosen[0] if chosen else None,'sources_sha256':{k:hashlib.sha256((O/v).read_bytes()).hexdigest() for k,v in files.items()},'limits':['Nominal geometry only; no fabrication or assembly tolerances.','Joint exit center Z-1.72 is within 0.8mm joint envelope but actual solder/film transition and pad approach not included.','Bend radius1.5mm remains an engineering hypothesis, not manufacturer qualification.','No strain relief or electrical substitution yet.']}
(O/'film-wire-separated-review.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(rows[chosen[0]] if chosen else out,indent=2))
