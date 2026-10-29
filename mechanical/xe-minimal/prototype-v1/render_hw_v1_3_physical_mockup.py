"""Render the HW-V1.3 physical-size mockup for visual inspection."""
from pathlib import Path
import cadquery as cq
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.colors import to_rgb
from mpl_toolkits.mplot3d.art3d import Poly3DCollection

HERE=Path(__file__).resolve().parent/"hw-v1.3-physical-mockup"
def load(name): return cq.importers.importStep(str(HERE/name)).val()
def triangles(shape,tol=.14):
    out=[]
    for solid in shape.Solids():
        pts,faces=solid.tessellate(tol); v=[(p.x,p.y,p.z) for p in pts]
        out.extend([[v[j] for j in f] for f in faces])
    return np.asarray(out)
def add(ax,shape,color,alpha=1):
    tri=triangles(shape); normals=np.cross(tri[:,1]-tri[:,0],tri[:,2]-tri[:,0]); normals/=np.maximum(np.linalg.norm(normals,axis=1)[:,None],1e-12)
    light=np.array([.35,-.55,.75]); light/=np.linalg.norm(light); shade=.58+.42*np.abs(normals@light)
    colors=np.array(to_rgb(color))[None,:]*shade[:,None]
    ax.add_collection3d(Poly3DCollection(tri,facecolors=colors,edgecolors="none",alpha=alpha))
lower=load("hw-v1.3-case-lower-size-mockup.step"); upper=load("hw-v1.3-case-upper-size-mockup.step")
pcb=load("hw-v1.3-populated-pcb-envelope-gauge.step"); bat=load("dtp401525-xe-max-envelope-gauge.step")
fig=plt.figure(figsize=(15,5.4))
for i,(e,a,title,explode) in enumerate([(28,-52,"Worn envelope",False),(89.8,-90,"Front / 39.7 mm body",False),(24,-52,"Exploded stack",True)],1):
    ax=fig.add_subplot(1,3,i,projection="3d")
    add(ax,lower,"#91a2b7")
    add(ax,upper.translate((0,0,8 if explode else 0)),"#d2dbe5",.45 if explode else .92)
    if explode: add(ax,pcb,"#26734a"); add(ax,bat,"#3d85b5")
    ax.set_xlim(-24,24); ax.set_ylim(-24,27); ax.set_zlim(0,22); ax.set_box_aspect((48,51,22)); ax.view_init(elev=e,azim=a); ax.set_axis_off(); ax.set_title(title)
fig.suptitle("HW-V1.3 case + PCB + DTP401525-XE physical mockup",fontsize=16)
fig.text(.5,.025,"39.7 x 45.3 x 12.5 mm incl. lanyard bail - size/stacking mockup, not final case",ha="center",fontsize=10)
out=HERE/"hw-v1.3-physical-mockup-preview.png"; fig.savefig(out,dpi=180,bbox_inches="tight"); plt.close(fig); print(out)
