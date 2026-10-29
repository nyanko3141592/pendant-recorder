import pcbnew
import wx
app=wx.App(False)
import json,sys
from pathlib import Path
O=Path(__file__).resolve().parent
screen=sys.argv[1] if len(sys.argv)>1 else 'packing-screen.json'
prefix=screen.removesuffix('-screen.json')
r=json.loads((O/screen).read_text());best=r['best_found'];assert best
b=pcbnew.LoadBoard(str(O/'placement-seed-NOT-ROUTED.kicad_pcb'));fps={f.GetReference():f for f in b.GetFootprints()}
for p in best['placements']:fps[p['ref']].SetPosition(pcbnew.VECTOR2I(pcbnew.FromMM(p['x_mm']),pcbnew.FromMM(p['y_mm'])))
print('moved',flush=True)
for d in list(b.GetDrawings()):
 if d.GetLayer()==pcbnew.Edge_Cuts:b.RemoveNative(d)
print('removed edges',flush=True)
w,h=best['board_mm']
for start,end in [((0,0),(w,0)),((w,0),(w,h)),((w,h),(0,h)),((0,h),(0,0))]:
 s=pcbnew.PCB_SHAPE(b);s.SetShape(pcbnew.SHAPE_T_SEGMENT);s.SetLayer(pcbnew.Edge_Cuts);s.SetWidth(pcbnew.FromMM(.05));s.SetStart(pcbnew.VECTOR2I(*(pcbnew.FromMM(v) for v in start)));s.SetEnd(pcbnew.VECTOR2I(*(pcbnew.FromMM(v) for v in end)));b.AddNative(s);s.thisown=False
print('added edges',flush=True)
out=O/f'{prefix}-{w}x{h}-NOT-ROUTED.kicad_pcb';pcbnew.SaveBoard(str(out),b)
b=pcbnew.LoadBoard(str(out)); boxes=[];overlaps=[]
for f in b.GetFootprints():
 bb=f.GetBoundingBox(False,False);x,y,W,H=[pcbnew.ToMM(v) for v in [bb.GetX(),bb.GetY(),bb.GetWidth(),bb.GetHeight()]]
 assert x>=0 and y>=0 and x+W<=w and y+H<=h,f.GetReference()
 for ref,side,X,Y,A,B in boxes:
  if side==f.IsFlipped() and x<X+A and X<x+W and y<Y+B and Y<y+H:overlaps.append([ref,f.GetReference()])
 boxes.append((f.GetReference(),f.IsFlipped(),x,y,W,H))
assert not overlaps,overlaps
assert not list(b.GetTracks())
(O/f'{prefix}-board-review.json').write_text(json.dumps({'status':'SAVED_BOARD_ENVELOPES_WITHIN_OUTLINE_NO_SAME_SIDE_OVERLAP','board_mm':[w,h],'footprints':len(boxes),'same_side_envelope_overlaps':overlaps,'warning':'Unrouted geometry experiment. Electrical adjacency, USB protrusion, case and battery harness not qualified.'},indent=2)+'\n')
print('Saved and reloaded',out.name,';89 footprints; no envelope overlaps.')
