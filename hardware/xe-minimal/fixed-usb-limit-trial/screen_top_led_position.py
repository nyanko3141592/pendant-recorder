import pcbnew as k,wx,math
app=wx.App(False)
from pathlib import Path
b=k.LoadBoard(str(Path(__file__).resolve().parent/'top-led-trial/pendant-xe-minimal.kicad_pcb'))
f=next(f for f in b.GetFootprints()if f.GetReference()=='D6')
def xy(v):return k.ToMM(v.x),k.ToMM(v.y)
def dist(p,a,c):
 dx,dy=c[0]-a[0],c[1]-a[1];q=max(0,min(1,((p[0]-a[0])*dx+(p[1]-a[1])*dy)/(dx*dx+dy*dy)))if dx or dy else 0
 return math.hypot(p[0]-a[0]-q*dx,p[1]-a[1]-q*dy)
found=[]
for angle in [0,90]:
 f.SetOrientationDegrees(angle)
 for ix in range(-8,9):
  for iy in range(-8,9):
   x,y=15.725+ix*.2,5.975+iy*.2;f.SetPosition(k.VECTOR2I(k.FromMM(x),k.FromMM(y)));ok=True
   for p in f.Pads():
    center=xy(p.GetPosition());bb=p.GetBoundingBox();rad=math.hypot(k.ToMM(bb.GetWidth()),k.ToMM(bb.GetHeight()))/2+.1
    for t in b.GetTracks():
     if t.GetNetname()==p.GetNetname():continue
     via=isinstance(t,k.PCB_VIA)
     if not via and t.GetLayer()!=k.F_Cu:continue
     if dist(center,xy(t.GetStart()),xy(t.GetEnd()))<rad+k.ToMM(t.GetWidth(k.F_Cu)if via else t.GetWidth())/2:ok=False;break
    if not ok:break
    for other in b.GetFootprints():
     if other.GetReference()=='D6':continue
     for q in other.Pads():
      if q.IsOnLayer(k.F_Cu) and q.GetNetname()!=p.GetNetname():
       qb=q.GetBoundingBox()
       if qb.GetX()/1e6-rad<center[0]<qb.GetRight()/1e6+rad and qb.GetY()/1e6-rad<center[1]<qb.GetBottom()/1e6+rad:ok=False;break
     if not ok:break
   if ok:found.append((math.hypot(ix,iy),x,y,angle))
print(sorted(found)[:15])
