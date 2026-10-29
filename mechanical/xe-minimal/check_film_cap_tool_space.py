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
for glue in [0,.05,.1]:
 for tool_width,tool_height in [(.8,.6),(1.,.8),(1.2,1.)]:
  # Box behind cap's front face pushes it from+Y. Dimensions are hypothetical tip budgets.
  center_z=(bb.zmin+bb.zmax)/2+glue;center_x=(bb.xmin+bb.xmax)/2
  cap_sweep=cq.Workplane('XY').box(bb.xlen,bb.ylen+4,bb.zlen,centered=(False,False,False)).translate((bb.xmin,bb.ymin,bb.zmin+glue)).val()
  tip_sweep=cq.Workplane('XY').box(tool_width,6,tool_height,centered=(True,False,True)).translate((center_x,bb.ymax,center_z)).val()
  obstacles={'board':shapes['board'],'guide':guide,'wire':wires}
  rows.append({'assumed_glue_layer_mm':glue,'hypothetical_pusher_tip_cross_section_mm':[tool_width,tool_height],'cap_sweep_overlap_mm3':{k:cap_sweep.intersect(v).Volume() for k,v in obstacles.items()},'tool_sweep_overlap_mm3':{k:tip_sweep.intersect(v).Volume() for k,v in obstacles.items()}})
r={'status':'ASSEMBLY_TOOL_SPACE_BUDGET_NOT_SELECTED_TOOL','rows':rows,'sources_sha256':{f:hashlib.sha256((O/f).read_bytes()).hexdigest() for f in ['film-common-guide-cap-trial.step','film-common-guide-separator-trial.step','film-wire-pad-connected-review.json']},'limits':['Hypothetical rectangular pusher, not a selected tweezers or assembly tool.','A pusher does not grip or position the cap before insertion; handling fixture remains required.','Glue height translates the cap only; no squeeze-out or bond-area strength model.','Case and battery are absent during this seller-only operation.','No pull retention or assembly tolerance qualification.']}
(O/'film-cap-tool-space-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(rows,indent=2))
