import pcbnew as k
import json,math,sys
from pathlib import Path
O=Path(__file__).resolve().parent;remaining=len(sys.argv)>1 and sys.argv[1]=='remaining';b=k.LoadBoard(str(O/('remaining-ground-candidate.kicad_pcb' if remaining else 'ground-stitch-candidate.kicad_pcb')));hits=[];minimum=99
for t in b.GetTracks():
 if not isinstance(t,k.PCB_VIA):continue
 x,y=k.ToMM(t.GetPosition().x),k.ToMM(t.GetPosition().y)
 for f in b.GetFootprints():
  for p in f.Pads():
   bb=p.GetBoundingBox();X,Y,W,H=[k.ToMM(v) for v in [bb.GetX(),bb.GetY(),bb.GetWidth(),bb.GetHeight()]]
   distance=math.hypot(max(X-x,0,x-X-W),max(Y-y,0,y-Y-H));clearance=distance-k.ToMM(t.GetDrillValue())/2;minimum=min(minimum,clearance)
   if clearance<0:hits.append({'ref':f.GetReference(),'pad':p.GetNumber(),'drill_overlap_mm':-clearance})
report={'status':'DRILL_TO_PAD_BOUNDING_RECTANGLE_SCREEN','drill_overlap_hits':hits,'minimum_nominal_drill_edge_to_pad_bbox_mm':minimum,'warning':'Nominal geometry only; drill registration and soldermask/tenting fabrication rules not qualified.'};(O/('remaining-ground-via-review.json' if remaining else 'ground-via-geometry-review.json')).write_text(json.dumps(report,indent=2)+'\n');print(report)
