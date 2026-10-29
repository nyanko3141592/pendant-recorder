from pathlib import Path
import json,csv,hashlib
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle
O=Path(__file__).resolve().parent;D=O/'r44-capped-trial/fabrication-review-dedfe7ece3be';r=json.loads((D/'via-process-intent.json').read_text());rows=[v for v in r['vias']if v['filled']and v['capped']];assert len(rows)==12
with (D/'filled-capped-vias.csv').open('w')as f:
 w=csv.DictWriter(f,fieldnames=['id','x_mm','y_mm','drill_mm','copper_mm','net','uuid']);w.writeheader()
 for i,v in enumerate(rows,1):w.writerow({'id':i,**{k:v[k]for k in ['x_mm','y_mm','drill_mm','copper_mm','net','uuid']}})
fig,ax=plt.subplots(figsize=(8,9));ax.add_patch(Rectangle((0,0),24,27,fill=False,color='black'))
for v in r['vias']:ax.plot(v['x_mm'],v['y_mm'],'.',color='#cccccc',ms=3)
for i,v in enumerate(rows,1):
 ax.plot(v['x_mm'],v['y_mm'],'o',color='tab:red',ms=5);ax.annotate(str(i),(v['x_mm'],v['y_mm']),xytext=(5,5 if i%2 else -12),textcoords='offset points',fontsize=9)
ax.set(xlim=(-1,25),ylim=(28,-1),xlabel='PCB X (mm)',ylabel='PCB Y (mm, downward)',title='Filled + copper-capped vias: 12 locations\nEngineering review only; not fabrication approval');ax.set_aspect('equal');ax.grid(alpha=.2)
fig.text(.08,.02,'Coordinates follow PCB, unlike Gerber Y sign. Use CSV UUIDs to identify vias.\nFill material, planarization, cap thickness and acceptance limits remain unqualified.',fontsize=9);fig.savefig(D/'filled-capped-via-map.png',dpi=160);plt.close(fig)
p=D/'REVIEW-ONLY.json';m=json.loads(p.read_text());m['files_sha256']={str(f.relative_to(D)):hashlib.sha256(f.read_bytes()).hexdigest()for f in sorted(D.rglob('*'))if f.is_file()and f!=p};p.write_text(json.dumps(m,indent=2))
