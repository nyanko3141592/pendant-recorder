#!/usr/bin/env python3
"""Rev B component placement + actual net assignment, independent of Rev A."""
import json,uuid,csv
from pathlib import Path
import pcbnew as pcb
ROOT=Path(__file__).resolve().parents[1];OUT=ROOT/'rev-b'
SYS=Path('/Applications/KiCad/KiCad.app/Contents/SharedSupport/footprints')
mm=pcb.FromMM
def pt(x,y):return pcb.VECTOR2I(mm(x),mm(y))
parts=json.loads((OUT/'design.json').read_text())['parts'];b=pcb.BOARD();b.SetCopperLayerCount(4);b.GetDesignSettings().SetBoardThickness(mm(.8))
ns={}
for n in sorted({q['net'] for p in parts for q in p['pins'] if q['net']}):
 ns[n]=pcb.NETINFO_ITEM(b,n);b.Add(ns[n])
fps={};W,H=22,43.5
for p in parts:
 lib,name=p['footprint'].split(':');f=pcb.FootprintLoad(str(OUT/'Pendant.pretty' if lib=='Pendant' else SYS/(lib+'.pretty')),name)
 f.SetReference(p['ref']);f.SetValue(p['value']);f.SetFPID(pcb.LIB_ID(lib,name));f.SetPath(pcb.KIID_PATH('/'+str(uuid.uuid5(uuid.NAMESPACE_URL,'pendant-recorder/rev-b/root'))+'/'+str(uuid.uuid5(uuid.NAMESPACE_URL,'pendant-recorder/rev-b/'+p['ref']))))
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
used={'F':[(0,0,W,4.5)],'B':[(0,0,W,4.5)]};placed={}
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
put('U1',11,8.6,antenna=True)
put('J1',16,39.1)
put('J2',5,37.9,'B',180)
put('U11',11,26.85)
put('U8',19.55,7.0)
put('U9',11,20.15)
put('U6',19.6,16.2)
put('U4',3,19)
put('U7',3,22.5)
put('U3',18.9,29.5)
put('Q1',3,34.2)
put('Q2',19,25)
put('D2',3,38.2)
put('U2',8,32.6)
put('SW1',2.7,7.2,rot=90)
put('J3',3,28,'B',90)
# Programming alignment holes also reserve the front face.
used['F'].append(used['B'][-1])
# Acoustic port goes through PCB, no components underneath; battery outside port x.
used['B'].append(placed['U8']['bbox'])
put('TH1',11,17,'B')
for i,r in enumerate(['TP1','TP2','TP3','TP4','TP5','TP6']):put(r,8.5+3*(i%4),29+2.5*(i//4),'B')
put('D1',3,12)
put('D6',3,14)
anchors={'C1':'U1','C4':'U1','C9':'U1','R2':'U1','Y1':'U1','C11':'Y1','C12':'Y1','R4':'SW1','R5':'D1','R32':'D6','R6':'J1','R7':'J1','R8':'U1','R9':'U1','C13':'U3','R10':'U3','R11':'U3','C14':'U3','R12':'Q2','R16':'Q1','C15':'U4','C16':'U4','C18':'U6','C19':'U6','C20':'U1','R17':'U6','C21':'U7','R18':'U7','R19':'U7','R20':'U7','R21':'U9','C22':'U8','C23':'U9','C24':'U9','U10':'U11','R22':'U10','C25':'U10','R23':'U11','R24':'U11','R25':'U11','R28':'U11','C26':'U11','C27':'U11'}
for r in sorted((r for r in fps if r not in placed),key=lambda r:-(bbox(fps[r])[2]*bbox(fps[r])[3])):
 f=fps[r];anchor=placed.get(anchors.get(r),placed['U1']);ax,ay=anchor['x'],anchor['y'];options=[]
 for rot in [0,90]:
  f.SetOrientationDegrees(rot);dx,dy,w,h=bbox(f)
  for ix in range(4,int((W-w)*4)):
   for iy in range(19,int((H-h)*4)):
    x=ix/4+w/2;y=iy/4+h/2;box=(x-w/2-.12,y-h/2-.12,w+.24,h+.24)
    if box[0]<.3 or box[1]<4.5 or box[0]+box[2]>W-.3 or box[1]+box[3]>H-.3:continue
    if any(hit(box,z) for z in used['F']):continue
    options.append(((x-ax)**2+(y-ay)**2,x,y,rot))
 if not options:raise ValueError('No space '+r)
 _,x,y,rot=min(options);put(r,x,y,rot=rot)
# Full-width antenna keepout: stronger than module's built-in local all-layer keepout.
z=pcb.ZONE(b);z.SetIsRuleArea(True);z.SetLayerSet(pcb.LSET.AllCuMask());z.SetDoNotAllowZoneFills(True);z.SetDoNotAllowTracks(True);z.SetDoNotAllowVias(True);z.SetDoNotAllowPads(True)
p=z.Outline();p.NewOutline()
for x,y in [(0,0),(W,0),(W,4.5),(0,4.5)]:p.Append(mm(100+x),mm(100+y))
b.Add(z)
for a,c in [((0,0),(W,0)),((W,0),(W,H)),((W,H),(0,H)),((0,H),(0,0))]:
 s=pcb.PCB_SHAPE();s.SetShape(pcb.SHAPE_T_SEGMENT);s.SetStart(pt(100+a[0],100+a[1]));s.SetEnd(pt(100+c[0],100+c[1]));s.SetLayer(pcb.Edge_Cuts);s.SetWidth(mm(.05));b.Add(s)
t=pcb.PCB_TEXT(b);t.SetText('REV B0 - ENGINEERING DRAFT');t.SetPosition(pt(111,96));t.SetTextSize(pt(.8,.8));t.SetLayer(pcb.Dwgs_User);b.Add(t)
b.BuildListOfNets();pcb.SaveBoard(str(OUT/'pendant-rev-b.kicad_pcb'),b)
(OUT/'placement-report.json').write_text(json.dumps({'board_mm':[W,H,.8],'status':'PLACED_UNROUTED_NOT_FOR_ORDER','placements':placed,'antenna_keepout_mm':[0,0,W,4.5]},indent=2)+'\n')
print('Placed',len(placed),'parts on',W,H)
