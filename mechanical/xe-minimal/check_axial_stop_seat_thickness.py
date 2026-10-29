"""Sample vertical material intervals through the modified seat, not a strength test."""
from pathlib import Path
import cadquery as cq,json,hashlib,math
O=Path(__file__).resolve().parent
files={'before':'film-axial-stop-relieved-lower-trial.step','after':'film-axial-stop-seat-clearance-lower-trial.step'}
shapes={k:cq.importers.importStep(str(O/v)).val() for k,v in files.items()}
rows=[];a=math.radians(-28)
for i in range(39):
 x=-1.9+i*.1
 for j in range(14):
  y=22.75+j*.1;X=7.6+x*math.cos(a)-y*math.sin(a);Y=-25.5+x*math.sin(a)+y*math.cos(a)
  line=cq.Edge.makeLine(cq.Vector(X,Y,-8),cq.Vector(X,Y,0))
  intervals={k:sorted([[e.BoundingBox().zmin,e.BoundingBox().zmax]for e in s.intersect(line).Edges()])for k,s in shapes.items()}
  if intervals['before']!=intervals['after']:
   rows.append({'local_xy_mm':[x,y],'vertical_intervals_mm':intervals,'after_thicknesses_mm':[b-a for a,b in intervals['after']],'modified_interval_thicknesses_mm':[b-a for a,b in intervals['after'] if not any(abs(a-c)<1e-7 and abs(b-d)<1e-7 for c,d in intervals['before'])]})
assert rows
r={'status':'SAMPLED_GEOMETRY_NOT_STRENGTH_QUALIFICATION','source_sha256':{k:hashlib.sha256((O/v).read_bytes()).hexdigest()for k,v in files.items()},'grid_mm':.1,'changed_sample_count':len(rows),'minimum_remaining_vertical_interval_mm':min(t for r in rows for t in r['after_thicknesses_mm']),'minimum_modified_seat_interval_mm':min(t for r in rows for t in r['modified_interval_thicknesses_mm']),'rows':rows,'limits':['Only vertical intervals on a 0.1 mm grid, not global minimum wall thickness.','No PLA strength, creep, layer adhesion or manufacturing tolerance qualification.']}
(O/'film-axial-stop-seat-thickness-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps({k:v for k,v in r.items()if k!='rows'},indent=2))
