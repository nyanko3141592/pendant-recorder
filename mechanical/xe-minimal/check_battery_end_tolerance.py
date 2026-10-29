"""Provisional positioning screen, not a validated print tolerance budget."""
from pathlib import Path
import hashlib,itertools,json
import cadquery as cq
O=Path(__file__).resolve().parent
source=O/'film-battery-end-clearance-review.json';review=json.loads(source.read_text())
pack_path=O/'offset-pack-assembly-trial.step';pack=cq.importers.importStep(str(pack_path)).val()
rows=[]
for row in review['candidates']:
 p=O/row['path'];assert hashlib.sha256(p.read_bytes()).hexdigest()==row['sha256']
 lower=cq.importers.importStep(str(p)).val();m=row['margin_per_end_mm'];cases=[]
 for dx,dy,dz in itertools.product((-.1,0,.1),(-m,0,m),(-.1,0,.1)):
  shifted=pack.translate((dx,dy,dz));volume=shifted.intersect(lower).Volume()
  cases.append({'offset_mm':[dx,dy,dz],'intersection_mm3':volume,'collision':volume>1e-7})
 rows.append({'candidate':row['path'],'sha256':row['sha256'],'cases':cases,'colliding_cases':sum(c['collision'] for c in cases),'maximum_overlap_mm3':max(c['intersection_mm3'] for c in cases)})
r={'status':'PROVISIONAL_DISPLACEMENT_SCREEN_NOT_PRINT_QUALIFICATION','sources_sha256':{source.name:hashlib.sha256(source.read_bytes()).hexdigest(),pack_path.name:hashlib.sha256(pack_path.read_bytes()).hexdigest()},'assumption':'X/Z offsets +/-0.1mm are an exploratory engineering screen, not measured A1 mini tolerance or user-specified allowance. Y offsets equal each candidate end clearance.','results':rows,'limits':['Tests 27 final poses per candidate, not a continuous insertion sweep or rotation tolerance.','Only battery body versus lower case; harness, plug, sensor and upper assembly are not evaluated here.','A zero intersection at exact end travel may mean contact and is not installation clearance.']}
(O/'film-battery-end-tolerance-review.json').write_text(json.dumps(r,indent=2)+'\n')
for row in rows:print(row['candidate'],row['colliding_cases'],'/27 collisions; max volume',row['maximum_overlap_mm3'])
