"""Integrated candidate and sampled rigid lowering; cannot certify a continuous path."""
from pathlib import Path
import cadquery as cq,json,hashlib,argparse
from wire_geometry import rounded
parser=argparse.ArgumentParser();parser.add_argument('--tapered',action='store_true');parser.add_argument('--retainer',action='store_true');args=parser.parse_args()
O=Path(__file__).resolve().parent
prefix='diagonal-tapered-harness' if args.tapered else 'diagonal-harness'
files={'board':'film-sensor-depopulated-board-study.step','separator':'diagonal-bridge-separator-trial.step','lower':'diagonal-tray-mounted-lower-trial.step','upper':'tab-clearance-upper-trial.step','battery':'offset-pack-assembly-trial.step'}
if args.tapered:files['lower']='diagonal-tapered-tray-lower-trial.step'
if args.retainer:
 files.update(lower='diagonal-recessed-cap-lower-trial.step',separator='diagonal-integral-retainer-separator-trial.step');prefix='diagonal-retainer-harness'
s={k:cq.importers.importStep(str(O/v)).val() for k,v in files.items()}
def box(w,l,h,x,y,z):return cq.Workplane('XY').box(w,l,h,centered=(True,False,False)).translate((x,y,z)).val()
def pose(q):return q.rotate((0,0,0),(0,0,1),-28).translate((7.6,-25.5,0))
body=pose(box(4.1,22,.5,0,0,-2.32));leads=[pose(box(.7,4,.5,x,22,-2.32)) for x in [-.95,.95]]
joints=[pose(box(.9,3,.8,x,23,-2.32)) for x in [-.9,.9]]
route_path=O/'diagonal-wire-offset-overpass-review.json';r=json.loads(route_path.read_text());chosen=r['rows'][r['selected_row']]
wires=[rounded(p,rad)[0] for p,rad in zip(chosen['paths_mm'],chosen['radii_mm'])]
parts={'sensor':cq.Compound.makeCompound([body]+leads),'joints':cq.Compound.makeCompound(joints),'wires':cq.Compound.makeCompound(wires)}

import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d.art3d import Poly3DCollection
from matplotlib.patches import Patch
assert args.retainer, 'Render current retainer candidate explicitly'
colors={'lower':'#a9b5c1','upper':'#c3ccd5','battery':'#54789c','separator':'#d5ad4f','board':'#27866a','sensor':'#ed8e4f','joints':'#aa6db2','wires':'#d83f6d'}
objects={**s,**parts}
mesh={}
for name,shape in objects.items():
 tris=[]
 for solid in shape.Solids():
  vs,fs=solid.tessellate(.1);v=[(p.x,p.y,p.z) for p in vs]
  tris.extend([[v[j] for j in f] for f in fs])
 mesh[name]=np.array(tris)
def draw(ax,name,offset=(0,0,0),alpha=1):
 ax.add_collection3d(Poly3DCollection(mesh[name]+np.array(offset),facecolors=colors[name],edgecolors='none',alpha=alpha))
fig=plt.figure(figsize=(15,10))
ax=fig.add_subplot(2,2,1,projection='3d')
for name in ['lower','upper']:draw(ax,name)
ref=json.loads((O/'offset-stack-dimension-comparison.json').read_text())
refshape=cq.Workplane('XY').circle(12.5).extrude(15).translate((47,-13,-7.72)).val()
vs,fs=refshape.tessellate(.1);v=[(p.x,p.y,p.z) for p in vs]
ax.add_collection3d(Poly3DCollection([[v[j] for j in f] for f in fs],facecolors='#568aa6',edgecolors='none'))
ax.set(xlim=(-3,62),ylim=(-30,3),zlim=(-8,8));ax.set_box_aspect((65,33,16));ax.view_init(25,-65);ax.set_axis_off();ax.set_title('Same scale: recorder candidate / Omi reference envelope')
ax.text(10,-28,-8,'26.2 x 29.6 x 12.97 mm',fontsize=9);ax.text(47,-28,-8,'D25 x H15 mm*',fontsize=9)
ax=fig.add_subplot(2,2,2,projection='3d')
for name,z in [('lower',0),('battery',8),('sensor',15),('joints',15),('wires',15),('separator',15),('board',20),('upper',28)]:draw(ax,name,(0,0,z))
ax.set(xlim=(-3,28),ylim=(-30,3),zlim=(-8,35));ax.set_box_aspect((31,33,43));ax.view_init(22,-60);ax.set_axis_off();ax.set_title('Exploded visualization (not an assembly instruction)')
ax=fig.add_subplot(2,2,3,projection='3d')
for name in ['board','separator','sensor','joints','wires']:draw(ax,name,alpha=.22 if name=='board' else 1)
ax.set(xlim=(0,25),ylim=(-28,1),zlim=(-3,3));ax.set_box_aspect((25,29,6));ax.view_init(-68,-90);ax.set_axis_off();ax.set_title('Underside: retainer + sensor + wire candidates')
ax=fig.add_subplot(2,2,4);ax.axis('off')
ax.text(0,1,'Design review — NOT production-ready',fontsize=16,weight='bold',va='top')
ax.text(0,.86,'Shown: current case, separate battery envelope, PCB,\nseparator with integral retainer, sensor and wire budgets.\n\nNot modeled: original battery leads and mating plug,\nactual solder/insulation transitions, adhesives.\n\nStill unverified: axial retention, preassembly with connected\nwires, printed fit, thermal response and 16-hour runtime.\n\n* Omi: official page lists 2.5 x 1.5 cm. D25 x H15 is an\ninterpretation of its round form; axis labels are unspecified.\nThis cylinder is a dimensional reference, not Omi CAD.',fontsize=11,va='top',linespacing=1.6)
fig.legend(handles=[Patch(color=c,label=n) for n,c in colors.items()],loc='lower center',ncol=8)
fig.tight_layout(rect=(0,.04,1,.98));fig.savefig(O/'diagonal-retainer-design-review.png',dpi=170);plt.close(fig)
a=cq.Assembly(name='current_retainer_design_candidate')
for name,q in objects.items():a.add(q,name=name,color=cq.Color(colors[name]))
a.export(str(O/'diagonal-retainer-design-review.step'))
r={'status':'CURRENT_CANDIDATE_VISUALIZATION_NOT_RELEASE','sources_sha256':{k:hashlib.sha256((O/v).read_bytes()).hexdigest() for k,v in files.items()},'wire_source_sha256':hashlib.sha256(route_path.read_bytes()).hexdigest(),'omi_reference':ref['omi_reference'],'limits':['Exploded offsets are visual spacing, not a verified assembly path.','Original battery harness omitted.','No adopted film thermistor circuit or qualified manufacturing release.']}
(O/'diagonal-retainer-design-review.json').write_text(json.dumps(r,indent=2)+'\n');print('Rendered current candidate')
