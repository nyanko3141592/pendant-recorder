"""Exploded visualization of existing studies; not a final assembly instruction."""
from pathlib import Path
import hashlib,json,cadquery as cq
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.colors import to_rgb
from mpl_toolkits.mplot3d.art3d import Poly3DCollection
O=Path(__file__).resolve().parent
specs=[('Upper case study','clearance-hook-upper-trial.step',(0,0,16),'#a0aab8'),('Candidate PCB','buttonless-candidate-integrated-board.step',(0,0,6),'#328866'),('Separator study','battery-separator-study.step',(0,0,-5),'#d8b84e'),('Battery maximum envelope','dtp401525-xe-pack-max.step',(8.25,-13.5,-19),'#6daed5'),('Lower case study','closure-acoustic-slim-lower-case-trial.step',(0,0,-25),'#a0aab8')]
a=cq.Assembly(name='exploded_review_only');fig=plt.figure(figsize=(11,10));ax=fig.add_subplot(111,projection='3d');sources=[]
for i,(name,file,offset,color) in enumerate(specs):
 source=O/file;s=cq.importers.importStep(str(source)).val().translate(offset)
 assert s.isValid()
 a.add(s,name='layer_'+str(i),color=cq.Color(color))
 triangles=[]
 for solid in s.Solids():
  points,faces=solid.tessellate(.15);v=[(p.x,p.y,p.z)for p in points]
  triangles.extend([[v[j]for j in face]for face in faces])
 normals=np.cross(np.array(triangles)[:,1]-np.array(triangles)[:,0],np.array(triangles)[:,2]-np.array(triangles)[:,0])
 lengths=np.linalg.norm(normals,axis=1); normals/=np.maximum(lengths[:,None],1e-12)
 light=np.array([.3,-.4,.85]);light/=np.linalg.norm(light)
 shades=.58+.42*np.abs(normals@light)
 colors=np.array(to_rgb(color))[None,:]*shades[:,None]
 ax.add_collection3d(Poly3DCollection(triangles,facecolors=colors,edgecolors='none',alpha=1))
 b=s.BoundingBox();ax.text2D(.76,[.78,.65,.49,.36,.20][i],name,transform=ax.transAxes,fontsize=9,bbox=dict(facecolor='white',edgecolor='none',alpha=.9))
 sources.append({'file':file,'sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'display_translation_mm':offset})
a.export(str(O/'buttonless-candidate-exploded-review.step'))
ax.set_xlim(-2,42);ax.set_ylim(-30,2);ax.set_zlim(-34,24);ax.set_box_aspect((44,32,58));ax.view_init(elev=17,azim=-57);ax.set_axis_off()
fig.suptitle('Buttonless candidate geometry — NOT final assembly',fontsize=17)
fig.text(.06,.06,'Original leads and mating plug omitted. Fasteners omitted. Thermal contact and swelling clearance unresolved.\nDisplay spacing is artificial; this drawing does not establish an assembly sequence or finished size.',fontsize=10)
fig.savefig(O/'buttonless-candidate-exploded-review.png',dpi=160);plt.close(fig)
r={'status':'EXPLODED_CANDIDATE_STUDY_NOT_FINAL_MODEL','sources':sources,'pcb_geometry_source':'buttonless-candidate-integrated-review.json; current candidate PCB with verified retained envelope poses','limitations':['Original leads and mating plug absent','No proven assembly sequence','Final case size and closure unresolved','Thermal interface and battery swelling allowance unresolved','Some component bodies are approximate envelopes'],'outputs':{n:hashlib.sha256((O/n).read_bytes()).hexdigest()for n in ['buttonless-candidate-exploded-review.step','buttonless-candidate-exploded-review.png']}}
(O/'buttonless-candidate-exploded-review.json').write_text(json.dumps(r,indent=2)+'\n');print('Created exploded STEP and image from existing study geometry.')
