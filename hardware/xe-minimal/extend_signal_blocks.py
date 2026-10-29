import json,math,sys
from pathlib import Path
O=Path(__file__).resolve().parent;report=json.loads((O/'local-blocks.json').read_text());blocks=report['blocks'];geo=json.loads((O/'pad-geometry.json').read_text());design={p['ref']:p for p in json.loads((O/'design.json').read_text())['parts']}
through_check=len(sys.argv)>1 and sys.argv[1]=='through'
def overlap(a,b):return a[0]<b[0]+b[2]+.2-1e-8 and b[0]<a[0]+a[2]+.2-1e-8 and a[1]<b[1]+b[3]+.2-1e-8 and b[1]<a[1]+a[3]+.2-1e-8
def add(anchor,ref,pairs):
 block=next(b for b in blocks if b['anchor']==anchor);old=next(b for b in blocks if b['anchor']==ref);assert len(old['parts'])==1
 for own,target,pin in pairs:
  n1=next(p['net'] for p in design[ref]['pins'] if p['number']==own);n2=next(p['net'] for p in design[target]['pins'] if p['number']==pin);assert n1==n2,(ref,target)
 targets={p['ref']:p for p in block['parts']};pos=[]
 for own,target,pin in pairs:
  t=targets[target];tx,ty=geo[target]['pads'][pin];px,py=geo[ref]['pads'][own];pos.append((tx+t['x']-px,ty+t['y']-py))
 cx=sum(x for x,y in pos)/len(pos);cy=sum(y for x,y in pos)/len(pos);a,b,w,h=geo[ref]['box'];best=None
 for ix in range(-32,33):
  for iy in range(-32,33):
   x,y=cx+ix*.25,cy+iy*.25;box=[a+x,b+y,w,h]
   if any(q['side']==geo[ref]['side'] and overlap(box,q['box']) for q in block['parts']):continue
   if through_check:
    blocked=False
    for q in block['parts']:
     if q['side']==geo[ref]['side']:continue
     for A,B,W,H in geo[q['ref']].get('through',[]):
      if overlap(box,[A+q['x'],B+q['y'],W,H]):blocked=True
     for A,B,W,H in geo[ref].get('through',[]):
      if overlap(q['box'],[A+x,B+y,W,H]):blocked=True
    if blocked:continue
   distances=[math.hypot(x-X,y-Y) for X,Y in pos];score=(max(distances),sum(distances),abs(x)+abs(y))
   if best is None or score<best[0]:best=(score,dict(ref=ref,x=x,y=y,side=geo[ref]['side'],box=box,signal_pairs=pairs,pad_distances_mm=distances))
 assert best,ref
 block['parts'].append(best[1]);blocks.remove(old)
 xs=[p['box'][0] for p in block['parts']];ys=[p['box'][1] for p in block['parts']];X=max(p['box'][0]+p['box'][2] for p in block['parts']);Y=max(p['box'][1]+p['box'][3] for p in block['parts']);block['bounds']=[min(xs),min(ys),X,Y];block['envelope_mm']=[X-min(xs),Y-min(ys)]
add('U1','Y1',[('1','U1','3'),('2','U1','4')])
add('U1','C11',[('1','Y1','1')]);add('U1','C12',[('1','Y1','2')])
add('J1','U2',[('1','J1','A6'),('3','J1','A7')])
for ref in ['R6','R7']:
 if ref in design:
  pin=next(p for p in design[ref]['pins'] if p['number']=='1');cc=pin['net']
  if cc in ['CC1','CC2']:add('J1',ref,[('1','J1','A5' if cc=='CC1' else 'B5')])
assert len({p['ref'] for b in blocks for p in b['parts']})==89
report['status']='SIGNAL_AND_DECOUPLING_BLOCKS_NOT_ROUTED';report['caveats']+=['Crystal ground shield/drive level and USB differential routing/ESD return still unqualified.'];(O/('through-signal-blocks.json' if through_check else 'signal-blocks.json')).write_text(json.dumps(report,indent=2)+'\n')
print([(p['ref'],p['pad_distances_mm']) for b in blocks for p in b['parts'] if 'pad_distances_mm' in p])
