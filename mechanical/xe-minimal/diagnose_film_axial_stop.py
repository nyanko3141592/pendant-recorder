from pathlib import Path
import cadquery as cq,json,sys
O=Path(__file__).resolve().parent;sys.path.insert(0,str(O));from wire_geometry import rounded
sep=cq.importers.importStep(str(O/'film-axial-stop-separator-trial.step')).val();lower=cq.importers.importStep(str(O/'film-axial-stop-lower-trial.step')).val()
def local(q):return q.translate((-7.6,25.5,0)).rotate((0,0,0),(0,0,1),28)
def record(q):
 b=local(q).BoundingBox();return {'volume_mm3':q.Volume(),'local_bbox':[b.xmin,b.ymin,b.zmin,b.xmax,b.ymax,b.zmax]}
r={'lower_solids':[record(q)for q in lower.Solids()],'wire_contacts':[]}
w=json.loads((O/'film-lap-lowered-terminals-review.json').read_text())
for i,row in enumerate(w['rows']):
 q=rounded(row['insulated_centerline_mm'],row['insulated_corner_radii_mm'])[0]
 for part in sep.intersect(q).Solids():r['wire_contacts'].append({'wire':i,**record(part)})
(O/'film-axial-stop-diagnostic.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
