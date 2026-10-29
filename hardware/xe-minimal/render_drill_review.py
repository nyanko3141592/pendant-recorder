"""Render exported Excellon data only, no inference from PCB positions."""
from pathlib import Path
import re
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.patches import Circle,Rectangle
p=Path(__file__).resolve().parent/'fabrication-review-31ebfc3b1041'
fig,ax=plt.subplots(figsize=(7,8),layout='constrained')
ax.add_patch(Rectangle((0,-27),24,27,fill=False,color='black',lw=1))
for file in (p/'drill').glob('*.drl'):
 tools={};tool=None;color='#d66a00' if '-NPTH' in file.name else '#126ca6'
 for line in file.read_text().splitlines():
  m=re.fullmatch(r'T(\d+)C([\d.]+)',line)
  if m:tools[m[1]]=float(m[2]);continue
  m=re.fullmatch(r'T(\d+)',line)
  if m:tool=m[1];continue
  if not line.startswith('X'):continue
  xy=[tuple(map(float,m)) for m in re.findall(r'X([-\d.]+)Y([-\d.]+)',line)]
  radius=tools[tool]/2
  for x,y in xy:ax.add_patch(Circle((x,y),radius,color=color))
  if len(xy)==2:
   (x1,y1),(x2,y2)=xy
   # Current export contains only vertical slots; refuse other orientations.
   assert x1==x2
   ax.add_patch(Rectangle((x1-radius,min(y1,y2)),2*radius,abs(y2-y1),color=color))
ax.set(aspect='equal',xlim=(-1,25),ylim=(-28,1),xlabel='X (mm)',ylabel='Export Y (mm)',title='Exported drill review — 24 x 27 mm profile')
ax.grid(alpha=.15)
fig.supxlabel('Blue: plated holes / slots. Orange: non-plated holes.\nOutline shown at profile centerline. Not a complete manufacturing approval.',fontsize=9)
fig.savefig(p/'drill-review.png',dpi=180)
