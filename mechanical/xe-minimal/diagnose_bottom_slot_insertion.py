from pathlib import Path
import cadquery as cq,json
from wire_geometry import rounded
O=Path(__file__).resolve().parent
sep=cq.importers.importStep(str(O/'film-bottom-slot-separator-trial.step')).val();r=json.loads((O/'film-lap-lowered-terminals-review.json').read_text());rows=[]
for i,row in enumerate(r['rows']):
 w=rounded(row['insulated_centerline_mm'],row['insulated_corner_radii_mm'])[0]
 for dz in [-.2,-.4,-.8]:
  collision=w.translate((0,0,dz)).intersect(sep)
  for q in collision.Solids():
   b=q.translate((-7.6,25.5,0)).rotate((0,0,0),(0,0,1),28).BoundingBox()
   rows.append({'wire_index':i,'dz_mm':dz,'volume_mm3':q.Volume(),'sensor_local_bounds_mm':[b.xmin,b.ymin,b.zmin,b.xmax,b.ymax,b.zmax]})
(O/'film-bottom-slot-insertion-diagnostic.json').write_text(json.dumps(rows,indent=2)+'\n');print(json.dumps(rows,indent=2))
