from pathlib import Path
import cadquery as cq,numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d.art3d import Poly3DCollection
p=Path(__file__).resolve().parent/'prototype-case'
colors={'case-lower':'#bac8d8','battery-max':'#e7b45f','carrier':'#a2a8b0','pcba-max-gauge':'#408f78','case-upper':'#bdcddd','harness-clearance-envelope':'#db6661','insulation':'#c4af72'}
fig=plt.figure(figsize=(13,8))
for i,items in enumerate([[('case-lower',0),('battery-max',0),('harness-clearance-envelope',0)],[('case-lower',0),('battery-max',9),('insulation',16),('carrier',16),('pcba-max-gauge',23),('case-upper',33)]]):
 ax=fig.add_subplot(1,2,i+1,projection='3d')
 for name,z in items:
  shape=cq.importers.importStep(str(p/(name+'.step'))).val();vs,fs=shape.tessellate(.12);v=np.array([(a.x,a.y,a.z+z) for a in vs]);ax.add_collection3d(Poly3DCollection(v[np.array(fs)],facecolors=colors[name],edgecolors='none',alpha=.7 if name=='case-lower' and i==0 else 1))
 ax.set(xlim=(-3,31),ylim=(-30,10),zlim=(-9,41 if i else 7));ax.set_box_aspect((34,40,50 if i else 16));ax.view_init(55 if i==0 else 24,55);ax.set_axis_off();ax.set_title('Wire bay: 12 / 15 / 18 mm envelope samples' if i==0 else 'Exploded assembly (illustrative spacing)')
fig.suptitle('First-prototype design | 30.8 x 37.5 x 14.2 mm',fontsize=18)
fig.text(.06,.045,'PCB 27.5 mm square / 4 layers / fixed 110 mAh pack\nRed curves = routing clearance, not exact conductor positions. Wire OD / root datum / mating envelope are assumptions.\nCAD + offline slice only; no physical fit, printing, strength or battery-runtime qualification.',fontsize=10)
fig.savefig(p/'assembly-review.png',dpi=160);print(p/'assembly-review.png')
