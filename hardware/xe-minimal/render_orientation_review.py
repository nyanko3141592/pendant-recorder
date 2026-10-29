from pathlib import Path
import json
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle
p=Path(__file__).resolve().parent;out=p/json.loads((p/'active-design.json').read_text())['manufacturing_review_directory'];r=json.loads((out/'assembly-terminal-orientation.json').read_text())
fig,axes=plt.subplots(1,2,figsize=(12,8),layout='constrained')
for ax,side in zip(axes,('top','bottom')):
 ax.add_patch(Rectangle((0,0),24,27,fill=False,color='black'))
 for c in r['components']:
  if c['side']!=side or not c['reference'].startswith(('U','J')):continue
  for pin in c['terminals']:ax.plot(pin['x_mm'],pin['y_board_mm'],'.',color='#b4bec7',markersize=3)
  pin=c['orientation_anchor']
  if pin:
   ax.plot(pin['x_mm'],pin['y_board_mm'],'o',color='#b33125',markersize=4)
   ax.annotate(c['reference']+':'+pin['number'],(pin['x_mm'],pin['y_board_mm']),xytext=(4,5),textcoords='offset points',fontsize=8)
 ax.set(aspect='equal',xlim=(-1,25),ylim=(28,-1),title=side.title()+' components — TOP VIEW coordinates',xlabel='Board X mm',ylabel='Board Y mm')
 ax.grid(alpha=.15)
fig.supxlabel('Red = footprint terminal 1 / A1. Bottom panel intentionally NOT mirrored.\nVerify physical marking and feeder convention separately; not production placement approval.',fontsize=10)
fig.savefig(out/'assembly-terminal-orientation.png',dpi=180)
