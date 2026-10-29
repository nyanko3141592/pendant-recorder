"""Integrated candidate and sampled rigid lowering; cannot certify a continuous path."""
from pathlib import Path
import cadquery as cq,json,hashlib,argparse
from wire_geometry import rounded
parser=argparse.ArgumentParser();parser.add_argument('--tapered',action='store_true');parser.add_argument('--retainer',action='store_true');parser.add_argument('--wide350',action='store_true');args=parser.parse_args()
O=Path(__file__).resolve().parent
prefix='diagonal-tapered-harness' if args.tapered else 'diagonal-harness'
files={'board':'film-integration-integrated-board.step','separator':'diagonal-bridge-separator-trial.step','lower':'diagonal-tray-mounted-lower-trial.step','upper':'tab-clearance-upper-trial.step','battery':'offset-pack-assembly-trial.step'}
if args.tapered:files['lower']='diagonal-tapered-tray-lower-trial.step'
if args.retainer:
 files.update(lower='film-lead-wrap-clearance-lower-trial.step',separator='film-roomier-joint-separator-trial.step');prefix='diagonal-retainer-harness'
manifest_name='film-wide350-integration-candidate.json' if args.wide350 else 'film-current-integration-candidate.json'
output_prefix='film-wide350-integration-design-review' if args.wide350 else 'film-current-integration-design-review'
if args.wide350:files['lower']='film-battery-end-wide-350um-lower-trial.step'
manifest=json.loads((O/manifest_name).read_text())
for item in manifest['artifacts'].values():
 assert hashlib.sha256((O.parent.parent/item['path']).read_bytes()).hexdigest()==item['sha256'], item['path']
files['insulation']='film-sensor-insulation-transition.step'
s={k:cq.importers.importStep(str(O/v)).val() for k,v in files.items()}
def box(w,l,h,x,y,z):return cq.Workplane('XY').box(w,l,h,centered=(True,False,False)).translate((x,y,z)).val()
def pose(q):return q.rotate((0,0,0),(0,0,1),-28).translate((7.6,-25.5,0))
body=pose(box(4.1,22,.5,0,0,-2.32));leads=[pose(box(.7,4,.5,x,22,-2.32)) for x in [-.95,.95]]
joints=[pose(box(.9,3,.8,x,23,-2.32)) for x in [-.9,.9]]
route_path=O/'film-lap-lowered-terminals-review.json';r=json.loads(route_path.read_text())
wires=[]
for row in r['rows']:
 wires += [rounded(row['insulated_centerline_mm'],row['insulated_corner_radii_mm'])[0],rounded(row['bare_centerline_mm'],row['bare_corner_radius_mm'],wire_radius=.075)[0]]
parts={'sensor':cq.Compound.makeCompound([body]+leads),'wires':cq.Compound.makeCompound(wires)}

import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d.art3d import Poly3DCollection
from matplotlib.patches import Patch
assert args.retainer, 'Render current retainer candidate explicitly'
colors={'lower':'#a9b5c1','upper':'#c3ccd5','battery':'#54789c','separator':'#d5ad4f','board':'#27866a','sensor':'#ed8e4f','insulation':'#aa6db2','wires':'#d83f6d'}
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
ax=fig.add_subplot(2,2,1,projection='3d');ax.set_proj_type('ortho')
for name in ['lower','upper']:draw(ax,name)
case_bbox=cq.Compound.makeCompound([s['lower'],s['upper']]).BoundingBox()
case_dims=[case_bbox.xlen,case_bbox.ylen,case_bbox.zlen]
ref=json.loads((O/'offset-stack-dimension-comparison.json').read_text())
refshape=cq.Workplane('XY').circle(12.5).extrude(15).translate((47,-13,-7.72)).val()
vs,fs=refshape.tessellate(.1);v=[(p.x,p.y,p.z) for p in vs]
ax.add_collection3d(Poly3DCollection([[v[j] for j in f] for f in fs],facecolors='#568aa6',edgecolors='none'))
ax.set(xlim=(-3,62),ylim=(-30,3),zlim=(-8,8));ax.set_box_aspect((65,33,16));ax.view_init(25,-65);ax.set_axis_off();ax.set_title('Same scale: recorder candidate / Omi reference envelope')
ax.text2D(.05,.08,'Recorder: '+' x '.join(f'{v:.2f}' for v in case_dims)+' mm',transform=ax.transAxes,fontsize=9);ax.text2D(.05,.02,'Omi reference: D25 x H15 mm*',transform=ax.transAxes,fontsize=9)
ax=fig.add_subplot(2,2,2,projection='3d');ax.set_proj_type('ortho')
for name,z in [('lower',0),('battery',8),('sensor',15),('insulation',15),('wires',15),('separator',15),('board',20),('upper',28)]:draw(ax,name,(0,0,z))
ax.set(xlim=(-3,28),ylim=(-30,3),zlim=(-8,35));ax.set_box_aspect((31,33,43));ax.view_init(22,-60);ax.set_axis_off();ax.set_title('Exploded visualization (not an assembly instruction)')
ax=fig.add_subplot(2,2,3,projection='3d');ax.set_proj_type('ortho')
for name in ['board','separator','sensor','insulation','wires']:draw(ax,name,alpha=.22 if name=='board' else 1)
ax.set(xlim=(0,25),ylim=(-28,1),zlim=(-3,3));ax.set_box_aspect((25,29,6));ax.view_init(-68,-90);ax.set_axis_off();ax.set_title('Underside: retainer + sensor + wire candidates')
ax=fig.add_subplot(2,2,4);ax.axis('off')
ax.text(0,1,'Design review — NOT production-ready',fontsize=16,weight='bold',va='top')
ax.text(0,.86,'Shown: current case, separate battery envelope, PCB,\nseparator with open loading slots, sensor, insulation envelopes and updated wires.\n\nNot modeled: original battery leads and mating plug,\nadhesives and the actual insulation construction. PCB bare wires shown.\n\nPurple = occupied-space budget, not finished insulation.\nStill unverified: axial retention, preassembly with connected\nwires, printed fit, thermal response and 16-hour runtime.\n\n* Omi: official page lists 2.5 x 1.5 cm. D25 x H15 is an\ninterpretation of its round form; axis labels are unspecified.\nThis cylinder is a dimensional reference, not Omi CAD.',fontsize=11,va='top',linespacing=1.6)
fig.legend(handles=[Patch(color=c,label=n) for n,c in colors.items()],loc='lower center',ncol=8)
fig.tight_layout(rect=(0,.04,1,.98));fig.savefig(O/(output_prefix+'.png'),dpi=170);plt.close(fig)
a=cq.Assembly(name='film_current_integration_design_candidate')
for name,q in objects.items():a.add(q,name=name,color=cq.Color(colors[name]))
a.export(str(O/(output_prefix+'.step')))
r={'status':'CURRENT_INTEGRATION_VISUALIZATION_NOT_RELEASE','sources_sha256':{k:hashlib.sha256((O/v).read_bytes()).hexdigest() for k,v in files.items()},'wire_source_sha256':hashlib.sha256(route_path.read_bytes()).hexdigest(),'case_envelope_mm':case_dims,'manifest_sha256':hashlib.sha256((O/manifest_name).read_bytes()).hexdigest(),'omi_reference':ref['omi_reference'],'limits':['Exploded offsets are visual spacing, not a verified assembly path.','Original battery harness omitted.','Film integration circuit candidate shown; no qualified manufacturing release.']}
(O/(output_prefix+'.json')).write_text(json.dumps(r,indent=2)+'\n');print('Rendered current candidate')
