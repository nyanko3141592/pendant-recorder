from pathlib import Path
import json,matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.patches import Polygon
O=Path(__file__).resolve().parent
route=json.loads((O/'batts-guarded-multilayer-review.json').read_text())
fig,axes=plt.subplots(1,2,figsize=(13,5))
for idx,ax in zip([1,3],axes):
 r=json.loads((O/f'guarded-multilayer-in{idx}-reference-review.json').read_text())
 assert r['candidate_sha256']==route['candidate_sha256']
 for poly in r['geometry']['candidate_ground']:
  ax.add_patch(Polygon(poly['outer'],facecolor='#c4ddd1',edgecolor='none'))
  for h in poly['holes']:ax.add_patch(Polygon(h,facecolor='white',edgecolor='none'))
 for poly in r['geometry']['removed_ground']:
  ax.add_patch(Polygon(poly['outer'],facecolor='#e16a54',edgecolor='none',alpha=.85))
 for t in r['affected_signal_rectangles']:
  if t['net']not in ['/SYS','/V3V3','/VBUS_LIMITED']:continue
  color={'/SYS':'#9b51a0','/V3V3':'#354f9a','/VBUS_LIMITED':'#ad8500'}[t['net']]
  ax.plot(*zip(*t['xy_mm']),color=color,linewidth=2,label=t['net'])
 for t in route['routes']:
  if t['layer']==f'In{idx}.Cu':ax.plot(*zip(*t['path_mm']),color='#202629',linewidth=1,linestyle='--',label='Added BAT_TS')
 for x,y in route['new_vias_mm']:ax.plot(x,y,'o',color='#202629',markersize=4)
 ax.set_xlim(10.5,23);ax.set_ylim(7,0);ax.set_aspect('equal');ax.set_xlabel('PCB X (mm)');ax.set_ylabel('PCB Y (mm)')
 ax.set_title(f'In{idx} GND: removed copper in red')
 handles,labels=ax.get_legend_handles_labels();unique=dict(zip(labels,handles));ax.legend(unique.values(),unique.keys(),loc='lower left',fontsize=8)
fig.suptitle('Connected 9.30 mm candidate: power reference review\nProjection screen only; not a power-integrity qualification',fontsize=12)
fig.tight_layout();fig.savefig(O/'guarded-power-reference-review.png',dpi=160)
