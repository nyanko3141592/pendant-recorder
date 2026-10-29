from pathlib import Path
import pcbnew as k,wx,json,hashlib
app=wx.App(False);w=Path(__file__).resolve().parent;src=w/'l3-ground-011-trial.kicad_pcb';b=k.LoadBoard(str(src));f=next(f for f in b.GetFootprints() if f.GetReference()=='C32');p=next(p for p in f.Pads() if p.GetNumber()=='1');tracks=[t for t in b.GetTracks() if t.GetNetname()==p.GetNetname() and not isinstance(t,k.PCB_VIA) and t.GetLayer()==k.B_Cu];vias=[t for t in b.GetTracks() if isinstance(t,k.PCB_VIA)];adj={}
def pos(q):return(q.x,q.y)
for t in tracks:
 for q in [t.GetStart(),t.GetEnd()]:adj.setdefault(pos(q),[]).append(t)
point=pos(p.GetPosition());seen=set();path=[];reason=None
while True:
 choices=[t for t in adj.get(point,[]) if t.m_Uuid.AsString() not in seen]
 if len(choices)!=1:reason='branch_or_end_'+str(len(choices));break
 t=choices[0];seen.add(t.m_Uuid.AsString());path.append(t);point=pos(t.GetEnd()) if pos(t.GetStart())==point else pos(t.GetStart())
 if any(pos(v.GetPosition())==point for v in vias):reason='via';break
 if len(path)>2000:raise RuntimeError('unexpected loop')
out={'source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'old_branch_segments':len(path),'old_branch_length_mm':sum(k.ToMM(t.GetLength()) for t in path),'stop_reason':reason,'endpoint_mm':[k.ToMM(v) for v in point],'uuids':[t.m_Uuid.AsString() for t in path],'release_allowed':False};(w/'c32-old-branch-inspection.json').write_text(json.dumps(out,indent=2)+'\n');print({key:v for key,v in out.items() if key!='uuids'})
