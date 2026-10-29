"""Classify disconnected separator pieces by geometric contacts and location."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
files={'separator':'ntcaflex-open-separator-trial.step','lower':'ntcaflex-relocated-support-lower-trial.step','battery':'offset-pack-assembly-trial.step','board':'film-integration-integrated-board.step'}
s={k:cq.importers.importStep(str(O/f)).val()for k,f in files.items()};rows=[]
for i,part in enumerate(sorted(s['separator'].Solids(),key=lambda q:q.Volume())):
 b=part.BoundingBox();rows.append({'piece':i,'volume_mm3':part.Volume(),'bounds_mm':[b.xmin,b.ymin,b.zmin,b.xmax,b.ymax,b.zmax],'lower_downshift_1um_overlap_mm3':part.translate((0,0,-.001)).intersect(s['lower']).Volume(),'board_distance_mm':part.distance(s['board']),'battery_distance_mm':part.distance(s['battery'])})
r={'status':'FRAGMENT_ROLE_SCREEN_NOT_REMOVAL_APPROVAL','source_sha256':{f:hashlib.sha256((O/f).read_bytes()).hexdigest()for f in files.values()},'pieces':rows,'limits':['Contact proxy does not prove bearing capacity or retention.','Pieces can also provide electrical separation without contact; removal requires replacement insulation assessment.','No piece removed from candidate by this analysis.']}
(O/'ntcaflex-fragment-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(rows,indent=2))
