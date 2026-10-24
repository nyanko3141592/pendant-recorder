#!/usr/bin/env python3
"""Build an electrically netted, unrouted review board. Never a fabrication release."""
import json,csv,uuid
from pathlib import Path
import pcbnew as pcb
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'hardware/rev-a'
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
 lib,name=p['footprint'].split(':');path=OUT/'Pendant.pretty' if lib=='Pendant' else SYS/(lib+'.pretty')
 f=pcb.FootprintLoad(str(path),name)
 if not f:raise ValueError('Missing '+p['footprint'])
 f.SetFPID(pcb.LIB_ID(lib,name));f.SetReference(p['ref']);f.SetValue(p['value']);f.SetPath(pcb.KIID_PATH('/'+str(uuid.uuid5(uuid.NAMESPACE_URL,'pendant-recorder/rev-a/root'))+'/'+str(uuid.uuid5(uuid.NAMESPACE_URL,'pendant-recorder/rev-a/'+p['ref']))))
 f.Reference().SetVisible(False);f.Value().SetVisible(False)
 expected={q['number']:q for q in p['pins']};found=set()
 for pad in f.Pads():
  num=pad.GetNumber()
  if not num or (p['ref']=='J2' and num=='MP'):continue
  if num not in expected:errors.append(p['ref']+': unexpected pad '+num);continue
  found.add(num);net=expected[num]['net']
  if net:pad.SetNet(nets[net])
  else:
   ncname='unconnected-('+p['ref']+'-'+num+')';nc=pcb.NETINFO_ITEM(board,ncname);board.Add(nc);pad.SetNet(nc)
 for num in expected.keys()-found:errors.append(p['ref']+': missing pad '+num)
 board.Add(f);fps[p['ref']]=f
 bb=f.GetBoundingBox(False,False);dims[p['ref']]=(pcb.ToMM(bb.GetX()),pcb.ToMM(bb.GetY()),pcb.ToMM(bb.GetWidth()),pcb.ToMM(bb.GetHeight()))
if errors:raise ValueError('\n'.join(errors))
# Greedy rectangle packing is a placement feasibility check, NOT electrically optimized placement.
# First reserve connector/MCU stack, then pack remaining parts on both sides.
def overlap(a,b):return a[0]<b[0]+b[2]-1e-6 and a[0]+a[2]>b[0]+1e-6 and a[1]<b[1]+b[3]-1e-6 and a[1]+a[3]>b[1]+1e-6
def attempt(W,H):
 used={'F':[],'B':[]};placements={};margin=.35;gap=.2
 def put(ref,x,y,side,rot=0):
  dx,dy,w,h=dims[ref];w,h=(h,w) if rot else (w,h)
  box=(x-gap/2,y-gap/2,w+gap,h+gap)
  if x<margin or y<margin or x+w>W-margin or y+h>H-margin or any(overlap(box,b) for b in used[side]):return False
  used[side].append(box);placements[ref]=(x,y,side,rot);return True
 stack=['J2','U1','J1'];y=margin
 for r in stack:
  w,h=dims[r][2:]
  if not put(r,W-margin-w if r=='J2' else (W-w)/2,y,'F'):return None
  y+=h+gap
 # The programming probe needs a through-board corridor for alignment holes.
 if not put('J3',margin,margin,'B'):return None
 probe=used['B'][-1]
 if any(overlap(probe,b) for b in used['F']):return None
 used['F'].append(probe)
 # High-priority audio and memory on rear; all others fitted around.
 # Reserve a through-board acoustic corridor on both faces.
 if not put('U8',margin,H-margin-dims['U8'][3],'B'):return None
 acoustic=used['B'][-1]
 if any(overlap(acoustic,b) for b in used['F']):return None
 used['F'].append(acoustic)
 remaining=sorted((r for r in fps if r not in placements),key=lambda r: -(dims[r][2]*dims[r][3]))
 for r in remaining:
  options=[]
  for side in ('B','F'):
   xs={margin};ys={margin}
   for x,y,w,h in used[side]:xs.add(x+w+gap/2);ys.add(y+h+gap/2)
   for rot in (0,90):
    w,h=dims[r][2:];w,h=(h,w) if rot else (w,h)
    for y in sorted(ys):
     for x in sorted(xs):
      box=(x-gap/2,y-gap/2,w+gap,h+gap)
      if x+w<=W-margin and y+h<=H-margin and not any(overlap(box,b) for b in used[side]):options.append((y+h, x+w,side,rot,x,y))
  if not options:return None
  _,_,side,rot,x,y=min(options)
  assert put(r,x,y,side,rot)
 return placements
