#!/usr/bin/env python3
"""Build an electrically netted, unrouted review board. Never a fabrication release."""
import json,csv,uuid
from pathlib import Path
import wx
app=wx.App(False)
import pcbnew as pcb
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'hardware/mini-rect-v10'
SYS=Path('/Applications/KiCad/KiCad.app/Contents/SharedSupport/footprints')
data=json.loads((OUT/'design.json').read_text());parts=data['parts']
mm=pcb.FromMM
def pt(x,y):return pcb.VECTOR2I(mm(x),mm(y))
board=pcb.BOARD();board.SetCopperLayerCount(4);board.GetDesignSettings().SetBoardThickness(mm(.8))
nets={}
for name in sorted({q['net'] for p in parts for q in p['pins'] if q['net']}):
 n=pcb.NETINFO_ITEM(board,name);board.Add(n);nets[name]=n
fps={}; dims={};errors=[]
for p in parts:
 lib,name=p['footprint'].split(':');path=OUT/(lib+'.pretty') if lib in ('Pendant','PendantD1') else SYS/(lib+'.pretty')
 f=pcb.FootprintLoad(str(path),name)
 if not f:raise ValueError('Missing '+p['footprint'])
 f.SetFPID(pcb.LIB_ID(lib,name));f.SetReference(p['ref']);f.SetValue(p['value']);f.SetPath(pcb.KIID_PATH('/'+str(uuid.uuid5(uuid.NAMESPACE_URL,'pendant-recorder/mini-rect-v10/root'))+'/'+str(uuid.uuid5(uuid.NAMESPACE_URL,'pendant-recorder/mini-rect-v10/'+p['ref']))))
 f.Reference().SetVisible(False);f.Value().SetVisible(False)
 expected={q['number']:q for q in p['pins']};found=set()
 for pad in f.Pads():
  num=pad.GetNumber()
  if not num or (p['ref']=='J2' and num=='MP'):continue
  if num not in expected:errors.append(p['ref']+': unexpected pad '+num);continue
  found.add(num);net=expected[num]['net']
  if net:pad.SetNet(nets[net])
  else:
   ncname='unconnected-('+p['ref']+'-'+expected[num]['name'].replace(' ','_')+'-Pad'+num+')';nc=pcb.NETINFO_ITEM(board,ncname);board.Add(nc);pad.SetNet(nc)
 for num in expected.keys()-found:errors.append(p['ref']+': missing pad '+num)
 board.Add(f);fps[p['ref']]=f
 bb=f.GetBoundingBox(False,False);dims[p['ref']]=(pcb.ToMM(bb.GetX()),pcb.ToMM(bb.GetY()),pcb.ToMM(bb.GetWidth()),pcb.ToMM(bb.GetHeight()))
if errors:raise ValueError('\n'.join(errors))


import math

def bb(f):
 q=f.GetBoundingBox(False,False);return [pcb.ToMM(q.GetX()),pcb.ToMM(q.GetY()),pcb.ToMM(q.GetWidth()),pcb.ToMM(q.GetHeight())]
def move_center(f,x,y):
 a,b,w,h=bb(f);f.Move(pt(x-a-w/2,y-b-h/2))
def overlaps(a,b,gap=.12):return not(a[0]+a[2]+gap<=b[0] or b[0]+b[2]+gap<=a[0] or a[1]+a[3]+gap<=b[1] or b[1]+b[3]+gap<=a[1])
def inside(x,y,margin=.20):
 # 21 x 23 mm rounded rectangle, R2.5.
 qx=abs(x-10.5)-8;qy=abs(y-11.5)-9
 return math.hypot(max(qx,0),max(qy,0))+min(max(qx,qy),0)<=2.5-margin
occ={'F':[],'B':[]};placed={}
heights={r:(3.56 if r=='J1' else 1.6 if r=='SW1' else 1.4 if r=='J2' else .05 if r=='J3' or r.startswith('TP') else .85 if r=='U11' else 1.3 if r=='U8' else 1.5 if r=='U4' else 1.2 if r in ['U1','U12','Q3','Q4','Q5','Q6'] else .8 if r=='U3' else .6) for r in fps}
# Underside features under the pack may be <=0.85mm, leaving >=0.25mm nominal gap.
pack=[2.75,1.75,15.5,17.5]
def orient(f,side,rot):
 if f.IsFlipped()!=(side=='B'):f.Flip(f.GetPosition(),False)
 f.SetOrientationDegrees(rot)
def allowed(ref,side,q):
 x,y,w,h=q
 if ref!='J1' and not all(inside(a,b) for a in [x,x+w] for b in [y,y+h]):return False
 if any(overlaps(q,b) for b in occ[side]):return False
 if side=='B' and heights[ref]>.85 and overlaps(q,pack,.1):return False
 return True
def put(ref,x,y,side='F',rot=0,force=False):
 f=fps[ref];orient(f,side,rot);move_center(f,x,y);q=bb(f)
 if not force and not allowed(ref,side,q):raise ValueError('fixed does not fit '+ref+str(q))
 occ[side].append(q);placed[ref]=q
 # Through-holes require clearance on opposite face. USB shell only reserve actual holes.
 if ref in ['J3','U8']:
  for pad in f.Pads():
   if pad.GetDrillSize().x:
    x,y=pcb.ToMM(pad.GetPosition().x),pcb.ToMM(pad.GetPosition().y);rr=pcb.ToMM(pad.GetDrillSize().x)/2+.25;occ['B' if side=='F' else 'F'].append([x-rr,y-rr,2*rr,2*rr])
 if ref=='J1':
  for pad in f.Pads():
   if pad.GetDrillSize().x:
    x,y=pcb.ToMM(pad.GetPosition().x),pcb.ToMM(pad.GetPosition().y);occ['B'].append([x-.7,y-1,.0+1.4,2])
