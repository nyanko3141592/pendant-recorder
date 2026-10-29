import pcbnew as k,wx
from pathlib import Path
app=wx.App(False)
O=Path(__file__).resolve().parent
b=k.LoadBoard(str(O/'pendant-xe-minimal.kicad_pcb'))
import math,json
boxes=[]
for f in b.GetFootprints():
 if f.GetReference()=='C28':continue
 shapes=[s.GetBoundingBox() for s in f.GraphicalItems() if s.GetLayer()==k.F_CrtYd]
 if shapes:boxes.append((f.GetReference(),min(k.ToMM(s.GetX()) for s in shapes),min(k.ToMM(s.GetY()) for s in shapes),max(k.ToMM(s.GetRight()) for s in shapes),max(k.ToMM(s.GetBottom()) for s in shapes)))
f=next(f for f in b.GetFootprints() if f.GetReference()=='C28');f.Flip(f.GetPosition(),k.FLIP_DIRECTION_LEFT_RIGHT)
out=[]
for ang in [0,90,180,270]:
 f.SetOrientationDegrees(ang);p=next(p for p in f.Pads() if p.GetNumber()=='1');pos=p.GetPosition();sh=[s.GetBoundingBox() for s in f.GraphicalItems() if s.GetLayer()==k.F_CrtYd]
 offsets=(min(s.GetX() for s in sh)-pos.x,min(s.GetY() for s in sh)-pos.y,max(s.GetRight() for s in sh)-pos.x,max(s.GetBottom() for s in sh)-pos.y);offsets=tuple(k.ToMM(v) for v in offsets)
 for ix in range(40,76):
  for iy in range(10,46):
   x,y=ix*.2,iy*.2
   if math.dist((x,y),(11.815,5.5175))>3:continue
   l,u,r,d=[z+v for z,v in zip((x,y,x,y),offsets)]
   if not any(l<br and r>bl and u<bd and d>bu for _,bl,bu,br,bd in boxes):out.append({'pad1':[round(x,3),round(y,3)],'angle':ang,'distance':math.dist((x,y),(11.815,5.5175))})
out.sort(key=lambda q:q['distance']);print(json.dumps(out[:16],indent=2))
open(O/'adc-filter-free-courtyard-candidates.json','w').write(json.dumps({'scope':'Conservative rectangle courtyard screening only; copper and DRC not yet checked','candidates':out},indent=2)+'\n')
