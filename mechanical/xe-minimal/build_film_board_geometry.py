"""Mechanical-only depopulated TH1 study; PCB/netlist/BOM unchanged."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
board=O/'ncu-candidate-integrated-board.step';sensor=O/'ncu18-drawing-envelope-study.step'
b=cq.importers.importStep(str(board)).val();t=cq.importers.importStep(str(sensor)).val()
solids=b.Solids();matches=[]
for i,s in enumerate(solids):
 if abs(s.Volume()-t.Volume())<1e-7 and s.distance(t)<1e-7:
  if abs(s.intersect(t).Volume()-t.Volume())<1e-7: matches.append(i)
assert len(matches)==1,matches
kept=[s for i,s in enumerate(solids) if i not in matches];out=cq.Compound.makeCompound(kept);assert out.isValid()
p=O/'film-sensor-depopulated-board-study.step';cq.exporters.export(out,str(p))
bb=t.BoundingBox()
r={'status':'TH1_BODY_REMOVED_GEOMETRY_ONLY_NOT_ELECTRICAL_CHANGE','sources_sha256':{x.name:hashlib.sha256(x.read_bytes()).hexdigest() for x in [board,sensor]},'source_solid_count':len(solids),'output_solid_count':len(kept),'removed_solid_indices':matches,'removed_volume_mm3':t.Volume(),'removed_bounds_mm':[bb.xmin,bb.ymin,bb.zmin,bb.xmax,bb.ymax,bb.zmax],'output_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'limits':['Only exact matching TH1 body removed; copper pads and PCB retained.','No schematic, PCB, BOM, manufacturing or electrical qualification change.','Sensor wiring, solder and insulation not included in this board-only geometry.']}
(O/'film-sensor-depopulated-board-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
