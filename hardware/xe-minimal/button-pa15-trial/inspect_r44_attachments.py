import pcbnew as k,wx,json
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;b=k.LoadBoard(str(O/'pa15-ilim-square-escape-candidate.kicad_pcb'));f=next(f for f in b.GetFootprints() if f.GetReference()=='R44')
def xy(p):return [k.ToMM(p.x),k.ToMM(p.y)]
out=[]
for p in f.Pads():
 ts=[]
 for t in b.GetTracks():
  if t.GetStart()==p.GetPosition() or t.GetEnd()==p.GetPosition():ts.append({'uuid':t.m_Uuid.AsString(),'start':xy(t.GetStart()),'end':xy(t.GetEnd()),'layer':t.GetLayer(),'net':t.GetNetname()})
 out.append({'pad':p.GetNumber(),'pos':xy(p.GetPosition()),'net':p.GetNetname(),'attached':ts})
(O/'r44-attachments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2))
