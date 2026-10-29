import pcbnew as k,wx,math,json
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;b=k.LoadBoard(str(O/'button-alt-join-candidate.kicad_pcb'));out=[]
def xy(p):return k.ToMM(p.x),k.ToMM(p.y)
def dist(p,s,e):
 dx,dy=e[0]-s[0],e[1]-s[1];t=max(0,min(1,((p[0]-s[0])*dx+(p[1]-s[1])*dy)/(dx*dx+dy*dy))) if dx or dy else 0
 return math.hypot(p[0]-s[0]-t*dx,p[1]-s[1]-t*dy)
for t in b.GetTracks():
 if t.GetNetname()=='/BUTTON_N':continue
 if not isinstance(t,k.PCB_VIA) and t.GetLayer()!=k.In4_Cu:continue
 d=dist((23.35,7.2),xy(t.GetStart()),xy(t.GetEnd()))
 if d<.8:out.append({'uuid':t.m_Uuid.AsString(),'net':t.GetNetname(),'via':isinstance(t,k.PCB_VIA),'start':xy(t.GetStart()),'end':xy(t.GetEnd()),'distance':d})
(O/'button-boundary-obstacles.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2))
