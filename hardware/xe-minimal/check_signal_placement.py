import pcbnew,json,math,sys
from pathlib import Path
O=Path(__file__).resolve().parent;boardname=sys.argv[1] if len(sys.argv)>1 else 'signal-block-packing-22x27-NOT-ROUTED.kicad_pcb';b=pcbnew.LoadBoard(str(O/boardname));fps={f.GetReference():f for f in b.GetFootprints()}
def distance(ref,pin,target,targetpin):
 p=next(p for p in fps[ref].Pads() if p.GetNumber()==pin);q=next(p for p in fps[target].Pads() if p.GetNumber()==targetpin)
 assert p.GetNetname()==q.GetNetname()
 a,c=p.GetPosition(),q.GetPosition();return math.hypot(pcbnew.ToMM(a.x-c.x),pcbnew.ToMM(a.y-c.y))
rows=json.loads((O/'decoupling-distances.json').read_text())['rows'];cap=[distance(x['ref'],'1',x['target'],x['pin']) for x in rows];signal=[]
for block in json.loads((O/('through-signal-blocks.json' if boardname.startswith('through-') else 'signal-blocks.json')).read_text())['blocks']:
 for p in block['parts']:
  if 'signal_pairs' in p:signal.append({'ref':p['ref'],'distances_mm':[distance(p['ref'],own,target,pin) for own,target,pin in p['signal_pairs']]})
assert max(cap)<2.306
report={'status':'SAVED_PAD_GEOMETRY_CHECKED_NOT_ROUTED','board_mm':[24,27] if boardname.startswith('through-') else [22,27],'max_cap_distance_mm':max(cap),'signal_distances':signal,'limitations':['No trace impedance/length/ground-return analysis','Opposite-side proximity does not establish via clearance','USB metal/body/plug clearance and battery leads not qualified','Heuristic placement; board size is not minimum proof or finished-case size']}
(O/('through-signal-placement-review.json' if boardname.startswith('through-') else 'signal-placement-review.json')).write_text(json.dumps(report,indent=2)+'\n');print(report)
