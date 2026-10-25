import json,shutil,math
from pathlib import Path
import wx
app=wx.App(False)
import pcbnew as k
R=Path(__file__).resolve().parents[2]

import sys
if '--discard-routing' not in sys.argv:
 raise SystemExit('Refusing to replace experiment board. Pass --discard-routing explicitly.')
for variant,W,H,case in [('b',24,27,[26,31,14])]:
 if any(a in ['a','b'] for a in sys.argv[1:]) and variant not in sys.argv[1:]:continue
 P=R/'hardware/compact-100-v5';P.mkdir(parents=True,exist_ok=True)
 b=k.LoadBoard(str(R/'hardware/charge-guard-v4/pendant-charge-guard-v4.kicad_pcb'))
 for t in list(b.GetTracks()):b.Delete(t)
 import uuid
 for f in b.GetFootprints():
  f.SetPath(k.KIID_PATH('/'+str(uuid.uuid5(uuid.NAMESPACE_URL,'pendant-recorder/compact-100-v5/root'))+'/'+str(uuid.uuid5(uuid.NAMESPACE_URL,'pendant-recorder/compact-100-v5/'+f.GetReference()))))
 for o in list(b.GetDrawings()):
  if o.GetLayer()==k.Edge_Cuts:b.Delete(o)
 fs=list(b.GetFootprints())
 def bb(f):
  q=f.GetBoundingBox(False,False);return [k.ToMM(q.GetX()),k.ToMM(q.GetY()),k.ToMM(q.GetWidth()),k.ToMM(q.GetHeight())]
 def move(f,x,y):
  q=bb(f);f.Move(k.VECTOR2I(k.FromMM(x-q[0]),k.FromMM(y-q[1])))
 occupied={'F':[],'B':[[4,2,16,18]]};placed=[]
 def setat(f,x,y):
  move(f,x,y);q=bb(f);side='B' if f.IsFlipped() else 'F';occupied[side].append(q);placed.append(f)
  if any(p.GetDrillSize().x>0 for p in f.Pads()):occupied['F' if side=='B' else 'B'].append(q)
 j1=next(f for f in fs if f.GetReference()=='J1');q=bb(j1);setat(j1,(W-q[2])/2,H-q[3]+.5)
 j2=next(f for f in fs if f.GetReference()=='J2');
 if j2.IsFlipped():j2.Flip(j2.GetPosition(),False)
 setat(j2,.4,.4)
 def fits(q,side):
  x,y,w,h=q
  if x<.25 or y<.25 or x+w>W-.25 or y+h>H-.25:return False
  return all(x+w+.15<=a or a+c+.15<=x or y+h+.15<=d or d+e+.15<=y for a,d,c,e in occupied[side] if not ((f.GetReference()=='J3' or f.GetReference().startswith('TP')) and [a,d,c,e]==[4,2,16,18]))
 priorities=['J3','U8','SW1','U1','U11','Y1','C11','C12','C1','C2','C3','C5','C6','C7','C9','C26','C27','U3','U12','R35','R37','R38','R39','R40','R41','C29','Q2','Q4','Q5','Q6','R12','R36']
 targets={'U3':('J2',['1']),'U12':('J2',['2']),'R35':('U3',['B1']),'R37':('U12',['2']),'R38':('U12',['3']),'R39':('U12',['3']),'R40':('U12',['6']),'R41':('U12',['6']),'C29':('U12',['8']),'Q2':('U3',['B1']),'Q4':('Q2',['1']),'Q5':('Q2',['1']),'Q6':('Q2',['1']),'R12':('Q2',['1']),'R36':('Q4',['1']),'Y1':('U1',['3','4']),'C11':('Y1',['1']),'C12':('Y1',['2']),'C1':('U1',['24']),'C2':('U1',['36']),'C3':('U1',['48']),'C5':('U1',['22']),'C6':('U1',['9']),'C7':('U1',['9']),'C9':('U1',['7']),'C26':('U11',['4']),'C27':('U11',['4'])}
 for f in fs:
  if f not in placed and f.IsFlipped():f.Flip(f.GetPosition(),False)
 for f in sorted([f for f in fs if f not in placed],key=lambda f:(priorities.index(f.GetReference()) if f.GetReference() in priorities else 100,-bb(f)[2]*bb(f)[3])):
  side='B' if f.IsFlipped() else 'F';q=bb(f);best=None
  for option in range(8):
   if option==4:
    f.Flip(f.GetPosition(),False);side='B' if f.IsFlipped() else 'F'
   rot=(option%4)*90
   if rot:f.SetOrientationDegrees(f.GetOrientationDegrees()+rot)
   q=bb(f);w,h=q[2:]
   for iy in range(int((H-h)*4)):
    y=.25+iy*.25
    for ix in range(int((W-w)*4)):
     x=.25+ix*.25
     if fits([x,y,w,h],side) and (not any(p.GetDrillSize().x>0 for p in f.Pads()) or fits([x,y,w,h],'F' if side=='B' else 'B')):
      ref=f.GetReference()
      if ref=='U1':score=(x+w/2-9)**2+(y+h/2-12.5)**2
      elif ref in targets:
       rr,pins=targets[ref];target=next(z for z in fs if z.GetReference()==rr);pp=[z for z in target.Pads() if z.GetNumber() in pins];tx=sum(k.ToMM(z.GetPosition().x) for z in pp)/len(pp);ty=sum(k.ToMM(z.GetPosition().y) for z in pp)/len(pp);score=(x+w/2-tx)**2+(y+h/2-ty)**2
      else:score=y*W+x
      if best is None or score+(20 if side=='B' else 0)<best[0]:best=(score+(20 if side=='B' else 0),x,y,f.GetOrientationDegrees(),side)
   if rot:f.SetOrientationDegrees(f.GetOrientationDegrees()-rot)
  if best is None:raise Exception(('NO FIT',variant,f.GetReference()))
  if ('B' if f.IsFlipped() else 'F')!=best[4]:f.Flip(f.GetPosition(),False)
  f.SetOrientationDegrees(best[3]);setat(f,best[1],best[2])
 for f in fs:
  if f.GetReference()=='J2':f.SetValue('0781710003 / CUSTOM NTC HARNESS')
 for a,c in zip([(0,0),(W,0),(W,H),(0,H)],[(W,0),(W,H),(0,H),(0,0)]):
  o=k.PCB_SHAPE();o.SetShape(k.SHAPE_T_SEGMENT);o.SetLayer(k.Edge_Cuts);o.SetStart(k.VECTOR2I(*[k.FromMM(v) for v in a]));o.SetEnd(k.VECTOR2I(*[k.FromMM(v) for v in c]));o.SetWidth(k.FromMM(.05));b.Add(o)
 n=b.GetDesignSettings().m_NetSettings.GetDefaultNetclass();n.SetClearance(k.FromMM(.1));n.SetTrackWidth(k.FromMM(.1));n.SetViaDiameter(k.FromMM(.35));n.SetViaDrill(k.FromMM(.15))
 k.SaveBoard(str(P/'pendant-compact-100-v5.kicad_pcb'),b)
 assert k.ExportSpecctraDSN(b,str(P/'route.dsn'))
 out=[]
 for f in fs:
  x,y,w,h=bb(f);out.append(dict(ref=f.GetReference(),x=x+w/2,y=y+h/2,w=w,h=h,side='B' if f.IsFlipped() else 'F',rotation=f.GetOrientationDegrees()))
 (P/'placement.json').write_text(json.dumps(out,indent=2))

 print(variant,len(fs),W,H)
