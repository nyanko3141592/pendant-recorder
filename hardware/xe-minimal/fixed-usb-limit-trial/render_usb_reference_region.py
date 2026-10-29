from pathlib import Path
import json,matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.patches import Circle
O=Path(__file__).resolve().parent;d=json.loads((O/'usb-reference-region.json').read_text());fig,axs=plt.subplots(1,2,figsize=(13,6))
for ax,(name,grid)in zip(axs,d['ground_presence'].items()):
 ax.imshow(grid,extent=[16,21,14,10],cmap='Greys',vmin=0,vmax=1,alpha=.35,interpolation='nearest')
 for t in d['usb_tracks']:
  ax.plot([t['a'][0],t['b'][0]],[t['a'][1],t['b'][1]],color='#c83737'if t['net']=='/USB_DP'else'#2463bb',lw=2)
 for v in d['vias']:
  x,y=v['xy'];ax.add_patch(Circle((x,y),v['diameter']/2,fill=False,color='#555',lw=.6))
  if v['net']in ['/SD_EN','/PDM_DATA']:
   ax.annotate(v['net'],(x,y),(x+.3,y+.35),fontsize=9,arrowprops={'arrowstyle':'->'})
 ax.set(xlim=(16,21),ylim=(14,10),xlabel='PCB X (mm)',ylabel='PCB Y (mm)',title=name+' ground: gray; voids: white');ax.set_aspect('equal');ax.grid(alpha=.15)
fig.suptitle('USB reference region — sampled copper only, not impedance qualification');fig.tight_layout();fig.savefig(O/'usb-reference-region.png',dpi=170)
