"""Local open relief for insulated sensor lead transition, separate trial."""
from pathlib import Path
import cadquery as cq,json,hashlib,math
O=Path(__file__).resolve().parent
source=O/'film-open-joint-pockets-lower-trial.step';lower=cq.importers.importStep(str(source)).val()
def pose(q):return q.rotate((0,0,0),(0,0,1),-28).translate((7.6,-25.5,0))
cuts=[pose(cq.Workplane('XY').box(1.16,1.5,3.55,centered=(True,False,False)).translate((x,21.85,-2.55)).val())for x in [-.95,.95]]
new=lower.cut(*cuts).clean();assert new.isValid() and len(new.Solids())==1
out=O/'film-lead-wrap-clearance-lower-trial.step';cq.exporters.export(new,str(out))
wraps=[pose(cq.Workplane('XY').box(.86,1.2,.74,centered=(True,False,False)).translate((x,22,-2.4)).val())for x in [-.95,.95]]
probes=[]
for x in [-.95,.95]:
 for y in [22.05,22.55,23.05]:
  point=pose(cq.Vertex.makeVertex(x,y,0)).Center();q=new.intersect(cq.Edge.makeLine(cq.Vector(point.x,point.y,-8),cq.Vector(point.x,point.y,1)))
  intervals=[[e.BoundingBox().zmin,e.BoundingBox().zmax]for e in q.Edges()]
  probes.append({'local_xy_mm':[x,y],'vertical_intervals_mm':intervals})
b0=lower.BoundingBox();b1=new.BoundingBox();r={'status':'LEAD_WRAP_CLEARANCE_TRIAL_NOT_ADOPTED','source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'output_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'valid':new.isValid(),'solid_count':len(new.Solids()),'removed_volume_mm3':lower.Volume()-new.Volume(),'same_bbox':all(abs(getattr(b0,k)-getattr(b1,k))<1e-7 for k in ['xmin','ymin','zmin','xmax','ymax','zmax']),'wrap_checks':[{'overlap_mm3':w.intersect(new).Volume(),'gap_mm':w.distance(new)}for w in wraps],'thickness_probes':probes,'limits':['Only six floor probes; no global minimum wall thickness guarantee.','Wrap is a provisional dimension budget; actual tape/transition/solder not qualified.','Re-slicing and printed mating/support recheck required.']}
(O/'film-lead-wrap-clearance-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
