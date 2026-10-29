"""Equal-scale reference-envelope comparison, not Omi released CAD geometry."""
from pathlib import Path
import cadquery as cq,json,hashlib,numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.collections import PolyCollection
from matplotlib.patches import Circle,Rectangle
O=Path(__file__).resolve().parent/'prototype-case'
load=lambda n:cq.importers.importStep(str(O/f'{n}.step')).val()
s=load('case-lower').fuse(load('case-upper'));b=s.BoundingBox();s=s.translate((-(b.xmin+b.xmax)/2,-(b.ymin+b.ymax)/2,-(b.zmin+b.zmax)/2))
ref=cq.Workplane('XY').circle(12.5).extrude(15).val().translate((0,0,-7.5))
a=cq.Assembly(name='equal_scale_reference_not_released_omi_cad');a.add(s,name='prototype',color=cq.Color(.1,.5,.7));a.add(ref.translate((40,0,0)),name='omi_published_size_inferred_cylinder',color=cq.Color(.6,.6,.6));a.save(str(O/'equal-scale-omi-reference.step'))
v,f=s.tessellate(.08);v=np.array([x.toTuple() for x in v]);f=np.array(f)
fig,axs=plt.subplots(1,3,figsize=(12,5),layout='constrained')
for ax,ds,title in zip(axs,[(0,1),(1,2),(0,1)],['Front at equal scale','Side at equal scale','Centered overlay']):
 ax.add_collection(PolyCollection(v[f][:,:,ds],facecolor='#367c9c',edgecolor='none',alpha=.45 if title.startswith('Centered') else 1))
 if ds==(0,1):ax.add_patch(Circle((0,0),12.5,fill=False,color='#e4a348',lw=2))
 else:ax.add_patch(Rectangle((-12.5,-7.5),25,15,fill=False,color='#e4a348',lw=2))
 ax.set(xlim=(-22,22),ylim=(-22,22),aspect='equal',title=title,xlabel='mm',ylabel='mm');ax.grid(alpha=.2)
fig.suptitle('Prototype 30.8 x 37.5 x 14.2 mm / Omi published 2.5 x 1.5 cm')
fig.supxlabel('Orange: interpreted as diameter25 x thickness15 mm; axes and wrapper coverage not specified by Omi.\nBlue: complete prototype shell, including wire bay/cord feature; flexible cord and USB cable excluded.\nOmi product revision / public CAD association unconfirmed. This design is larger in plan; no Omi-size compliance claim.',fontsize=9)
fig.savefig(O/'omi-reference-comparison.png',dpi=160)
(O/'omi-reference.json').write_text(json.dumps({'source':'https://www.omi.me/pages/product','checked_date':'2026-10-29','published_size_cm':[2.5,1.5],'interpretation':'reference cylinder25mm diameter15mm thick, inferred axes; not exact Omi exterior or released CAD','prototype_mm':[b.xlen,b.ylen,b.zlen],'same_scale':True,'prototype_sha256':{n:hashlib.sha256((O/f'{n}.step').read_bytes()).hexdigest() for n in ['case-lower','case-upper']},'includes':'complete case silhouette including local wire bay and cord feature','omi_wrapper_and_attachment_scope':'unknown; no fabricated completeness claim'},indent=2)+'\n')
