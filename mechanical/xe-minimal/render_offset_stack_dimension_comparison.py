"""Equal-scale dimensional comparison; Omi reference is inferred, not authentic CAD."""
from pathlib import Path
import cadquery as cq,json,hashlib
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle,Circle
O=Path(__file__).resolve().parent
reference=json.loads((O/'omi-size-conflict-review.json').read_text())['official_reference']
files=['thickness-clearance-upper-trial.step','offset-pack-lower-trial.step']
shapes=[cq.importers.importStep(str(O/f)).val() for f in files]
b=cq.Compound.makeCompound(shapes).BoundingBox();w,d,h=b.xlen,b.ylen,b.zlen
omi_d,omi_h=[v*10 for v in reference['published_size_cm']]
fig,axes=plt.subplots(1,2,figsize=(12,6))
for ax,title in zip(axes,['Top view — identical mm scale','Side view — identical mm scale']):
 ax.set_aspect('equal');ax.set_xlim(-20,65);ax.set_ylim(-22,22);ax.grid(alpha=.2);ax.set_xlabel('mm');ax.set_ylabel('mm');ax.set_title(title)
axes[0].add_patch(Rectangle((-w/2,-d/2),w,d,facecolor='#539dbe',alpha=.65));axes[0].add_patch(Circle((43,0),omi_d/2,facecolor='#a5a8ad',alpha=.65))
axes[1].add_patch(Rectangle((-w/2,-h/2),w,h,facecolor='#539dbe',alpha=.65));axes[1].add_patch(Rectangle((43-omi_d/2,-omi_h/2),omi_d,omi_h,facecolor='#a5a8ad',alpha=.65))
for ax in axes:
 ax.text(0,-19,f'Case study\n{w:.1f} × {d:.1f} × {h:.2f} mm',ha='center',fontsize=10)
 ax.text(43,-19,f'Omi reference\nØ{omi_d:g} × {omi_h:g} mm',ha='center',fontsize=10)
fig.suptitle('Size comparison — rounded adhesive case study is NOT Omi-size qualified',fontsize=15)
fig.text(.06,.06,'Omi official page: 2.5 × 1.5 cm; diameter/thickness interpretation is inferred.\nBlue is the case bounding envelope. Leads, mating housing, closure and production tolerances are unresolved.',fontsize=10)
fig.subplots_adjust(bottom=.22,top=.86,wspace=.22)
fig.savefig(O/'offset-stack-dimension-comparison.png',dpi=160);plt.close(fig)
a=cq.Assembly(name='dimension_comparison_not_final_product')
for i,s in enumerate(shapes):a.add(s.translate((-(b.xmin+b.xmax)/2,-(b.ymin+b.ymax)/2,-b.zmin)),name='case_'+str(i),color=cq.Color('#539dbe'))
omi=cq.Workplane('XY').circle(omi_d/2).extrude(omi_h).val().translate((43,0,0));a.add(omi,name='inferred_omi_reference_cylinder',color=cq.Color('#a5a8ad'));a.export(str(O/'offset-stack-dimension-comparison.step'))
r={'status':'DIMENSIONAL_COMPARISON_NOT_FINAL_PRODUCT','case_envelope_mm':[w,d,h],'omi_reference':reference,'omi_cylinder_diameter_height_mm':[omi_d,omi_h],'case_sources':{f:hashlib.sha256((O/f).read_bytes()).hexdigest() for f in files},'equal_scale':True,'comparison_offset_mm':43,'case_bounding_box_volume_mm3':w*d*h,'omi_reference_cylinder_volume_mm3':omi.Volume(),'case_bounding_box_to_omi_cylinder_ratio':w*d*h/omi.Volume(),'ratio_limit':'Bounding box versus ideal cylinder only; neither actual material volume nor final device volume','unresolved':['Original leads and mating housing','Closure and manufacturing tolerance','Thermal contact and swelling','16h runtime'],'outputs':['offset-stack-dimension-comparison.png','offset-stack-dimension-comparison.step']}
(O/'offset-stack-dimension-comparison.json').write_text(json.dumps(r,indent=2)+'\n');print(r['case_envelope_mm'])
