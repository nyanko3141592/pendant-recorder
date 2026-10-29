from pathlib import Path
import cadquery as cq,json,hashlib
import matplotlib;matplotlib.use('Agg')
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d.art3d import Poly3DCollection
O=Path(__file__).resolve().parent;f=O/'pcb-partial-with-body-envelopes.step';s=cq.importers.importStep(str(f)).val();assert s.isValid();fig=plt.figure(figsize=(10,7));ax=fig.add_subplot(111,projection='3d')
faces=[];colors=[]
for solid in s.Solids():
 v,t=solid.tessellate(.2);verts=[(p.x,p.y,p.z) for p in v];tri=[[verts[i] for i in q] for q in t];bb=solid.BoundingBox();color='#346b51' if bb.xlen>20 and bb.ylen>20 else '#b9b2a4';faces.extend(tri);colors.extend([color]*len(tri))
ax.add_collection3d(Poly3DCollection(faces,facecolors=colors,edgecolor='none',alpha=1,zsort='average'))
b=s.BoundingBox();ax.set_xlim(b.xmin,b.xmax);ax.set_ylim(b.ymin,b.ymax);ax.set_zlim(-3,4);ax.set_box_aspect((b.xlen,b.ylen,7));ax.view_init(elev=28,azim=-55);ax.set_xlabel('X (mm)');ax.set_ylabel('Y (mm)');ax.set_zlabel('Z (mm)');ax.set_title('Partial PCB assembly — provisional package envelopes\nBattery, intact leads, mating plug and case NOT included',fontsize=12);fig.tight_layout();out=O/'pcb-partial-assembly-study.png';fig.savefig(out,dpi=180);plt.close(fig)
r={'status':'PARTIAL_BOARD_VISUALIZATION_NOT_FINISHED_PRODUCT','step_sha256':hashlib.sha256(f.read_bytes()).hexdigest(),'image_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'solids':len(s.Solids()),'shape_valid':True,'limitations':['Envelope approximations and provisional J2 pose retained.','No battery/cable/case fit claim.']};(O/'partial-board-render-review.json').write_text(json.dumps(r,indent=2)+'\n');print(r)
