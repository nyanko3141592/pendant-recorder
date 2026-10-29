from pathlib import Path
import cadquery as cq,json
O=Path(__file__).resolve().parent;ring=cq.importers.importStep(str(O/'thick-acoustic-duct-envelope.step')).val();board=cq.importers.importStep(str(O/'glue-case-candidate-integrated-board.step')).val();rows=[]
for i,s in enumerate(board.Solids()):
 v=ring.intersect(s).Volume()
 if v>1e-8:
  b=s.BoundingBox();rows.append({'solid_index':i,'intersection_mm3':v,'bbox_mm':{'min':[b.xmin,b.ymin,b.zmin],'max':[b.xmax,b.ymax,b.zmax]}})
r={'status':'COLLIDING_SOLID_BOUNDS_IDENTIFIED','collisions':rows,'attribution':'Compare bounds with current footprint and library body placement; solid indices are not component identifiers'};(O/'acoustic-colliding-solids.json').write_text(json.dumps(r,indent=2)+'\n');print(rows)
