"""Stretch only the rightmost case strip; exploratory geometry, not release."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
files={'lower':'ntcaflex-relocated-support-lower-trial.step','upper':'tab-clearance-upper-trial.step','sensor':'vendor/ntcaflex/NTCAFLEX05103HH.STEP','battery':'offset-pack-assembly-trial.step','board':'film-integration-integrated-board.step'}
s={k:cq.importers.importStep(str(O/f)).val()for k,f in files.items()}
sensor=s['sensor'].rotate((0,0,0),(1,0,0),90).rotate((0,0,0),(0,0,1),120).translate((12.9,-5,-2.32))
# Preserve the board, battery and supports. Shared affine map of both case halves
# beyond X=23 preserves their nominal mating geometry but changes local radii.
split=23.;scale=1+.45/1.3
clip=cq.Workplane('XY').box(20,60,40,centered=False).translate((split,-40,-20)).val()
mat=cq.Matrix([[scale,0,0,split*(1-scale)],[0,1,0,0],[0,0,1,0],[0,0,0,1]])
rows={};cases={}
for key in ('lower','upper'):
 original=s[key];right=original.intersect(clip).transformGeometry(mat)
 candidate=original.cut(clip).fuse(right).clean();cases[key]=candidate
 out=O/f'ntcaflex-expanded-right-{key}-trial.step';cq.exporters.export(candidate,str(out))
 b=candidate.BoundingBox()
 rows[key]={'valid':candidate.isValid(),'solids':len(candidate.Solids()),'size_mm':[b.xlen,b.ylen,b.zlen],'sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'checks':{k:{'overlap_mm3':candidate.intersect(v).Volume(),'distance_mm':candidate.distance(v)}for k,v in {'sensor':sensor,'battery':s['battery'],'board':s['board']}.items()}}
 print(key,rows[key],flush=True)
r={'status':'CASE_EXPANSION_TRIAL_NOT_ADOPTED','split_x_mm':split,'right_strip_x_scale':scale,'inner_wall_shift_at_x24_3_mm':.45,'outer_wall_shift_at_x25_mm':2*(scale-1),'case_results':rows,'halves_overlap_mm3':cases['lower'].intersect(cases['upper']).Volume(),'sources_sha256':{f:hashlib.sha256((O/f).read_bytes()).hexdigest()for f in files.values()},'limits':['Affine strip expansion changes corner radii and wall thickness; not final rounded-case design.','Exact GL maximum dimensions, sensor carrier, harness and print tolerances unqualified.','Original separator and fixed peg not updated; assembly not qualified.','No 16-hour runtime measurement.']}
(O/'ntcaflex-right-expansion-review.json').write_text(json.dumps(r,indent=2)+'\n')
