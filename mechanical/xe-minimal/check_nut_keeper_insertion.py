"""Exact axis-aligned swept boxes for rectangular keeper translation."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
files={'lower':'nut-keeper-recess-lower-study.step','board':'top-led-candidate-integrated-board.step','separator':'battery-separator-study.step','battery':'dtp401525-xe-pack-max.step'}
s={n:cq.importers.importStep(str(O/f)).val()for n,f in files.items()};s['battery']=s['battery'].translate((8.25,-13.5,-6.62))
def box(a,z):return cq.Workplane('XY').box(*(z[i]-a[i]for i in range(3)),centered=(False,False,False)).translate(a).val()
base=[19.85,-27.45,-3.1];top=[20.25,-24.55,-2.0]
rows=[]
for axis in range(3):
 for sign in [-1,1]:
  a=base.copy();z=top.copy()
  if sign>0:z[axis]+=5
  else:a[axis]-=5
  swept=box(a,z);rows.append({'axis':'XYZ'[axis],'approach_side':sign,'translation_mm':5,'collision_mm3':{n:swept.intersect(v).Volume()for n,v in s.items()}})
# A top insertion channel: candidate only, removes local side-post material.
a=base.copy();z=top.copy();z[2]=3.0;tool=box(a,z);lower=s['lower'].cut(tool).clean()
assert lower.isValid() and len(lower.Solids())==1
cq.exporters.export(lower,str(O/'nut-keeper-top-entry-lower-study.step'))
r={'status':'KEEPER_INSERTION_GEOMETRY_STUDY_NOT_RETAINED','source_sha256':{f:hashlib.sha256((O/f).read_bytes()).hexdigest()for f in files.values()},'exact_sweeps':rows,'preferred_approach':{'axis':'Y','side':1,'translation_mm':5,'reason':'No collision with current lower, board, separator or battery in the exact rectangular sweep','top_channel_required':False,'caveat':'Five millimetre local stroke only; tool access and original battery leads absent'},'top_entry_candidate':{'lower_valid':lower.isValid(),'lower_solids':len(lower.Solids()),'additional_removed_mm3':s['lower'].Volume()-lower.Volume(),'swept_lower_collision_mm3':tool.intersect(lower).Volume(),'swept_board_collision_mm3':tool.intersect(s['board']).Volume()},'limits':['Sweeps cover rigid nominal rectangular keeper only','Requires insertion before any intersecting component is fitted','No keeper lock, tolerance, finger access, or load verification','Original battery wiring and mating housing absent','Top channel is unadopted and may weaken nut support']}
(O/'nut-keeper-insertion-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
