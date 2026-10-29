"""Local wall/support screen for widened battery end relief."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
files={'old':'film-lead-wrap-clearance-lower-trial.step','new':'film-battery-end-wide-250um-lower-trial.step','separator':'film-roomier-joint-separator-trial.step','insulation':'film-sensor-insulation-transition.step'}
s={k:cq.importers.importStep(str(O/v)).val() for k,v in files.items()}
removed=s['old'].cut(s['new'])
checks={}
for key in ('separator','insulation'):
 checks[key]={'removed_material_distance_mm':removed.distance(s[key]),'old_gap_mm':s['old'].distance(s[key]),'new_gap_mm':s['new'].distance(s[key])}
# A tiny downward overlap is a contact-footprint comparison, not physical loading.
probe=s['separator'].translate((0,0,-.001))
checks['separator_support_proxy']={'downward_offset_mm':.001,'old_intersection_mm3':s['old'].intersect(probe).Volume(),'new_intersection_mm3':s['new'].intersect(probe).Volume()}
rows=[]
for x in (.8,1.,4.,8.,12.,16.,16.5):
 for z in (-6.72,-6.5,-4.5,-2.5,-2.32):
  for side,start,end in [('negative',-29,-26.9),('positive',-.1,2)]:
   q=s['new'].intersect(cq.Edge.makeLine(cq.Vector(x,start,z),cq.Vector(x,end,z)))
   intervals=[[e.BoundingBox().ymin,e.BoundingBox().ymax] for e in q.Edges()]
   rows.append({'x':x,'z':z,'side':side,'material_y_intervals_mm':intervals})
r={'status':'GEOMETRIC_LOCAL_SUPPORT_SCREEN_NOT_QUALIFIED','sources_sha256':{v:hashlib.sha256((O/v).read_bytes()).hexdigest() for v in files.values()},'checks':checks,'end_wall_ray_probes':rows,'minimum_sampled_interval_mm':min(b-a for row in rows for a,b in row['material_y_intervals_mm']),'limits':['Sampled ray thickness is not global wall thickness or mechanical strength.','Downshift contact proxy does not prove printed seating; previous 0.06mm print seating gap remains unresolved.','Sensor insulation envelope is not the complete sensor retainer, film contact or thermal path.','Candidate requires new toolpaths and physical fit checks; not adopted.']}
(O/'film-battery-wide-relief-support-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps({k:v for k,v in r.items() if k in ('checks','minimum_sampled_interval_mm')},indent=2))
