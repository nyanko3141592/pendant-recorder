"""Report actual connected-pad distances; this is not an electrical approval."""
import json,math,sys,hashlib
from pathlib import Path
import pcbnew as k
P=Path(__file__).resolve().parent
path=Path(sys.argv[1]); b=k.LoadBoard(str(path));fs={f.GetReference():f for f in b.GetFootprints()}
targets={'C1':('U1','24'),'C2':('U1','36'),'C3':('U1','48'),'C5':('U1','22'),'C6':('U1','9'),'C7':('U1','9'),'C9':('U1','7'),'Y1':('U1','3'),'C11':('Y1','1'),'C12':('Y1','2'),'C13':('U3','10'),'C14':('U3','2'),'C15':('U4','1'),'C16':('U4','5'),'C22':('U8','2'),'C25':('U10','A2'),'C26':('J4','4'),'C27':('J4','4')}
rows=[]
for ref,(parent,pin) in targets.items():
 a=next(x for x in fs[ref].Pads() if x.GetNumber()=='1');c=next(x for x in fs[parent].Pads() if x.GetNumber()==pin)
 assert a.GetNetname()==c.GetNetname(),(ref,parent,pin,a.GetNetname(),c.GetNetname())
 dist=math.hypot(k.ToMM(a.GetPosition().x-c.GetPosition().x),k.ToMM(a.GetPosition().y-c.GetPosition().y))
 rows.append(dict(component=ref,parent=parent,pin=pin,net=a.GetNetname(),distance_mm=round(dist,3),same_side=fs[ref].IsFlipped()==fs[parent].IsFlipped()))
r=dict(status='PROXIMITY_ONLY_NOT_RELEASED',board_sha256=hashlib.sha256(path.read_bytes()).hexdigest(),rows=rows,sum_distance_mm=round(sum(x['distance_mm'] for x in rows),3),opposite_side_count=sum(not x['same_side'] for x in rows),limitations=['Euclidean pad distance, not routed loop length or return quality.','No general pass threshold; verify each IC layout requirements.'])
path.with_suffix('.proximity.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
