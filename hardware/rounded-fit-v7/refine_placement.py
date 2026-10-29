from pathlib import Path
import json,math,wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;b=k.LoadBoard(str(P/'outline-only-backup.kicad_pcb'));fs={f.GetReference():f for f in b.GetFootprints()};design={p['ref']:p for p in json.load(open(P/'design.json'))['parts']}
for t in list(b.GetTracks()):b.Delete(t)
def bb(f):
 q=f.GetBoundingBox(False,False);return [k.ToMM(q.GetX()),k.ToMM(q.GetY()),k.ToMM(q.GetWidth()),k.ToMM(q.GetHeight())]
def center(f,x,y):
 a,c,w,h=bb(f);f.Move(k.VECTOR2I(k.FromMM(x-a-w/2),k.FromMM(y-c-h/2)))
center(fs['U2'],19.5,23.5)
center(fs['U10'],21.0,3.1)
movable=[f for r,f in fs.items() if r.startswith(('C','R'))]
occ={'F':[],'B':[[4,2,16,18]]}
for r,f in fs.items():
 if f in movable:continue
 q=bb(f);side='B' if f.IsFlipped() else 'F';occ[side].append(q)
 if any(p.GetDrillSize().x>0 for p in f.Pads()):occ['F' if side=='B' else 'B'].append(q)
targets={'C1':('U1','24'),'C2':('U1','36'),'C3':('U1','48'),'C5':('U1','22'),'C6':('U1','9'),'C7':('U1','9'),'C9':('U1','7'),'C11':('Y1','1'),'C12':('Y1','2'),'C16':('U4','5'),'C15':('U4','1'),'C18':('U6','5'),'C19':('U6','1'),'C22':('U8','7'),'C23':('U9','1'),'C24':('U9','11'),'C25':('U10','A2'),'C26':('U11','8'),'C27':('U11','8'),'C29':('U12','8'),'C13':('J1','A4'),'C14':('U3','A1'),'C4':('U1','24'),'C28':('U1','11'),'R8':('U1','33'),'R9':('U1','32'),'R21':('U1','39'),'R23':('U1','15'),'R6':('J1','A5'),'R7':('J1','B5')}
priority=['C16','C22','C23','C24','C25','C26','C27','C18','C19','C15','C29','C5','C1','C2','C3','C6','C7','C11','C12','R8','R9','R21','R23','C13','C14','C9','C4','C28']
def inside(x,y):
 # 0.25mm inside rounded outline, with cut top y=0.
 if y<.25:return False
 qx=abs(x-12)-8;qy=abs(y-12.5)-10.5
 return math.hypot(max(qx,0),max(qy,0))+min(max(qx,qy),0)<=3.75
for f in sorted(movable,key=lambda f:priority.index(f.GetReference()) if f.GetReference() in priority else 100):
 ref=f.GetReference();target=targets.get(ref)
 if target:
  parent=fs[target[0]];pad=next(p for p in parent.Pads() if p.GetNumber()==target[1]);tx,ty=k.ToMM(pad.GetPosition().x),k.ToMM(pad.GetPosition().y);preferred='B' if parent.IsFlipped() else 'F'
 else:
  nets={p['net'] for p in design[ref]['pins'] if p['net'] not in ['GND','V3V3','VBUS','BAT','SYS',None]};pads=[p for r,ff in fs.items() if ff not in movable for p in ff.Pads() if p.GetNetname().lstrip('/') in nets]
  tx=sum(k.ToMM(p.GetPosition().x) for p in pads)/len(pads) if pads else 12;ty=sum(k.ToMM(p.GetPosition().y) for p in pads)/len(pads) if pads else 13;preferred='F'
 best=None
 for side in ['F','B']:
  if f.IsFlipped()!=(side=='B'):f.Flip(f.GetPosition(),False)
  for rot in [0,90,180,270]:
   f.SetOrientationDegrees(rot);a,c,w,h=bb(f)
   for iy in range(1,107):
    y=iy*.25
    for ix in range(1,95):
     x=ix*.25
     if not all(inside(xx,yy) for xx in [x,x+w] for yy in [y,y+h]):continue
     if any(not(x+w+.15<=a or a+c+.15<=x or y+h+.15<=d or d+e+.15<=y) for a,d,c,e in occ[side]):continue
     score=(x+w/2-tx)**2+(y+h/2-ty)**2+(2 if side!=preferred else 0)
     if best is None or score<best[0]:best=(score,x+w/2,y+h/2,side,rot)
 if best is None:raise RuntimeError('no space '+ref)
 _,x,y,side,rot=best
 if f.IsFlipped()!=(side=='B'):f.Flip(f.GetPosition(),False)
 f.SetOrientationDegrees(rot);center(f,x,y);occ[side].append(bb(f));print(ref,round(math.sqrt(best[0]),2),side,flush=True)
k.SaveBoard(str(P/'pendant-compact-100-v5.kicad_pcb'),b);assert k.ExportSpecctraDSN(b,str(P/'route.dsn'))
out=[]
for f in fs.values():
 x,y,w,h=bb(f);out.append(dict(ref=f.GetReference(),x=x+w/2,y=y+h/2,w=w,h=h,side='B' if f.IsFlipped() else 'F',rotation=f.GetOrientationDegrees()))
(P/'placement.json').write_text(json.dumps(out,indent=2))
