from pathlib import Path
import wx,json,math
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;b=k.LoadBoard(str(P/'usb-ground-return.kicad_pcb'));fs={f.GetReference():f for f in b.GetFootprints()};u=fs['U2'];u.Flip(u.GetPosition(),False)
def box(f):
 q=f.GetBoundingBox(False,False);return [k.ToMM(v) for v in [q.GetX(),q.GetY(),q.GetWidth(),q.GetHeight()]]
def overlap(a,c,g=.05):return a[0]<c[0]+c[2]+g and c[0]<a[0]+a[2]+g and a[1]<c[1]+c[3]+g and c[1]<a[1]+a[3]+g
def inside(a):
 for x,y in [(a[0],a[1]),(a[0]+a[2],a[1]),(a[0],a[1]+a[3]),(a[0]+a[2],a[1]+a[3])]:
  cx=min(max(x,2.5),18.5);cy=min(max(y,2.5),20.5)
  if (x-cx)**2+(y-cy)**2>2.475**2:return False
 return True
obstacles=[(f.GetReference(),box(f)) for f in fs.values() if f.GetReference()!='U2' and f.GetLayer()==k.F_Cu]
# Through-holes are physical obstacles on both sides.
for f in fs.values():
 for pad in f.Pads():
  if pad.GetDrillSize().x:
   q=pad.GetBoundingBox();obstacles.append((f.GetReference()+' hole',[k.ToMM(v) for v in [q.GetX(),q.GetY(),q.GetWidth(),q.GetHeight()]]))
rows=[];blocked=[]
for angle in [0,90,180,270]:
 u.SetOrientationDegrees(angle);q=box(u);ox=k.ToMM(u.GetPosition().x)-q[0];oy=k.ToMM(u.GetPosition().y)-q[1]
 for ix in range(0,85):
  for iy in range(0,93):
   x,y=ix*.25,iy*.25;a=[x,y,q[2],q[3]]
   if not inside(a):continue
   hits=[r for r,c in obstacles if overlap(a,c)]
   score=(x+q[2]/2-10.5)**2+(y+q[3]/2-19)**2
   row=dict(angle=angle,x_mm=x+ox,y_mm=y+oy,bbox_mm=a,score=round(score,3),obstacles=hits)
   if not hits:rows.append(row)
   elif len(hits)==1:blocked.append(row)
groups={}
for row in sorted(blocked,key=lambda x:x['score']):
 groups.setdefault(row['obstacles'][0],row)
r=dict(best_by_single_obstacle=groups,status='MECHANICAL_ENVELOPE_SEARCH_ONLY',front_free=sorted(rows,key=lambda x:x['score'])[:10],one_obstacle=sorted(blocked,key=lambda x:x['score'])[:10],limitations=['No copper clearance, routing, ESD flow-through or acoustic/assembly validation','Footprint envelope includes inserted-card reserve; cannot waive it without actual geometry check'])
(P/'usb-protection-position-search.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
