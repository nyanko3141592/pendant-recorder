"""Render the canonical case candidate for visual review."""
from pathlib import Path
import cadquery as cq
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.colors import to_rgb
from mpl_toolkits.mplot3d.art3d import Poly3DCollection

HERE=Path(__file__).resolve().parent
MECH=HERE.parent
specs=[
 ("Lower",HERE/"case-lower-v1.step",(0,0,0),"#a8adb6",.35),
 ("Internals",HERE/"integrated-assembly-v1.step",(0,0,0),"#33885e",1),
 ("Upper",HERE/"case-upper-v1.step",(0,0,0),"#c2c6cd",.25),
]
fig=plt.figure(figsize=(9,9));ax=fig.add_subplot(111,projection="3d")
for name,path,offset,color,alpha in specs:
 s=cq.importers.importStep(str(path)).val().translate(offset);tri=[]
 for solid in s.Solids():
  points,faces=solid.tessellate(.22);v=[(p.x,p.y,p.z)for p in points]
  tri.extend([[v[j]for j in face]for face in faces])
 if not tri: continue
 normals=np.cross(np.array(tri)[:,1]-np.array(tri)[:,0],np.array(tri)[:,2]-np.array(tri)[:,0])
 lengths=np.linalg.norm(normals,axis=1);normals/=np.maximum(lengths[:,None],1e-12)
 light=np.array([.3,-.4,.85]);light/=np.linalg.norm(light)
 shade=.58+.42*np.abs(normals@light);colors=np.array(to_rgb(color))[None,:]*shade[:,None]
 ax.add_collection3d(Poly3DCollection(tri,facecolors=colors,edgecolors="none",alpha=alpha))
ax.set_xlim(-2,27);ax.set_ylim(-30,7);ax.set_zlim(-9,7);ax.set_box_aspect((29,37,16));ax.view_init(elev=24,azim=-58);ax.set_axis_off()
fig.suptitle("XE-PROTOTYPE-V1 case candidate — not released",fontsize=15)
fig.text(.06,.045,"26.2 x 33.6 x 12.97 mm complete shell with 2.5 mm cord hole. Canonical PCB + DTP401525-XE + 103JT stack.\nA1 mini slicing passed; physical seam/cord load, fit, acoustic and thermal tests remain.",fontsize=9)
fig.savefig(HERE/"case-candidate-v1.png",dpi=170,bbox_inches="tight");plt.close(fig)
print(HERE/"case-candidate-v1.png")
