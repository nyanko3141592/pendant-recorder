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
source=O/'film-wire-pad-connected-review.json';d=json.loads(source.read_text());row=d['rows'][d['displayed_row']]
wires=cq.Compound.makeCompound([rounded(p,row['radius_mm'])[0] for p in row['paths_mm']])
guide=cq.importers.importStep(str(O/'film-common-guide-separator-trial.step')).val();cap=cq.importers.importStep(str(O/'film-common-guide-cap-trial.step')).val()
bb=cap.BoundingBox()
# Exact rectangular swept volume for cap descending from2mm above its final location.
sweep=cq.Workplane('XY').box(bb.xlen,bb.ylen,bb.zlen+2,centered=(False,False,False)).translate((bb.xmin,bb.ymin,bb.zmin)).val()
checks={'wire_guide_overlap_mm3':wires.intersect(guide).Volume(),'wire_cap_overlap_mm3':wires.intersect(cap).Volume(),'wire_guide_distance_mm':wires.distance(guide),'wire_cap_distance_mm':wires.distance(cap),'cap_board_distance_mm':cap.distance(shapes['board']),'cap_descent_wire_overlap_mm3':sweep.intersect(wires).Volume(),'cap_descent_board_overlap_mm3':sweep.intersect(shapes['board']).Volume()}
r={'status':'CAP_CLEARANCE_AND_DESCENT_SCREEN_NOT_ASSEMBLY_APPROVAL','checks':checks,'cap_descent_start_offset_mm':2,'sources_sha256':{f:hashlib.sha256((O/f).read_bytes()).hexdigest() for f in ['film-wire-pad-connected-review.json','film-common-guide-separator-trial.step','film-common-guide-cap-trial.step','film-sensor-depopulated-board-study.step']},'limits':['Exact rectangular cap sweep covers only one vertical insertion path.','If PCB blocks descent, install cap before lowering PCB, requiring a separate full assembly sequence check.','No glue thickness, placement tolerance, flex/slack, adhesion or strain-relief qualification.']}
(O/'film-common-guide-clearance-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
