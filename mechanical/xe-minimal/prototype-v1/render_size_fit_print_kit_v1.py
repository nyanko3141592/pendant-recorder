"""Render the one-job dimensional print kit for a quick visual check."""
from pathlib import Path
import cadquery as cq
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.colors import to_rgb
from mpl_toolkits.mplot3d.art3d import Poly3DCollection

HERE = Path(__file__).resolve().parent

def triangles(shape, tolerance=.15):
    out=[]
    for solid in shape.Solids():
        points, faces = solid.tessellate(tolerance)
        vertices=[(p.x,p.y,p.z) for p in points]
        out.extend([[vertices[j] for j in face] for face in faces])
    return np.asarray(out)

def add(ax, shape, color):
    tri=triangles(shape)
    normals=np.cross(tri[:,1]-tri[:,0],tri[:,2]-tri[:,0])
    normals/=np.maximum(np.linalg.norm(normals,axis=1)[:,None],1e-12)
    light=np.array([.35,-.55,.75]); light/=np.linalg.norm(light)
    shade=.58+.42*np.abs(normals@light)
    colors=np.array(to_rgb(color))[None,:]*shade[:,None]
    ax.add_collection3d(Poly3DCollection(tri,facecolors=colors,edgecolors="none"))

shape=cq.importers.importStep(str(HERE/"hw-v1-size-fit-print-kit-v1.step")).val()
fig=plt.figure(figsize=(10,7)); ax=fig.add_subplot(111,projection="3d")
add(ax,shape,"#7fa3bd")
bb=shape.BoundingBox(); ax.set_xlim(bb.xmin,bb.xmax); ax.set_ylim(bb.ymin,bb.ymax); ax.set_zlim(bb.zmin,bb.zmax)
ax.set_box_aspect((bb.xlen,bb.ylen,bb.zlen)); ax.view_init(elev=32,azim=-58); ax.set_axis_off()
ax.set_title("HW-V1.0 size-fit print kit — case / PCB gauge / battery gauge",fontsize=14)
fig.text(.5,.04,"One 85.5 × 67.6 mm plate · four removable parts · dimensional check only",ha="center",fontsize=10)
out=HERE/"hw-v1-size-fit-print-kit-v1-preview.png"; fig.savefig(out,dpi=180,bbox_inches="tight"); plt.close(fig)
print(out)
