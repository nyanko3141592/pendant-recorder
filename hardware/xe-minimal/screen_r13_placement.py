"""Conservative courtyard/pad/copper screening; final KiCad DRC remains authoritative."""
import pcbnew as k,wx,json,math
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;b=k.LoadBoard(str(O/'pendant-xe-minimal.kicad_pcb'))
f=next(f for f in b.GetFootprints() if f.GetReference()=='R13');oldids={'513effad-def5-4364-82fd-7a0a85e187ed','a2b78be4-a345-4814-ad4b-057c38ac511d'}
def box(bb):return tuple(k.ToMM(v) for v in [bb.GetX(),bb.GetY(),bb.GetRight(),bb.GetBottom()])
def union(boxes):return (min(z[0] for z in boxes),min(z[1] for z in boxes),max(z[2] for z in boxes),max(z[3] for z in boxes))
def overlap(a,c,g=0):return a[0]<c[2]+g and a[2]>c[0]-g and a[1]<c[3]+g and a[3]>c[1]-g
def pointdist(x,y,bb):return math.hypot(max(bb[0]-x,0,x-bb[2]),max(bb[1]-y,0,y-bb[3]))
out=[]
for side,layer,cy in [('F',k.F_Cu,k.F_CrtYd),('B',k.B_Cu,k.B_CrtYd)]:
 if f.IsFlipped()!=(side=='B'):f.Flip(f.GetPosition(),k.FLIP_DIRECTION_LEFT_RIGHT)
 courts=[];pads=[];tracks=[]
 for other in b.GetFootprints():
  if other.GetReference()=='R13':continue
  shapes=[box(s.GetBoundingBox()) for s in other.GraphicalItems() if s.GetLayer()==cy]
  if shapes:courts.append(union(shapes))
  for p in other.Pads():
   if p.IsOnLayer(layer):pads.append((p.GetNetname(),box(p.GetBoundingBox())))
 for t in b.GetTracks():
  if t.m_Uuid.AsString() in oldids:continue
  via=isinstance(t,k.PCB_VIA)
  if not via and t.GetLayer()!=layer:continue
  a,c=t.GetStart(),t.GetEnd();a=(k.ToMM(a.x),k.ToMM(a.y));c=(k.ToMM(c.x),k.ToMM(c.y));rad=k.ToMM(t.GetWidth(layer) if via else t.GetWidth())/2+.11
  n=max(1,math.ceil(math.dist(a,c)/.08));samples=[(a[0]+(c[0]-a[0])*i/n,a[1]+(c[1]-a[1])*i/n) for i in range(n+1)];bounds=(min(a[0],c[0]),min(a[1],c[1]),max(a[0],c[0]),max(a[1],c[1]));tracks.append((t.GetNetname(),bounds,rad,samples))
 for angle in [0,90,180,270]:
  f.SetOrientationDegrees(angle);p1=next(p for p in f.Pads() if p.GetNumber()=='1');a=p1.GetPosition();ax,ay=k.ToMM(a.x),k.ToMM(a.y)
  cb=union([box(s.GetBoundingBox()) for s in f.GraphicalItems() if s.GetLayer()==cy]);co=(cb[0]-ax,cb[1]-ay,cb[2]-ax,cb[3]-ay)
  po=[]
  for p in f.Pads():
   bb=box(p.GetBoundingBox());po.append((p.GetNetname(),(bb[0]-ax,bb[1]-ay,bb[2]-ax,bb[3]-ay)))
  for ix in range(4,93):
   for iy in range(4,105):
    x,y=ix*.25,iy*.25
    if side=='B' and 13<x<18 and 2.5<y<5:continue
    cb=tuple(v+d for v,d in zip(co,(x,y,x,y)))
    if cb[0]<.3 or cb[1]<.3 or cb[2]>23.7 or cb[3]>26.7 or any(overlap(cb,c) for c in courts):continue
    valid=True
    for net,off in po:
     bb=tuple(v+d for v,d in zip(off,(x,y,x,y)))
     if any(net!=n and overlap(bb,p,.11) for n,p in pads):valid=False;break
     for tn,tb,rad,samples in tracks:
      if net==tn or not overlap(bb,tb,rad):continue
      if any(pointdist(xx,yy,bb)<rad for xx,yy in samples):valid=False;break
     if not valid:break
    if valid:out.append({'side':side,'angle':angle,'pad1_mm':[x,y],'distance_to_old_via':math.dist((x,y),(12.646924,4.294999))})
out.sort(key=lambda q:q['distance_to_old_via']);(O/'r13-screened-positions.json').write_text(json.dumps(out,indent=2)+'\n');print('screened',len(out),'nearest',out[:8])
