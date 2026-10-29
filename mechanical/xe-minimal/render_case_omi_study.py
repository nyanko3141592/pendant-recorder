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
C=json.loads((O/'separator-case-review.json').read_text());w,h,th=C['outer_size_mm']
D=json.loads((ref/'dimension-review.json').read_text());fig,axes=plt.subplots(1,2,figsize=(11,6),layout='constrained');models=[];meshes=[]
for name in ['case-a.step','case-b.step']:
 f=ref/name;r=next(x for x in D['parts'] if x['file']==name);assert sha(f)==r['sha256'];s=cq.importers.importStep(str(f)).val();assert s.isValid();v,t=s.tessellate(.03);xyz=[p.toTuple() for p in v]
 meshes.append((xyz,t))
 models.append({'file':str(f.relative_to(root)),'sha256':sha(f)})
# One shared translation preserves the relative poses in the source files.
points=[p for xyz,_ in meshes for p in xyz]
center=[(min(p[d] for p in points)+max(p[d] for p in points))/2 for d in range(3)]
for xyz,triangles in meshes:
 for ax,dim in zip(axes,[(0,2),(1,2)]):
  polys=[[(xyz[i][dim[0]]-center[dim[0]],xyz[i][dim[1]]-center[dim[1]]) for i in tri] for tri in triangles]
  ax.add_collection(PolyCollection(polys,facecolor='#b8c2cc',edgecolor='none',rasterized=True))
axes[0].add_patch(Rectangle((-w/2,-h/2),w,h,fill=False,edgecolor='#006cc8',lw=2,linestyle='--',label=f'Provisional case: {w:g} x {h:g} mm'))
axes[1].add_patch(Rectangle((-.5*th,-h/2),th,h,fill=False,edgecolor='#006cc8',lw=2,linestyle='--'))
for ax,title in zip(axes,['Front / case envelope overlay','Side / case envelope']):
 ax.set(xlim=(-18,18),ylim=(-19,19),aspect='equal',title=title,xlabel='mm',ylabel='mm');ax.grid(alpha=.17);ax.set_axisbelow(True)
axes[0].legend(loc='lower center',fontsize=8)
fig.suptitle('Provisional case envelope versus Omi public cover STEP files',fontsize=14)
fig.supxlabel('Grey: Omi covers centered together by their combined bounds. Blue: centered provisional case envelope.\nOur envelope includes pack/board/separator but cables, closure and tolerances remain unresolved.\nOmi file assembly/version association remains unconfirmed; wrapper and attachment excluded.',fontsize=9)
for ext in ['png','pdf']:fig.savefig(O/f'case-envelope-vs-omi-covers-study.{ext}',dpi=180)
plt.close(fig)
r={'status':'PROVISIONAL_CASE_COMPARISON_NOT_FIT_APPROVAL','board_sha256':sha(board),'case_envelope_mm':[w,h,th],'omi_sources':models,'source_reference':'reference/omi/mechanical-size-check/dimension-review.json','equal_scale':True,'alignment':'Both envelopes centered. Omi covers translated together, preserving relative source poses; assembled pose remains unconfirmed.','omi_shared_translation_mm':[-x for x in center],'excluded':['Unresolved battery wiring/mated housing','Case closure and tolerance stack','Omi wrapper and attachment'],'figures':['case-envelope-vs-omi-covers-study.png','case-envelope-vs-omi-covers-study.pdf']};(O/'case-envelope-omi-review.json').write_text(json.dumps(r,indent=2)+'\n');print('Rendered comparison',r['case_envelope_mm'])
