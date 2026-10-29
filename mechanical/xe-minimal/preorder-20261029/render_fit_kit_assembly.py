"""Render exact packaged CAD tessellation for dummy assembly instructions."""
from pathlib import Path
import cadquery as cq
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d.art3d import Poly3DCollection
p=Path(__file__).resolve().parents[3]/'hardware/xe-minimal/preorder-20261029/release-review-20261029-aligned/mechanical-captured-carrier'
def colors(tris,color):
 n=np.cross(tris[:,1]-tris[:,0],tris[:,2]-tris[:,0]);n/=np.maximum(np.linalg.norm(n,axis=1)[:,None],1e-12)
 light=np.array([.3,-.5,.8]);light/=np.linalg.norm(light)
 shade=.55+.45*np.abs(n@light)
 return np.array(matplotlib.colors.to_rgb(color))[None,:]*shade[:,None]
parts=[('1 Lower case','case-lower.step','#b7c6d5',0),('2 Battery dummy','battery-max-positioned.step','#e6b557',9),('3 Carrier','carrier.step','#dca784',17),('4 PCBA gauge','pcba-max-gauge.step','#65a995',25),('5 Upper case','case-upper.step','#a4b5cc',34)]
fig=plt.figure(figsize=(12,8),facecolor='white');ax=fig.add_subplot(111,projection='3d')
for label,name,color,offset in parts:
 shape=cq.importers.importStep(str(p/name)).val();verts,faces=shape.tessellate(.06,.15)
 points=np.array([[v.x,v.y,v.z+offset] for v in verts]);tris=points[np.array(faces)]
 ax.add_collection3d(Poly3DCollection(tris,facecolors=colors(tris,color),linewidths=0))
 bb=shape.BoundingBox();z=(bb.zmin+bb.zmax)/2+offset
 ax.text2D(.95,.19+.145*parts.index((label,name,color,offset)),label,transform=ax.transAxes,fontsize=11,color='#182c40')
ax.set_xlim(-3,45);ax.set_ylim(-31,7);ax.set_zlim(-10,43);ax.set_box_aspect((48,38,53));ax.view_init(elev=23,azim=-62);ax.set_axis_off()
fig.suptitle('Current fit kit — exploded assembly order',fontsize=19,color='#182c40',y=.97)
fig.text(.06,.08,'Insert in order 1 → 2 → 3 → 4; close with 5.\nExploded Z offsets are for illustration only. STEP/STL/3MF remain 1:1.',fontsize=11)
fig.text(.06,.025,'Dummy fit only • Harness omitted/unverified • No glue, real battery, or physical fit approval',fontsize=10,color='#8a3c28')
fig.savefig(p/'assembly-order.png',dpi=160,bbox_inches='tight');print(p/'assembly-order.png')

fig2=plt.figure(figsize=(7,6),facecolor='white');ax2=fig2.add_subplot(111,projection='3d')
for label,name,color,offset in parts:
 shape=cq.importers.importStep(str(p/name)).val();verts,faces=shape.tessellate(.06,.15)
 points=np.array([[v.x,v.y,v.z] for v in verts]);tris=points[np.array(faces)]
 ax2.add_collection3d(Poly3DCollection(tris,facecolors=colors(tris,color),linewidths=0))
ax2.set_xlim(-3,31);ax2.set_ylim(-31,3);ax2.set_zlim(-9,8);ax2.set_box_aspect((34,34,17));ax2.view_init(elev=25,azim=-62);ax2.set_axis_off()
fig2.suptitle('Closed case — current CAD',fontsize=17)
fig2.text(.1,.06,'30.8 × 30.8 × 14.2 mm nominal envelope\nJoint and harness unresolved; not manufacturing approval.',fontsize=10)
fig2.savefig(p/'assembly-closed.png',dpi=160,bbox_inches='tight')
