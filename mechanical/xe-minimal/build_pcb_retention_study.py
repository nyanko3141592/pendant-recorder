"""Split-case edge supports; nominal geometry only, not snap-fit qualification."""
from pathlib import Path
import json,hashlib,cadquery as cq
O=Path(__file__).resolve().parent;I=json.loads((O/'board-inventory.json').read_text());sites=json.loads((O/'pcb-support-pad-review.json').read_text())['candidates'];selected=[('left',3),('left',22),('right',8),('rear',21)]
assert all(any(x['side']==s and x['center_along_edge_mm']==c for x in sites) for s,c in selected)
lower=cq.importers.importStep(str(O/'supported-lower-case-study.step')).val();upper=cq.importers.importStep(str(O/'separator-case-upper-study.step')).val();stack=cq.importers.importStep(str(O/'separator-stack-study.step')).val();board=cq.importers.importStep(str(O/'pcb-partial-with-body-envelopes.step')).val();th=I['board_thickness_mm'];checks=[]
for side,c in selected:
 if side=='left':x0,x1,y0,y1=-.5,.7,-c-.75,-c+.75
 elif side=='right':x0,x1,y0,y1=23.3,24.5,-c-.75,-c+.75
 else:x0,x1,y0,y1=c-.75,c+.75,-27.7,-26.3
 for name,base,z in [('lower',lower,-.3),('upper',upper,th+.1)]:
  lip=cq.Workplane('XY').box(x1-x0,y1-y0,.3,centered=(True,True,False)).translate(((x0+x1)/2,(y0+y1)/2,z)).val();overlap=lip.intersect(base).Volume();collision=sum(lip.intersect(t).Volume() for t in stack.Solids());assert overlap>0 and collision<1e-5,(side,c,name,overlap,collision)
  checks.append({'side':side,'position_mm':c,'half':name,'case_overlap_mm3':overlap,'stack_intersection_mm3':collision})
  if name=='lower':lower=lower.fuse(lip).clean()
  else:upper=upper.fuse(lip).clean()
assert lower.isValid() and upper.isValid() and len(lower.Solids())==len(upper.Solids())==1
# Sample vertical insertion, before adding the lid. This is not a continuous swept-solid proof.
sweep=[]
for i in range(41):
 z=i*.25;v=board.translate((0,0,z));collision=sum(lower.intersect(t).Volume() for t in v.Solids());sweep.append({'raise_mm':z,'collision_mm3':collision})
for name,s in [('lower',lower),('upper',upper)]:cq.exporters.export(s,str(O/('retained-'+name+'-case-study.step')))
a=cq.Assembly(name='pcb_retention_study');a.add(lower,name='lower_with_supports');a.add(upper,name='upper_with_stops');a.add(stack,name='electronics_separator_pack');out=O/'retained-case-assembly-study.step';a.export(str(out))
r={'status':'NOMINAL_RETENTION_GEOMETRY_NOT_RELEASED','pcb_sha256':I['pcb_sha256'],'output_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'checks':checks,'nominal_board_vertical_play_mm':.1,'insertion_samples':sweep,'max_sample_collision_mm3':max(x['collision_mm3'] for x in sweep),'limitations':['0.3mm lips require material, stiffness and manufacturing tolerance review','Board and case tolerance stack not assigned','No lid closure mechanism; upper stops alone do not retain assembly','Sampled path is not full continuous sweep and excludes battery leads','Approximate package models and mating housing remain unqualified']};(O/'pcb-retention-study-review.json').write_text(json.dumps(r,indent=2)+'\n');print(r['max_sample_collision_mm3'])
