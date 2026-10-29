import pcbnew,json,math,sys
from pathlib import Path
O=Path(__file__).resolve().parent;boardname=sys.argv[1] if len(sys.argv)>1 else 'signal-block-packing-22x27-NOT-ROUTED.kicad_pcb';b=pcbnew.LoadBoard(str(O/boardname));fps=list(b.GetFootprints());hits=[];features=[]
for f in fps:
 for p in f.Pads():
  drill=p.GetDrillSize()
  if not drill.x and not drill.y:continue
  # Conservative pad+hole box includes annulus and oval orientation via pad bounds.
  bb=p.GetBoundingBox();x,y,w,h=[pcbnew.ToMM(v) for v in [bb.GetX(),bb.GetY(),bb.GetWidth(),bb.GetHeight()]]
  feat={'ref':f.GetReference(),'pad':p.GetNumber(),'box_mm':[x,y,w,h],'drill_mm':[pcbnew.ToMM(drill.x),pcbnew.ToMM(drill.y)]};features.append(feat)
  for q in fps:
   if q==f or q.IsFlipped()==f.IsFlipped():continue
   qb=q.GetBoundingBox(False,False);X,Y,W,H=[pcbnew.ToMM(v) for v in [qb.GetX(),qb.GetY(),qb.GetWidth(),qb.GetHeight()]]
   if x<X+W and X<x+w and y<Y+H and Y<y+h:hits.append({'feature':feat,'opposite_component':q.GetReference()})
report={'status':'CONSERVATIVE_THROUGH_FEATURE_SCREEN','features':features,'opposite_side_envelope_hits':hits,'limitations':['Pad/hole bounding rectangles versus footprint library bounds; hits require resolution, not proof of solid collision.','No drill tolerances, copper clearances, solder fillet height or microphone acoustic duct evaluation.']}
(O/('through-fixed-feature-review.json' if boardname.startswith('through-') else 'through-feature-review.json')).write_text(json.dumps(report,indent=2)+'\n');print('features',len(features),'hits',[(h['feature']['ref'],h['feature']['pad'],h['opposite_component']) for h in hits])
