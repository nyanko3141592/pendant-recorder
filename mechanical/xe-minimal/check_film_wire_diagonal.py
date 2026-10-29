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
for z in [-1.65,-1.4]:
 for offset in [1.,2.]:
  for y in [-.5,-.7,-.9,-1.5]:
   paths=[[(8.1,-.5,-1.92),(8.1+offset,y,z),(14.48,-1.055,z)],[(9.9,-.5,-1.92),(9.9+offset,y+.5,z),(16.13,-1.055,z)]]
   for radius in [.5,1.,1.5]:
    row={'z_mm':z,'midpoint_offset_x_mm':offset,'midpoint_y_mm':y,'radius_mm':radius,'paths_mm':paths}
    try:
     pairs=[rounded(p,radius) for p in paths]; wires=[x[0] for x in pairs]; combined=cq.Compound.makeCompound(wires)
     row.update(status='EVALUATED',valid=all(x.isValid() for x in wires),lengths_mm=[x[1] for x in pairs],overlap_mm3={k:combined.intersect(v).Volume() for k,v in shapes.items()},wire_to_wire_overlap_mm3=wires[0].intersect(wires[1]).Volume());models.append((len(rows),combined))
    except ValueError as e: row.update(status='RADIUS_DOES_NOT_FIT',reason=str(e))
    rows.append(row)
clear=[(i,s) for i,s in models if rows[i]['valid'] and max(rows[i]['overlap_mm3'].values())<1e-8 and rows[i]['wire_to_wire_overlap_mm3']<1e-8]
chosen=max(clear,key=lambda pair:rows[pair[0]]['radius_mm']) if clear else None
if chosen:
 chosen_wires=[rounded(p,rows[chosen[0]]['radius_mm'])[0] for p in rows[chosen[0]]['paths_mm']]
 rows[chosen[0]]['minimum_clearance_mm']={k:chosen[1].distance(v) for k,v in shapes.items()}
 rows[chosen[0]]['wire_to_wire_distance_mm']=chosen_wires[0].distance(chosen_wires[1])
 a=cq.Assembly(name='film_diagonal_wire_candidate');a.add(shapes['board'],name='existing_board',color=cq.Color('#328866'));a.add(shapes['separator'],name='separator',color=cq.Color('#ddbb55'));a.add(chosen[1],name='rounded_wires',color=cq.Color('#bb44aa'));a.export(str(O/'film-wire-diagonal-study.step'))
out={'status':'PARTIAL_DIAGONAL_ROUTE_NOT_QUALIFIED','diameter_mm':.31,'rows':rows,'clear_rows':[i for i,s in clear],'displayed_row':chosen[0] if chosen else None,'sources_sha256':{k:hashlib.sha256((O/v).read_bytes()).hexdigest() for k,v in files.items()},'limits':['Radii are geometric hypotheses, manufacturer allowable radius unverified.','Joint exit tangent and pad solder approach remain unconnected; this is a partial corridor.','No strain relief, tolerance, slack, assembly path or electrical substitution.']}
(O/'film-wire-diagonal-review.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps({'clear_rows':out['clear_rows'],'chosen':rows[chosen[0]] if chosen else None},indent=2))
