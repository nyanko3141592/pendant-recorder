#!/usr/bin/env python3
"""Rev B component placement + actual net assignment, independent of Rev A."""
import json,uuid,csv
from pathlib import Path
import pcbnew as pcb
ROOT=Path(__file__).resolve().parents[1];OUT=ROOT/'rev-c'
SYS=Path('/Applications/KiCad/KiCad.app/Contents/SharedSupport/footprints')
mm=pcb.FromMM
def pt(x,y):return pcb.VECTOR2I(mm(x),mm(y))
parts=json.loads((OUT/'design.json').read_text())['parts'];b=pcb.BOARD();b.SetCopperLayerCount(4);b.GetDesignSettings().SetBoardThickness(mm(.8))
ns={}
for n in sorted({q['net'] for p in parts for q in p['pins'] if q['net']}):
 ns[n]=pcb.NETINFO_ITEM(b,n);b.Add(ns[n])
fps={};W,H=21,31
for p in parts:
 lib,name=p['footprint'].split(':');f=pcb.FootprintLoad(str(OUT/'Pendant.pretty' if lib=='Pendant' else SYS/(lib+'.pretty')),name)
 f.SetReference(p['ref']);f.SetValue(p['value']);f.SetFPID(pcb.LIB_ID(lib,name));f.SetPath(pcb.KIID_PATH('/'+str(uuid.uuid5(uuid.NAMESPACE_URL,'pendant-recorder/rev-c/root'))+'/'+str(uuid.uuid5(uuid.NAMESPACE_URL,'pendant-recorder/rev-c/'+p['ref']))))
 f.Reference().SetVisible(False);f.Value().SetVisible(False)
 pp={q['number']:q for q in p['pins']};found=set()
 for pad in f.Pads():
  n=pad.GetNumber()
  if not n or n=='MP':continue
  assert n in pp,(p['ref'],n);found.add(n)
  net=pp[n]['net']
  if not net:
   net='unconnected-('+p['ref']+'-'+n+')';ns[net]=pcb.NETINFO_ITEM(b,net);b.Add(ns[net])
  pad.SetNet(ns[net])
 assert found==set(pp),(p['ref'],set(pp)-found)
 b.Add(f);fps[p['ref']]=f
used={'F':[],'B':[]};placed={}
def hit(a,c):return a[0]<c[0]+c[2]-.001 and a[0]+a[2]>c[0]+.001 and a[1]<c[1]+c[3]-.001 and a[1]+a[3]>c[1]+.001
def bbox(f):
 bb=f.GetBoundingBox(False,False);return [pcb.ToMM(v) for v in [bb.GetX(),bb.GetY(),bb.GetWidth(),bb.GetHeight()]]
def put(r,x,y,side='F',rot=0,antenna=False):
 f=fps[r]
 if side=='B' and not f.IsFlipped():f.Flip(pt(0,0),False)
 f.SetOrientationDegrees(rot);f.SetPosition(pt(0,0));dx,dy,w,h=bbox(f)
 # x,y is center of footprint bounding box, so rotations retain physical margins.
 f.SetPosition(pt(100+x-dx-w/2,100+y-dy-h/2));box=(x-w/2-.12,y-h/2-.12,w+.24,h+.24)
 conflicts=[a for a in used[side] if hit(box,a)]
 if conflicts and not antenna:raise ValueError((r,'overlap',box,conflicts))
 used[side].append(box);placed[r]={'x':x,'y':y,'side':side,'rotation':rot,'bbox':[x-w/2,y-h/2,w,h]}
put('J1',5.8,26.5)
put('J2',16.1,25.3,rot=180)
# Both tall connectors on top; battery below, low-profile passives on bottom.
put('U1',5,5)
put('U11',15,4)
put('U9',5,13)
put('U8',18,10)
used['B'].append(placed['U8']['bbox'])
put('J3',15,16,'B')
used['F'].append(used['B'][-1])
put('TH1',10,12,'B')
put('U4',12.4,10)
put('U6',4.5,18.2)
put('SW1',9.5,18.9,rot=90)
put('D1',2,21.2)
put('D6',5,21.2)
anchors={'C1':'U1','C4':'U1','C9':'U1','R2':'U1','Y1':'U1','C11':'Y1','C12':'Y1','R4':'SW1','R5':'D1','R32':'D6','R6':'J1','R7':'J1','R8':'U1','R9':'U1','C13':'U3','R10':'U3','R11':'U3','C14':'U3','R12':'Q2','R16':'Q1','C15':'U4','C16':'U4','C18':'U6','C19':'U6','C20':'U1','R17':'U6','C21':'U7','R18':'U7','R19':'U7','R20':'U7','R21':'U9','C22':'U8','C23':'U9','C24':'U9','U10':'U11','R22':'U10','C25':'U10','R23':'U11','R24':'U11','R25':'U11','R28':'U11','C26':'U11','C27':'U11'}
# Large parts first; passives may be on the low-profile battery-facing side.
for r in sorted((r for r in fps if r not in placed),key=lambda r:-(bbox(fps[r])[2]*bbox(fps[r])[3])):
 f=fps[r];anchor=placed.get(anchors.get(r),placed['U1']);ax,ay=anchor['x'],anchor['y'];options=[]
 sides=['B','F'] if r.startswith(('Q','Y')) else (['F','B'] if r.startswith(('R','C','TP')) or r in ('U2','U3','U10') else ['F'])
 for side in sides:
  for rot in [0,90]:
   f.SetOrientationDegrees(rot);dx,dy,w,h=bbox(f)
   for ix in range(1,int((W-w)*4)):
    for iy in range(1,int((H-h)*4)):
     x=ix/4+w/2;y=iy/4+h/2;box=(x-w/2-.12,y-h/2-.12,w+.24,h+.24)
     if box[0]<.15 or box[1]<.15 or box[0]+box[2]>W-.15 or box[1]+box[3]>H-.15:continue
     if any(hit(box,z) for z in used[side]):continue
     options.append(((x-ax)**2+(y-ay)**2+(0 if r.startswith(('Q','Y')) and side=='B' else (100 if r.startswith(('Q','Y')) else (10 if side=='B' else 0))),x,y,rot,side))
 if not options:raise ValueError('No space '+r)
 _,x,y,rot,side=min(options);put(r,x,y,side,rot)
for a,c in [((0,0),(W,0)),((W,0),(W,H)),((W,H),(0,H)),((0,H),(0,0))]:
 s=pcb.PCB_SHAPE();s.SetShape(pcb.SHAPE_T_SEGMENT);s.SetStart(pt(100+a[0],100+a[1]));s.SetEnd(pt(100+c[0],100+c[1]));s.SetLayer(pcb.Edge_Cuts);s.SetWidth(mm(.05));b.Add(s)
t=pcb.PCB_TEXT(b);t.SetText('REV C0 - ENGINEERING DRAFT');t.SetPosition(pt(111,96));t.SetTextSize(pt(.8,.8));t.SetLayer(pcb.Dwgs_User);b.Add(t)
b.BuildListOfNets();pcb.SaveBoard(str(OUT/'pendant-rev-c.kicad_pcb'),b)
(OUT/'placement-report.json').write_text(json.dumps({'board_mm':[W,H,.8],'status':'PLACED_UNROUTED_NOT_FOR_ORDER','placements':placed,'antenna_keepout_mm':None},indent=2)+'\n')
print('Placed',len(placed),'parts on',W,H)
