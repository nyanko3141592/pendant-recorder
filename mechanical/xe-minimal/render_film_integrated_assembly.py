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
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d.art3d import Poly3DCollection
from matplotlib.patches import Patch
review=json.loads((O/'film-wire-pad-connected-review.json').read_text());row=review['rows'][review['displayed_row']]
wires=cq.Compound.makeCompound([rounded(p,row['radius_mm'])[0] for p in row['paths_mm']])
film=cq.Workplane('XY').box(4.1,26,.5).translate((9,-13.5,-2.07)).val()
joints=cq.Compound.makeCompound([cq.Workplane('XY').box(.9,3,.8).translate((x,-2,-1.92)).val() for x in [8.1,9.9]])
solder=cq.Compound.makeCompound([cq.Workplane('XY').box(.6,.75,.25).translate((x,-1.055,-.125)).val() for x in [14.48,16.13]])
parts=[('PCB',shapes['board'],'#328866'),('Separator',shapes['separator'],'#d8b84e'),('Film sensor envelope',film,'#ef9850'),('Insulated joint budgets',joints,'#af72bd'),('Wire candidate',wires,'#d73e74'),('Solder budgets',solder,'#888888')]
a=cq.Assembly(name='film_sensor_integrated_study')
for name,shape,color in parts:a.add(shape,name=name.replace(' ','_'),color=cq.Color(color))
for name in ['lower','upper','battery']:a.add(shapes[name],name=name,color=cq.Color('#a0aab8'))
a.export(str(O/'film-integrated-assembly-study.step'))
fig=plt.figure(figsize=(13,7))
for n,(elev,azim,title) in enumerate([(-70,-90,'Underside: PCB + sensor + wiring'),(-15,-65,'Side: separator and component clearance')]):
 ax=fig.add_subplot(1,2,n+1,projection='3d')
 for name,shape,color in parts:
  triangles=[]
  for solid in shape.Solids():
   vertices,faces=solid.tessellate(.08);v=[(p.x,p.y,p.z) for p in vertices];triangles.extend([[v[j] for j in face] for face in faces])
  ax.add_collection3d(Poly3DCollection(triangles,facecolors=color,edgecolors='none',alpha=.35 if name=='PCB' else 1.))
 ax.set(xlim=(0,24),ylim=(-28,1),zlim=(-3,3));ax.set_box_aspect((24,29,6));ax.view_init(elev=elev,azim=azim);ax.set_title(title);ax.set_axis_off()
fig.legend(handles=[Patch(color=c,label=n) for n,s,c in parts],loc='lower center',ncol=3)
fig.suptitle('Film sensor integration study — NOT production-ready')
fig.text(.04,.09,'Case/battery omitted in views for visibility; present in STEP. Original battery leads/plug absent.\nFilm is a conservative box; joints are space budgets. Strain relief and sensor-to-wire transitions unresolved.',fontsize=9)
fig.savefig(O/'film-integrated-assembly-review.png',dpi=150);plt.close(fig)
r={'status':'INTEGRATED_VISUAL_STUDY_NOT_ASSEMBLY_PROOF','wire_review_sha256':hashlib.sha256((O/'film-wire-pad-connected-review.json').read_bytes()).hexdigest(),'parts':[n for n,s,c in parts],'limits':['Case and battery hidden in PNG, included in STEP.','Original battery leads and mating plug absent.','Film envelope includes exposed leads at uniform thickness; overlap with joint budget is intentional representation, not final geometry.','No strain relief, sensor-side transition, adhesive or full tolerance validation.','No demonstrated assembly sequence.']}
(O/'film-integrated-assembly-review.json').write_text(json.dumps(r,indent=2)+'\n');print('Integrated STEP and PNG generated')