trials=[];solution=None
for W,H in [(17,28),(17,30),(18,32),(19,32),(20,34),(22,34),(24,36)]:
 pos=attempt(W,H);trials.append({'width_mm':W,'height_mm':H,'bounding_boxes_fit':bool(pos)})
 if pos:solution=(W,H,pos);break
if not solution:raise ValueError('No placement found')
W,H,pos=solution;origin=(100,100)
for r,(x,y,side,rot) in pos.items():
 f=fps[r]
 if side=='B':f.Flip(pt(0,0),False)
 f.SetOrientationDegrees(rot)
 bb=f.GetBoundingBox(False,False)
 f.SetPosition(pt(origin[0]+x-pcb.ToMM(bb.GetX()),origin[1]+y-pcb.ToMM(bb.GetY())))
for a,b in [((0,0),(W,0)),((W,0),(W,H)),((W,H),(0,H)),((0,H),(0,0))]:
 line=pcb.PCB_SHAPE();line.SetShape(pcb.SHAPE_T_SEGMENT);line.SetStart(pt(origin[0]+a[0],origin[1]+a[1]));line.SetEnd(pt(origin[0]+b[0],origin[1]+b[1]));line.SetLayer(pcb.Edge_Cuts);line.SetWidth(mm(.05));board.Add(line)
t=pcb.PCB_TEXT(board);t.SetText('A1 UNROUTED - NOT FOR FABRICATION');t.SetPosition(pt(100,96));t.SetTextSize(pt(.8,.8));t.SetLayer(pcb.Dwgs_User);board.Add(t)
board.BuildListOfNets();pcb.SaveBoard(str(OUT/'pendant-rev-a.kicad_pcb'),board)
report={'status':'UNROUTED_PLACEMENT_STUDY_NOT_FOR_FABRICATION','trials':trials,'board_mm':[W,H,.8],'parts':len(parts),'expected_logical_pins':sum(len(p['pins']) for p in parts),'tracks':len(board.GetTracks()),'limitations':['Greedy placement; not an optimized or routing-validated minimum','Battery/connector cable 3D fit not yet verified','Full sourcing and footprint audit pending'],'placements':{r:{'x_mm':round(pcb.ToMM(f.GetPosition().x)-100,4),'y_mm':round(pcb.ToMM(f.GetPosition().y)-100,4),'rotation_deg':f.GetOrientationDegrees(),'side':'bottom' if f.IsFlipped() else 'top'} for r,f in fps.items()}}
(OUT/'placement-report.json').write_text(json.dumps(report,indent=2)+'\n')
# Audit placements intentionally do not claim JLC-ready CPL or emit manufacturing Gerbers.
with (OUT/'placement-review.csv').open('w') as h:
 writer=csv.writer(h,lineterminator='\n');writer.writerow(['Reference','X_mm','Y_mm','Rotation','Side','Status'])
 for r,p in report['placements'].items():writer.writerow([r,p['x_mm'],p['y_mm'],p['rotation_deg'],p['side'],'REVIEW ONLY - NOT JLC CPL'])
print(json.dumps({k:v for k,v in report.items() if k!='placements'},indent=2))
