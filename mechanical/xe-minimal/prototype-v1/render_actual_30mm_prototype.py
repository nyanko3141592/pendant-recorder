"""Render the actual 30 mm prototype assembly and its internal stack."""
from pathlib import Path
import cadquery as cq
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.colors import to_rgb
from mpl_toolkits.mplot3d.art3d import Poly3DCollection

HERE = Path(__file__).resolve().parent
OUT = HERE / "actual-30mm-prototype"
MECH = HERE.parent

def load(path): return cq.importers.importStep(str(path)).val()
def tris(shape, tol=.16):
    result=[]
    for solid in shape.Solids():
        pts, faces=solid.tessellate(tol)
        verts=[(p.x,p.y,p.z) for p in pts]
        result.extend([[verts[j] for j in f] for f in faces])
    return np.asarray(result)
def add(ax, shape, color, alpha=1):
    t=tris(shape); n=np.cross(t[:,1]-t[:,0],t[:,2]-t[:,0])
    n/=np.maximum(np.linalg.norm(n,axis=1)[:,None],1e-12)
    light=np.array([.3,-.5,.8]); light/=np.linalg.norm(light)
    shade=.58+.42*np.abs(n@light)
    rgb=np.array(to_rgb(color))[None,:]*shade[:,None]
    ax.add_collection3d(Poly3DCollection(t,facecolors=rgb,edgecolors="none",alpha=alpha))

lower=load(OUT/"case-lower-corner-cord.step")
upper=load(OUT/"case-upper-rounded.step")
pcb=load(OUT/"actual-populated-pcb-complete.step")
battery=load(MECH/"dtp401525-xe-pack-max.step").translate((8.25,-13.5,-6.62))

fig=plt.figure(figsize=(15,5.4))
views=[("Closed 29.9 x 30.0 mm",28,-48,False),
       ("Actual PCB + fixed battery",24,-48,True),
       ("Corner cord tunnel / USB opposite",82,-90,False)]
for i,(title,elev,azim,exploded) in enumerate(views,1):
    ax=fig.add_subplot(1,3,i,projection="3d")
    add(ax,lower,"#66778d")
    add(ax,upper.translate((0,0,9 if exploded else 0)),"#cbd4df",.38 if exploded else .88)
    if exploded:
        add(ax,pcb,"#187044"); add(ax,battery,"#397fa8")
    ax.set_xlim(-3,32); ax.set_ylim(-31,5); ax.set_zlim(-9,18)
    ax.set_box_aspect((35,36,27)); ax.view_init(elev=elev,azim=azim)
    ax.set_axis_off(); ax.set_title(title,fontsize=12)
fig.suptitle("HW-V1.4 EVT actual-assembly 30 mm prototype",fontsize=16)
fig.text(.5,.025,"Canonical 27.5 mm populated PCB | DTP401525-XE 15.5 x 27 x 4.2 mm max body | 2.2 mm integral corner cord tunnel",ha="center",fontsize=10)
path=OUT/"actual-30mm-prototype-preview.png"
fig.savefig(path,dpi=180,bbox_inches="tight"); plt.close(fig); print(path)
