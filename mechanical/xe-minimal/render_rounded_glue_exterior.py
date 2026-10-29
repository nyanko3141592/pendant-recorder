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
specs=[('Rounded upper','rounded-glue-upper-study.step',(0,0,0),'#a0aab8'),('Rounded lower','rounded-glue-lower-study.step',(0,0,0),'#a0aab8')]
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
a.export(str(O/'rounded-glue-exterior-review.step'))
ax.set_xlim(-2,26);ax.set_ylim(-30,2);ax.set_zlim(-9,6);ax.set_box_aspect((28,32,15));ax.view_init(elev=17,azim=-57);ax.set_axis_off()
fig.suptitle('Rounded adhesive case — geometry study',fontsize=17)
fig.text(.06,.06,'26.2 x 29.6 x 12.97 mm. Plan corners R1.5; top/bottom edges R0.4.\nAdhesive, wall strength, wiring fit and assembly remain unqualified.',fontsize=10)
fig.savefig(O/'rounded-glue-exterior-review.png',dpi=160);plt.close(fig)
r={'status':'ASSEMBLED_ADHESIVE_CASE_GEOMETRY_STUDY','sources':sources,'limitations':['Original leads and mating plug absent','No proven assembly sequence','Final case size and closure unresolved','Thermal interface and battery swelling allowance unresolved','Some component bodies are approximate envelopes'],'outputs':{n:hashlib.sha256((O/n).read_bytes()).hexdigest()for n in ['rounded-glue-exterior-review.step','rounded-glue-exterior-review.png']}}
(O/'rounded-glue-exterior-review.json').write_text(json.dumps(r,indent=2)+'\n');print('Created assembled exterior STEP and image.')
