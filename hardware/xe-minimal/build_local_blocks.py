"""Construct IC/local-capacitor geometry blocks, keeping original footprint sides/orientations."""
import json,math
from pathlib import Path
O=Path(__file__).resolve().parent;geo=json.loads((O/'pad-geometry.json').read_text());assign=json.loads((O/'decoupling-distances.json').read_text())['rows']
groups={}
for a in assign:groups.setdefault(a['target'],[]).append(a)
def box(ref,x,y):
 a,b,w,h=geo[ref]['box'];return [x+a,y+b,w,h]
def collides(a,b,gap=.2):return a[0]<b[0]+b[2]+gap-1e-8 and b[0]<a[0]+a[2]+gap-1e-8 and a[1]<b[1]+b[3]+gap-1e-8 and b[1]<a[1]+a[3]+gap-1e-8
blocks=[]
for target,aa in groups.items():
 placed=[{'ref':target,'x':0,'y':0,'side':geo[target]['side'],'box':box(target,0,0)}]
 for a in aa:
  ref=a['ref'];tx,ty=geo[target]['pads'][a['pin']];px,py=geo[ref]['pads']['1'];side=geo[ref]['side'];best=None
  for ix in range(-24,25):
   for iy in range(-24,25):
    x,y=tx-px+ix*.25,ty-py+iy*.25;b=box(ref,x,y)
    if any(q['side']==side and collides(b,q['box']) for q in placed):continue
    distance=math.hypot(ix*.25,iy*.25)
    # Prefer compact shape among equal pad distances.
    extent=max(b[0]+b[2],*(q['box'][0]+q['box'][2] for q in placed))-min(b[0],*(q['box'][0] for q in placed))
    score=(distance,extent,abs(x)+abs(y))
    if best is None or score<best[0]:best=(score,{'ref':ref,'x':x,'y':y,'side':side,'box':b,'target_pin':a['pin'],'pad_distance_mm':distance,'same_side':side==geo[target]['side']})
  assert best,ref
  placed.append(best[1])
 xmin=min(p['box'][0] for p in placed);ymin=min(p['box'][1] for p in placed)
 xmax=max(p['box'][0]+p['box'][2] for p in placed);ymax=max(p['box'][1]+p['box'][3] for p in placed)
 blocks.append({'anchor':target,'envelope_mm':[xmax-xmin,ymax-ymin],'bounds':[xmin,ymin,xmax,ymax],'parts':placed})
used={p['ref'] for b in blocks for p in b['parts']}
for ref,g in geo.items():
 if ref not in used:
  x,y,w,h=g['box'];blocks.append({'anchor':ref,'envelope_mm':[w,h],'bounds':[x,y,x+w,y+h],'parts':[{'ref':ref,'x':0,'y':0,'side':g['side'],'box':g['box']}]})
assert sum(len(b['parts']) for b in blocks)==len(geo)
for b in blocks:
 for i,p in enumerate(b['parts']):
  assert not any(q['side']==p['side'] and collides(p['box'],q['box']) for q in b['parts'][:i])
report={'status':'LOCAL_GEOMETRY_BLOCKS_NOT_ROUTED','blocks':blocks,'worst_local_cap_pad_distance_mm':max(p.get('pad_distance_mm',0) for b in blocks for p in b['parts']),'caveats':['Distances are straight-line, not traces; opposite-side pairs require via/ground-loop design.','Fixed capacitor orientation,0.25mm search grid,0.2mm envelope gap; not minimum geometry proof.','Ground return, USB, crystal, regulator interconnection and thermal contacts still need constraints.','All89 footprints represented exactly once; no whole-board placement yet.']}
(O/'local-blocks.json').write_text(json.dumps(report,indent=2)+'\n')
print('Blocks:',len(blocks),'parts:',len(geo),'worst cap distance:',report['worst_local_cap_pad_distance_mm'])
print([(b['anchor'],[round(x,2) for x in b['envelope_mm']]) for b in blocks if len(b['parts'])>1])
