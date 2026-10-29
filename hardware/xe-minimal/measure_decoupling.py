import pcbnew
import json,math,sys
from pathlib import Path
O=Path(__file__).resolve().parent
boardname=sys.argv[1] if len(sys.argv)>1 else 'packing-20x27-NOT-ROUTED.kicad_pcb'
b=pcbnew.LoadBoard(str(O/boardname))
fps={f.GetReference():f for f in b.GetFootprints()}
assign={'C1':('U1','24'),'C2':('U1','36'),'C3':('U1','48'),'C5':('U1','22'),'C6':('U1','9'),'C7':('U1','9'),'C13':('U3','10'),'C14':('U3','2'),'C15':('U3','1'),'C16':('U4','5'),'C22':('U8','2'),'C25':('U10','A2'),'C26':('U11','8'),'C27':('U11','8'),'C29':('U12','8'),'C30':('U3','8'),'C31':('U13','5'),'C32':('U14','14'),'C33':('U15','3')}
rows=[]
for ref,(target,num) in assign.items():
 f=fps[ref];p=next(p for p in f.Pads() if p.GetNumber()=='1');t=next(p for p in fps[target].Pads() if p.GetNumber()==num)
 a=p.GetPosition();c=t.GetPosition();bb=f.GetBoundingBox(False,False);pos=f.GetPosition()
 rows.append({'ref':ref,'target':target,'pin':num,'same_net':p.GetNetname()==t.GetNetname(),'same_side':f.IsFlipped()==fps[target].IsFlipped(),'distance_mm':math.hypot(pcbnew.ToMM(a.x-c.x),pcbnew.ToMM(a.y-c.y)),'side':f.IsFlipped(),'size':[bb.GetWidth(),bb.GetHeight()],'origin':[pos.x,pos.y],'pad_offset':[a.x-pos.x,a.y-pos.y],'target_position':[c.x,c.y]})
assert all(x['same_net'] for x in rows)
(O/('block-decoupling-distances.json' if boardname.startswith('block-') else 'decoupling-distances.json')).write_text(json.dumps({'scope':'Straight pad-to-pad distance, not trace length/loop inductance. Assignments are engineering intent.','rows':rows},indent=2)+'\n')
print([(x['ref'],x['target'],round(x['distance_mm'],2)) for x in sorted(rows,key=lambda x:-x['distance_mm'])[:7]])
