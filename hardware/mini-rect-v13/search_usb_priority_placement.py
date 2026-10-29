"""Conservative envelope packing, followed separately by KiCad DRC. Not routing."""
from pathlib import Path
import json,math,random,time
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent
b=k.LoadBoard(str(P/'pendant-mini-rect-v13.kicad_pcb'))
fs={f.GetReference():f for f in b.GetFootprints()}
W,H,R=21,23,2.5
# Library bounding boxes omit user text, include electrical/mechanical artwork.
def box(f):
 q=f.GetBoundingBox(False,False)
 return [k.ToMM(q.GetX()),k.ToMM(q.GetY()),k.ToMM(q.GetWidth()),k.ToMM(q.GetHeight())]
def overlap(a,c,g=.05):return a[0]<c[0]+c[2]+g and c[0]<a[0]+a[2]+g and a[1]<c[1]+c[3]+g and c[1]<a[1]+a[3]+g
def inside(a):
 for x,y in [(a[0],a[1]),(a[0]+a[2],a[1]),(a[0],a[1]+a[3]),(a[0]+a[2],a[1]+a[3])]:
  cx=min(max(x,R),W-R);cy=min(max(y,R),H-R)
  if (x-cx)**2+(y-cy)**2>(R-.025)**2:return False
 return True
variants={}
front_only={'J1','J4','SW1','U2','U8'}
back_only={'U1','J2','U4'}
for ref,f in fs.items():
 variants[ref]=[]
 for side in ['F','B']:
  if (side=='B' and ref in front_only) or (side=='F' and ref in back_only):continue
  if f.IsFlipped()!=(side=='B'):f.Flip(f.GetPosition(),False)
  for angle in [0,90,180,270]:
   f.SetOrientationDegrees(angle);q=box(f);o=f.GetPosition()
   holes=[]
   for pad in f.Pads():
    if pad.GetDrillSize().x:
     pp=pad.GetBoundingBox();holes.append([k.ToMM(pp.GetX())-q[0],k.ToMM(pp.GetY())-q[1],k.ToMM(pp.GetWidth()),k.ToMM(pp.GetHeight())])
   pad_xy={pad.GetNumber():[k.ToMM(pad.GetPosition().x)-q[0],k.ToMM(pad.GetPosition().y)-q[1]] for pad in f.Pads() if pad.GetNumber()}
   variants[ref].append(dict(pad_xy=pad_xy,side=side,angle=angle,w=q[2],h=q[3],origin_offset=[k.ToMM(o.x)-q[0],k.ToMM(o.y)-q[1]],holes=holes))
