import pcbnew as p,json,math,sys
from pathlib import Path
P=Path(__file__).resolve().parent;s=sys.argv[1];b=p.LoadBoard(str(P/(s+'.kicad_pcb')));d=json.load(open(P/sys.argv[2]));items=list(b.GetPads())+list(b.GetTracks());byid={i.m_Uuid.AsString():i for i in items}
for v in d['unconnected_items']:
 a=byid[v['items'][0]['uuid']]
 if not isinstance(a,p.PAD):continue
 start=a.GetPosition();opts=[]
 for t in items:
  if t==a or t.GetNetCode()!=a.GetNetCode():continue
  points=[t.GetPosition()] if isinstance(t,(p.PAD,p.PCB_VIA)) else [t.GetStart(),t.GetEnd()]
  for pos in points:opts.append((math.hypot(pos.x-start.x,pos.y-start.y),t,pos))
 if opts:
  _,t,pos=min(opts,key=lambda x:x[0]);v['items'][1]={'uuid':t.m_Uuid.AsString(),'description':'Nearest existing same-net target; DRC required','pos':{'x':p.ToMM(pos.x),'y':p.ToMM(pos.y)}}
(P/(s+'-near.json')).write_text(json.dumps(d,indent=2))
