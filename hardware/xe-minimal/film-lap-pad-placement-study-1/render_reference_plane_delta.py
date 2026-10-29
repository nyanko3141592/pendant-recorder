from pathlib import Path
import json,matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.patches import Polygon
O=Path(__file__).resolve().parent;r=json.loads((O/'reference-plane-delta-review.json').read_text());fig,axes=plt.subplots(1,2,figsize=(13,5))
for ax,key,title in zip(axes,['source_ground','candidate_ground'],['Previous In1 GND','Candidate In1 GND; removed copper in red']):
 for poly in r['geometry'][key]:
  ax.add_patch(Polygon(poly['outer'],facecolor='#88b9a5',edgecolor='none'))
  for hole in poly['holes']:ax.add_patch(Polygon(hole,facecolor='white',edgecolor='none'))
 if key=='candidate_ground':
  for poly in r['geometry']['removed_ground']:
   ax.add_patch(Polygon(poly['outer'],facecolor='#d76752',edgecolor='none',alpha=.75))
 for t in r['affected_signal_rectangles']:
  if t['net']not in ['/PDM_DATA','/SD_MISO']:continue
  ax.plot(*zip(*t['xy_mm']),color='#284e93',linewidth=2);x,y=t['xy_mm'][0];ax.text(x,y,t['net'],fontsize=8)
 ax.set_xlim(9,23.5);ax.set_ylim(7,0);ax.set_aspect('equal');ax.set_title(title);ax.set_xlabel('PCB X (mm)');ax.set_ylabel('PCB Y (mm)')
fig.suptitle('Reference-plane review: geometric projection only, not signal qualification');fig.tight_layout();fig.savefig(O/'reference-plane-delta-review.png',dpi=160)
