"""Render rebuilt actual-fit Case V3."""
from pathlib import Path
import cadquery as cq
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.colors import to_rgb
from mpl_toolkits.mplot3d.art3d import Poly3DCollection

HERE=Path(__file__).resolve().parent; OUT=HERE/"actual-fit-case-v3"; MECH=HERE.parent
def load(p): return cq.importers.importStep(str(p)).val()
def triangles(shape,tol=.16):
    out=[]
    for solid in shape.Solids():
        pts,faces=solid.tessellate(tol); v=[(p.x,p.y,p.z) for p in pts]
        out.extend([[v[j] for j in f] for f in faces])
    return np.asarray(out)
def add(ax,shape,color,alpha=1):
    t=triangles(shape); n=np.cross(t[:,1]-t[:,0],t[:,2]-t[:,0]); n/=np.maximum(np.linalg.norm(n,axis=1)[:,None],1e-12)
    light=np.array([.3,-.5,.8]); light/=np.linalg.norm(light); shade=.58+.42*np.abs(n@light)
    ax.add_collection3d(Poly3DCollection(t,facecolors=np.array(to_rgb(color))[None,:]*shade[:,None],edgecolors="none",alpha=alpha))
lower=load(OUT/"case-v3-lower.step"); upper=load(OUT/"case-v3-upper.step")
pcb=load(OUT/"actual-populated-pcb.step"); battery=load(MECH/"dtp401525-xe-pack-max.step").translate((8.25,-13.5,-6.62))
fig=plt.figure(figsize=(15,5.4))
for i,(title,e,a,explode) in enumerate([("Wall tunnel / no inner boss",27,-48,False),("4-layer PCB and battery fit",24,-48,True),("USB side / rounded perimeter",20,132,False)],1):
    ax=fig.add_subplot(1,3,i,projection="3d"); add(ax,lower,"#53657d"); add(ax,upper.translate((0,0,9 if explode else 0)),"#cbd5e1",.4 if explode else .9)
    if explode: add(ax,pcb,"#187044"); add(ax,battery,"#397fa8")
    ax.set_xlim(-4,33); ax.set_ylim(-31,5); ax.set_zlim(-9,18); ax.set_box_aspect((37,36,27)); ax.view_init(elev=e,azim=a); ax.set_axis_off(); ax.set_title(title,fontsize=12)
fig.suptitle("HW-V1.4 4-layer + case v3 - corner-wall cord tunnel",fontsize=16)
fig.text(.5,.025,"31.4 x 31.4 x 13.9 mm | no inner cord boss | 27.5 mm PCB + DTP401525-XE",ha="center",fontsize=10)
path=OUT/"case-v3-preview.png"; fig.savefig(path,dpi=180,bbox_inches="tight"); plt.close(fig); print(path)
