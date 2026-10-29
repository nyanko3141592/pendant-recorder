import pcbnew as k,wx,json,math
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;b=k.LoadBoard(str(O/'pendant-xe-minimal.kicad_pcb'))
f=next(f for f in b.GetFootprints() if f.GetReference()=='U1');p=next(p for p in f.Pads() if p.GetNumber()=='14');a=p.GetPosition()
def xy(v):return [k.ToMM(v.x),k.ToMM(v.y)]
def dist(v,s,e):
 dx=e.x-s.x;dy=e.y-s.y;t=max(0,min(1,((v.x-s.x)*dx+(v.y-s.y)*dy)/(dx*dx+dy*dy))) if dx or dy else 0
 return math.hypot(v.x-s.x-t*dx,v.y-s.y-t*dy)
tracks=[];pads=[]
for t in b.GetTracks():
 via=isinstance(t,k.PCB_VIA)
 if (via or t.GetLayer()==k.B_Cu) and dist(a,t.GetStart(),t.GetEnd())<k.FromMM(2):tracks.append({'uuid':t.m_Uuid.AsString(),'net':t.GetNetname(),'start':xy(t.GetStart()),'end':xy(t.GetEnd()),'via':via})
for f in b.GetFootprints():
 for q in f.Pads():
  if q.IsOnLayer(k.B_Cu) and math.dist(xy(a),xy(q.GetPosition()))<2:pads.append({'ref':f.GetReference(),'pad':q.GetNumber(),'net':q.GetNetname(),'pos':xy(q.GetPosition())})
r={'target':xy(a),'tracks':tracks,'pads':pads};(O/'cs-escape-obstacles.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
