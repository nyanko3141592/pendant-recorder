from pathlib import Path
import cadquery as cq,numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d.art3d import Poly3DCollection
p=Path(__file__).resolve().parent/'retained-battery-case'
colors={'case-lower':'#9bb0c2','battery-max-positioned':'#e4ae58','separator':'#b8bdc4','pcba-dummy':'#3a9879','case-upper':'#aabed0'}
fig=plt.figure(figsize=(12,7))
for i,items in enumerate([[('case-lower',0),('battery-max-positioned',0)],[('case-lower',0),('battery-max-positioned',7),('separator',11),('pcba-dummy',15),('case-upper',24)]]):
 ax=fig.add_subplot(1,2,i+1,projection='3d')
 for name,z in items:
  shape=cq.importers.importStep(str(p/(name+'.step'))).val();vs,fs=shape.tessellate(.18);v=np.array([(a.x,a.y,a.z+z) for a in vs]);ax.add_collection3d(Poly3DCollection(v[np.array(fs)],facecolors=colors[name],edgecolors='none'))
 ax.set(xlim=(-2,30),ylim=(-30,3),zlim=(-8,32 if i else 7));ax.set_box_aspect((32,33,40 if i else 15));ax.view_init(50 if i==0 else 25,-60);ax.set_axis_off();ax.set_title('Battery seat and lateral guides' if i==0 else 'Exploded view: spacing is illustrative')
fig.suptitle('Case candidate: 30.8 x 30.8 x 14.2 mm — NOT RELEASED')
fig.text(.05,.04,'0.5 mm reserved above maximum battery; swelling sufficiency unqualified.\nSeparator capture and factory harness route remain unfinished. No physical printing or testing.',fontsize=11)
fig.savefig(p/'review.png',dpi=150);print(p/'review.png')
