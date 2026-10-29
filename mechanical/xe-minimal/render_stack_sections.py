from pathlib import Path
import json,hashlib,cadquery as cq
import matplotlib;matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle
O=Path(__file__).resolve().parent;r=json.loads((O/'battery-stack-study-review.json').read_text());f=O/'pcb-partial-with-body-envelopes.step';assert hashlib.sha256(f.read_bytes()).hexdigest()==r['source_step_sha256'];s=cq.importers.importStep(str(f)).val();c=r['selected_geometric_candidate'];fig,axs=plt.subplots(1,2,figsize=(10,7),layout='constrained')
for q in s.Solids():
 b=q.BoundingBox()
 for ax,rect in zip(axs,[(b.xmin,b.ymin,b.xlen,b.ylen),(b.zmin,b.ymin,b.zlen,b.ylen)]):
  ax.add_patch(Rectangle(rect[:2],rect[2],rect[3],facecolor='#ccd4d8',edgecolor='#7b858b',lw=.3,alpha=.45))
axs[0].add_patch(Rectangle((c['pack_x_min_mm'],-27),15.5,27,facecolor='#2797da',alpha=.3,edgecolor='#0875ba',lw=2));z=c['pack_z_range_mm'];axs[1].add_patch(Rectangle((z[0],-27),z[1]-z[0],27,facecolor='#2797da',alpha=.3,edgecolor='#0875ba',lw=2))
for ax in axs:ax.set_aspect('equal');ax.grid(alpha=.2);ax.set_ylim(-30,3);ax.set_ylabel('PCB -Y (mm)')
axs[0].set_xlim(-2,27);axs[0].set_xlabel('PCB X (mm)');axs[0].set_title('Plan: blue battery envelope')
axs[1].set_xlim(-9,7);axs[1].set_xlabel('Board Z (mm)');axs[1].set_title('Side: provisional stack')
fig.suptitle('Battery placement study — not final product dimensions');fig.supxlabel('Grey: component bounding boxes. Blue: maximum pack envelope.\nWires, mating plug, insulation, retention and case are not included. 0.2 mm gap is an assumption.',fontsize=9)
fout=O/'battery-stack-sections.png';fig.savefig(fout,dpi=180);plt.close(fig);print(fout)
