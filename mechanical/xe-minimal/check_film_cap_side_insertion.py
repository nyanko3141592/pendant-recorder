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
rows=[]
for name,delta in [('from_front_y',(0,4,0)),('from_right_x',(15,0,0)),('from_left_x',(-15,0,0)),('from_back_y',(0,-32,0))]:
 lo=[bb.xmin+min(0,delta[0]),bb.ymin+min(0,delta[1]),bb.zmin];size=[bb.xlen+abs(delta[0]),bb.ylen+abs(delta[1]),bb.zlen]
 sweep=cq.Workplane('XY').box(*size,centered=(False,False,False)).translate(tuple(lo)).val()
 rows.append({'path':name,'start_translation_mm':delta,'overlap_mm3':{'board':sweep.intersect(shapes['board']).Volume(),'guide':sweep.intersect(guide).Volume(),'wire':sweep.intersect(wires).Volume()},'scope':'Seller assembly before enclosure/battery installation'})
r={'status':'CAP_SIDE_INSERTION_SCREEN_NOT_ASSEMBLY_APPROVAL','rows':rows,'sources_sha256':{f:hashlib.sha256((O/f).read_bytes()).hexdigest() for f in ['film-wire-pad-connected-review.json','film-common-guide-separator-trial.step','film-common-guide-cap-trial.step','film-sensor-depopulated-board-study.step']},'limits':['Rectangular cap swept without glue, gripper or tool-access envelope.','Exact nominal touching of cap and guide top does not allow glue thickness or print variation.','No axial wire retention, cap fixation strength or full assembly sequence proven.']}
(O/'film-cap-side-insertion-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(rows,indent=2))
