import pcbnew,json
from pathlib import Path
O=Path(__file__).resolve().parent;b=pcbnew.LoadBoard(str(O/'placement-seed-NOT-ROUTED.kicad_pcb'));rows={}
for f in b.GetFootprints():
 o=f.GetPosition();bb=f.GetBoundingBox(False,False)
 rows[f.GetReference()]={'side':'B' if f.IsFlipped() else 'F','box':[pcbnew.ToMM(v) for v in [bb.GetX()-o.x,bb.GetY()-o.y,bb.GetWidth(),bb.GetHeight()]],'pads':{p.GetNumber():[pcbnew.ToMM(p.GetPosition().x-o.x),pcbnew.ToMM(p.GetPosition().y-o.y)] for p in f.Pads() if p.GetNumber()}}
 forpad=[]
 for pad in f.Pads():
  dr=pad.GetDrillSize()
  if dr.x or dr.y:
   bb=pad.GetBoundingBox();forpad.append([pcbnew.ToMM(bb.GetX()-o.x),pcbnew.ToMM(bb.GetY()-o.y),pcbnew.ToMM(bb.GetWidth()),pcbnew.ToMM(bb.GetHeight())])
 rows[f.GetReference()]['through']=forpad
(O/'pad-geometry.json').write_text(json.dumps(rows,indent=2)+'\n')