put('J1',10.5,18.7)
put('U1',11.75,9.9,'F',180)
put('U11',10.5,10.2,'B',0)
put('J2',4.5,7.2,'F',90)
put('J3',12,3.5,'F',0)
put('U8',18.4,11.5,'F',0)
# Acoustic hole at right edge, outside battery footprint.
targets={'U2':(18.8,18),'U3':(5,17),'U4':(4.3,14),'U12':(18,6.8),'SW1':(18.5,8.5),'D6':(16.8,4),'Y1':(8,14),'Q3':(19,19),'Q4':(7,18),'Q5':(4,18),'Q6':(5,21),'U10':(13,18)}
cap_targets={'C1':('U1','24'),'C2':('U1','36'),'C3':('U1','48'),'C5':('U1','22'),'C6':('U1','9'),'C7':('U1','9'),'C9':('U1','7'),'C11':('Y1','1'),'C12':('Y1','2'),'C16':('U4','5'),'C15':('U3','1'),'C22':('U8','2'),'C25':('U10','A2'),'C26':('U11','8'),'C27':('U11','8'),'C29':('U12','8'),'C13':('U3','10'),'C14':('U3','2'),'C30':('U3','8')}
remaining=sorted((r for r in fps if r not in placed),key=lambda r:(0 if r in targets else 1 if r in cap_targets else 2,-dims[r][2]*dims[r][3]))
for ref in remaining:
 f=fps[ref];best=None;tx,ty=targets.get(ref,(12,13))
 # Prefer capacitor local to attached IC supply pad; enforce pin proximity later in review.
 if ref not in targets:
  pn=next(p for p in parts if p['ref']==ref);ns={p['net'] for p in pn['pins'] if p['net'] not in [None,'GND','V3V3','SYS','BAT','VBUS']}
  peers=[p for r in placed for p in fps[r].Pads() if p.GetNetname() in ns]
  if peers:tx=sum(pcb.ToMM(p.GetPosition().x) for p in peers)/len(peers);ty=sum(pcb.ToMM(p.GetPosition().y) for p in peers)/len(peers)
 preferred='F'
 if ref in cap_targets:
  pr,pn=cap_targets[ref];parent=fps[pr];pad=next(p for p in parent.Pads() if p.GetNumber()==pn);tx,ty=pcb.ToMM(pad.GetPosition().x),pcb.ToMM(pad.GetPosition().y);preferred='B' if parent.IsFlipped() else 'F'
 for side in ['F','B']:
  for rot in [0,90]:
   orient(f,side,rot);_,_,w,h=bb(f)
   for iy in range(2,97):
    y=iy*.25
    for ix in range(2,95):
     x=ix*.25;q=[x-w/2,y-h/2,w,h]
     if not allowed(ref,side,q):continue
     score=(x-tx)**2+(y-ty)**2+(0 if side==preferred else 4)
     if best is None or score<best[0]:best=(score,x,y,side,rot)
 if not best:raise ValueError('No placement '+ref)
 _,x,y,side,rot=best;put(ref,x,y,side,rot);print(ref,x,y,side,flush=True)
# Rounded rectangular outline sampled at one degree. No routing implied.
outline=[]
for cx,cy,start in [(18.5,2.5,-90),(18.5,20.5,0),(2.5,20.5,90),(2.5,2.5,180)]:
 for i in range(91):
  a=math.radians(start+i);outline.append((cx+2.5*math.cos(a),cy+2.5*math.sin(a)))
# Close the perimeter.
for a,b in zip(outline,outline[1:]+outline[:1]):
 line=pcb.PCB_SHAPE();line.SetShape(pcb.SHAPE_T_SEGMENT);line.SetStart(pt(*a));line.SetEnd(pt(*b));line.SetLayer(pcb.Edge_Cuts);line.SetWidth(mm(.05));board.Add(line)
# Avoid inappropriate persistent default manufacturing settings; restore project after process exits.
for n in nets.values():n.SetNetname('/'+n.GetNetname())
board.BuildListOfNets();pcb.SaveBoard(str(OUT/'pendant-mini-rect-v10.kicad_pcb'),board)
report=[]
for r,f in fps.items():
 x,y,w,h=bb(f);report.append(dict(ref=r,x=round(x+w/2,5),y=round(y+h/2,5),w=round(w,5),h=round(h,5),side='B' if f.IsFlipped() else 'F',rotation=f.GetOrientationDegrees(),height=heights[r]))
(OUT/'placement.json').write_text(json.dumps(report,indent=2))
(OUT/'outline.json').write_text(json.dumps(outline))
mic=[p for p in fps['U8'].Pads() if p.GetDrillSize().x][0]
(OUT/'mic-port.json').write_text(json.dumps([dict(x=pcb.ToMM(mic.GetPosition().x),y=pcb.ToMM(mic.GetPosition().y),diameter=.8)]))
print('placed',len(report),'tracks',len(board.GetTracks()))
