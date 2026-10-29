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
u.SetOrientationDegrees(90);u.SetPosition(k.VECTOR2I(k.FromMM(17.33),k.FromMM(19.775)))
f=fs['U4'];f.Flip(f.GetPosition(),False)
obstacles=[(x.GetReference(),box(x)) for x in fs.values() if x.GetReference()!='U4' and x.GetLayer()==k.B_Cu]
for x in fs.values():
 for pad in x.Pads():
  if pad.GetDrillSize().x:
   q=pad.GetBoundingBox();obstacles.append((x.GetReference()+' hole',[k.ToMM(v) for v in [q.GetX(),q.GetY(),q.GetWidth(),q.GetHeight()]]))
choices=[]
for angle in [0,90,180,270]:
 f.SetOrientationDegrees(angle);q=box(f);ox=k.ToMM(f.GetPosition().x)-q[0];oy=k.ToMM(f.GetPosition().y)-q[1]
 for ix in range(85):
  for iy in range(93):
   x,y=ix*.25,iy*.25;a=[x,y,q[2],q[3]]
   if not inside(a) or any(overlap(a,c) for _,c in obstacles):continue
   score=sum((x+q[2]/2-k.ToMM(fs[r].GetPosition().x))**2+(y+q[3]/2-k.ToMM(fs[r].GetPosition().y))**2 for r in ['C15','C16'])
   choices.append(dict(x_mm=x+ox,y_mm=y+oy,angle=angle,score=score))
choices.sort(key=lambda x:x['score'])
(P/'usb-regulator-swap-search.json').write_text(json.dumps(dict(status='ENVELOPE_ONLY_NOT_ROUTED',front_usb=dict(x_mm=17.33,y_mm=19.775,angle=90),back_regulator_candidates=choices[:10],limitations=['Existing tracks are invalid after moving parts; no candidate board saved','Regulator capacitor loops and thermal/ground need redesign']),indent=2)+'\n');print(choices[:3])