# Work from original physical connector position; board-edge protrusion is intentional.
orig=k.LoadBoard(str(P/'pendant-mini-rect-v13.kicad_pcb'));origfs={f.GetReference():f for f in orig.GetFootprints()}
old={r:box(f) for r,f in origfs.items()}
targets={'U2':('J1','A6'),'R10':('U3','8'),'C30':('U3','8'),'R12':('U3','4'),'Q4':('U3','4'),'R43':('U1','20'),'C1':('U1','24'),'C2':('U1','36'),'C3':('U1','48'),'C5':('U1','22'),'C6':('U1','9'),'C7':('U1','9'),'C9':('U1','7'),'Y1':('U1','3'),'C11':('Y1','1'),'C12':('Y1','2'),'C13':('U3','10'),'C14':('U3','2'),'C15':('U4','1'),'C16':('U4','5'),'C22':('U8','2'),'C25':('U10','A2'),'C26':('J4','4'),'C27':('J4','4')}
priority=['U2','J3','U8','SW1','U4','J2','U1','C15','C16','C22','C1','C2','C3','C5','C6','C7','C9','Y1','C11','C12','U3','C13','C14','R10','C30','Q4','R12','R43','U10','C25','C26','C27']
best=None
for seed in range(1):
 rng=random.Random(seed);occupied={'F':[],'B':[]};placed={}
 def place(ref,v,x,y):
  q=[x,y,v['w'],v['h']];occupied[v['side']].append(q)
  for xx,yy,w,h in v['holes']:occupied['B' if v['side']=='F' else 'F'].append([x+xx,y+yy,w,h])
  placed[ref]=dict(v,x=x,y=y)
 v=next(v for v in variants['J1'] if v['angle']==0);place('J1',v,old['J1'][0],old['J1'][1])
 # Card orientation swapped between seeds. Socket bbox includes fully inserted card.
 v=next(v for v in variants['J4'] if v['angle']==(90 if seed%2==0 else 270))
 x=(W-v['w'])/2;y=.30
 if not inside([x,y,v['w'],v['h']]) or any(overlap([x,y,v['w'],v['h']],q) for q in occupied['F']):
  print('socket anchor does not fit',v['w'],v['h']);continue
 place('J4',v,x,y)
 remaining=[r for r in fs if r not in placed]
 order=sorted(remaining,key=lambda r:(priority.index(r) if r in priority else 100,-variants[r][0]['w']*variants[r][0]['h']*(1+rng.random()*.15)))
 failed=[]
 for ref in order:
  opts=[]
  for v in variants[ref]:
   for iy in range(int((H-v['h'])*4)+1):
    y=iy*.25
    for ix in range(int((W-v['w'])*4)+1):
     x=ix*.25;q=[x,y,v['w'],v['h']]
     if not inside(q) or any(overlap(q,z) for z in occupied[v['side']]):continue
     opposite=occupied['B' if v['side']=='F' else 'F']
     if any(overlap([x+xx,y+yy,w,h],z) for xx,yy,w,h in v['holes'] for z in opposite):continue
     # Prioritize compact packing with modest preservation of original location.
     score=y*.2+x*.02+(.7 if v['side']=='F' and ref not in front_only else 0)+.02*((x-old[ref][0])**2+(y-old[ref][1])**2)
     if ref=='U1':score=(x+v['w']/2-10.5)**2+(y+v['h']/2-8)**2
     if ref in targets and targets[ref][0] in placed:
      parent,pin=targets[ref];pp=placed[parent]
      if pin in pp['pad_xy']:
       tx=pp['x']+pp['pad_xy'][pin][0];ty=pp['y']+pp['pad_xy'][pin][1]
       own=v['pad_xy'].get({'Q4':'3','R12':'2'}.get(ref,'1'),[v['w']/2,v['h']/2])
       score=(x+own[0]-tx)**2+(y+own[1]-ty)**2+20*(v['side']!=pp['side'])
     opts.append((score,v,x,y))
  if not opts:failed.append(ref);continue
  _,v,x,y=min(opts,key=lambda a:a[0]);place(ref,v,x,y)
 result=dict(seed=seed,placed=placed,failed=failed)
 print(seed,len(placed),'failed',failed,flush=True)
 if best is None or len(failed)<len(best['failed']):best=result
 if not failed:break
if best is None:raise RuntimeError('No socket anchor fit')
(P/'usb-priority-packing-search.json').write_text(json.dumps(dict(status='ENVELOPE_ONLY_NOT_RELEASED',board_mm=[W,H],**best,limitations=['Heuristic electrical proximity only, requires pad/loop review','Solder mask/silk/keepouts need DRC','Backside test access and battery cable routing unqualified','Not all component and courtyard shapes represented exactly by rectangles']),indent=2)+'\n')
# Save best complete or partial layout separately; unplaced parts remain in original positions.
for ref,v in best['placed'].items():
 f=origfs[ref]
 if f.IsFlipped()!=(v['side']=='B'):f.Flip(f.GetPosition(),False)
 f.SetOrientationDegrees(v['angle'])
 f.SetPosition(k.VECTOR2I(k.FromMM(v['x']+v['origin_offset'][0]),k.FromMM(v['y']+v['origin_offset'][1])))
from fix_clone_ids import fix
fix(orig)
k.SaveBoard(str(P/'usb-priority-packing-candidate.kicad_pcb'),orig)
