import pcbnew as k,wx,math,json
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;b=k.LoadBoard(str(O/'pendant-xe-minimal.kicad_pcb'));out=[]
def xy(p):return k.ToMM(p.x),k.ToMM(p.y)
def dist(p,s,e):
 dx,dy=e[0]-s[0],e[1]-s[1];t=max(0,min(1,((p[0]-s[0])*dx+(p[1]-s[1])*dy)/(dx*dx+dy*dy))) if dx or dy else 0
 return math.hypot(p[0]-s[0]-t*dx,p[1]-s[1]-t*dy)
for pin,x,ys in [('38',19.1025,[11.5,11.6,11.7,11.8,11.9,12.0])]:
 for y in ys:
  pos=(x,y);obs=[]
  for t in b.GetTracks():
   via=isinstance(t,k.PCB_VIA)
   if not via and t.GetLayer()!=k.B_Cu:continue
   if dist(pos,xy(t.GetStart()),xy(t.GetEnd()))<k.ToMM(t.GetWidth(k.B_Cu) if via else t.GetWidth())/2+.176:obs.append({'uuid':t.m_Uuid.AsString(),'net':t.GetNetname(),'via':via,'start':xy(t.GetStart()),'end':xy(t.GetEnd())})
  out.append({'pin':pin,'pos':pos,'obstacles':obs})
(O/'button-pa15-surface-obstacles.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2))
