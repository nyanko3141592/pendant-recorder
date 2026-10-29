from pathlib import Path
import json
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle
HERE=Path(__file__).resolve().parent;D=HERE/'placement-compact-study';d=json.loads((D/'top-battery-review.json').read_text())
fig,axes=plt.subplots(1,2,figsize=(12,4.8),sharex=True,sharey=True)
def box(ax,x,y,w,h,color,label):
 ax.add_patch(Rectangle((x,y),w,h,facecolor=color,edgecolor='white',linewidth=1));ax.text(x+w/2,y+h/2,label,ha='center',va='center',fontsize=9,color='white')
for ax in axes:
 ax.set_xlim(-2,30);ax.set_ylim(-9,10);ax.set_aspect('equal');ax.set_xlabel('Board length / mm');ax.set_ylabel('Height / mm');ax.grid(alpha=.14)
 box(ax,0,0,27.5,.8264,'#27624d','4-layer PCB')
 box(ax,18.77,.8264,7.4,3.325,'#466a91','USB-C')
ax=axes[0];box(ax,0,-6.62,27,4.2,'#cf8a35','Fixed 110 mAh battery');ax.plot([-1.65,29.15,29.15,-1.65,-1.65],[-7.72,-7.72,6.18,6.18,-7.72],color='#59606a',ls='--');ax.set_title('Previous stack: 13.9 mm',fontsize=13)
ax=axes[1];z=d['battery_bounds_mm'][4];box(ax,.5,z,15.5,4.2,'#cf8a35','Battery rotated 90 degrees');box(ax,1.045,-1.72,4.7,1.6,'#9a6876','J2');floor=-2.82;roof=floor+d['provisional_outer_envelope_mm'][2];ax.plot([-1.65,29.15,29.15,-1.65,-1.65],[floor,floor,roof,roof,floor],color='#59606a',ls='--');ax.set_title('Placement study: ~11.0 mm envelope',fontsize=13)
fig.suptitle('Reduce overlap of battery and USB height — keep 27.5 mm PCB and 4 layers',fontsize=14)
fig.text(.5,.025,'Schematic side projection, not finished enclosure. Mic/switch relocation and full routing required.\nFactory harness, exact package maxima, retention and shock protection remain unqualified.',ha='center',fontsize=9)
fig.tight_layout(rect=(0,.12,1,.93));fig.savefig(D/'stack-comparison.png',dpi=170);plt.close(fig)
