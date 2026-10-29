"""Engineering scale comparison, explicitly not complete product size."""
from pathlib import Path
import json,hashlib
import cadquery as cq
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.collections import PolyCollection
from matplotlib.patches import Rectangle
O=Path(__file__).resolve().parent;root=O.parent.parent;ref=root/'reference/omi/mechanical-size-check';I=json.loads((O/'board-inventory.json').read_text());board=root/I['board_path'];sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();assert sha(board)==I['pcb_sha256']
pts=[p for e in I['outline_edges'] for p in [e['start_mm'],e['end_mm']]];w=max(p[0] for p in pts)-min(p[0] for p in pts);h=max(p[1] for p in pts)-min(p[1] for p in pts);th=I['board_thickness_mm']
D=json.loads((ref/'dimension-review.json').read_text());fig,axes=plt.subplots(1,2,figsize=(11,6),layout='constrained');models=[]
for name in ['case-a.step','case-b.step']:
 f=ref/name;r=next(x for x in D['parts'] if x['file']==name);assert sha(f)==r['sha256'];s=cq.importers.importStep(str(f)).val();assert s.isValid();v,t=s.tessellate(.03);xyz=[p.toTuple() for p in v]
 for ax,dim in zip(axes,[(0,2),(1,2)]):
  polys=[[(xyz[i][dim[0]],xyz[i][dim[1]]) for i in tri] for tri in t];ax.add_collection(PolyCollection(polys,facecolor='#b8c2cc',edgecolor='none',rasterized=True))
 models.append({'file':str(f.relative_to(root)),'sha256':sha(f)})
axes[0].add_patch(Rectangle((-w/2,-h/2),w,h,fill=False,edgecolor='#006cc8',lw=2,linestyle='--',label=f'Current bare PCB: {w:g} x {h:g} mm'))
axes[1].add_patch(Rectangle((-.5*th,-h/2),th,h,fill=False,edgecolor='#006cc8',lw=2,linestyle='--'))
for ax,title in zip(axes,['Front / PCB outline overlay','Side / bare board only']):
 ax.set(xlim=(-18,18),ylim=(-19,19),aspect='equal',title=title,xlabel='mm',ylabel='mm');ax.grid(alpha=.17);ax.set_axisbelow(True)
axes[0].legend(loc='lower center',fontsize=8)
fig.suptitle('Design study: current PCB versus Omi public cover STEP files',fontsize=14)
fig.supxlabel('Grey: Omi cover geometry in source coordinates. Blue: centered bare PCB.\nBattery, components, leads and our case are NOT included. This is NOT a finished-product comparison.\nOmi file assembly/version association remains unconfirmed; wrapper and attachment excluded.',fontsize=9)
for ext in ['png','pdf']:fig.savefig(O/f'pcb-vs-omi-covers-study.{ext}',dpi=180)
plt.close(fig)
r={'status':'BARE_PCB_COMPARISON_NOT_FINISHED_PRODUCT','board_sha256':sha(board),'board_nominal_mm':[w,h,th],'omi_sources':models,'source_reference':'reference/omi/mechanical-size-check/dimension-review.json','equal_scale':True,'alignment':'Bare PCB centered at origin for overlay; Omi covers preserve original coordinates. No claimed assembled pose.','excluded':['Battery','PCB components','Battery wiring and connectors','Recorder case','Omi wrapper and attachment'],'figures':['pcb-vs-omi-covers-study.png','pcb-vs-omi-covers-study.pdf']};(O/'pcb-omi-comparison-review.json').write_text(json.dumps(r,indent=2)+'\n');print('Rendered comparison',r['board_nominal_mm'])
