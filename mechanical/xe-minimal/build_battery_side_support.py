"""Add left-side separator support posts outside maximum battery envelope."""
from pathlib import Path
import cadquery as cq,json,hashlib,itertools
O=Path(__file__).resolve().parent
files={'lower':'film-battery-end-wide-250um-lower-trial.step','battery':'offset-pack-assembly-trial.step','separator':'film-roomier-joint-separator-trial.step','board':'film-integration-integrated-board.step','insulation':'film-sensor-insulation-transition.step'}
s={k:cq.importers.importStep(str(O/v)).val() for k,v in files.items()}
posts=[cq.Workplane('XY').box(1.05,2,4.78,centered=False).translate((-.4,y,-7)).val() for y in (-12,-21)]
new=s['lower'].fuse(*posts).clean();assert new.isValid() and len(new.Solids())==1
out=O/'film-battery-side-support-lower-trial.step';cq.exporters.export(new,str(out))
added=new.cut(s['lower']);checks={}
for k in ('battery','separator','board','insulation'):
 checks[k]={'added_overlap_mm3':added.intersect(s[k]).Volume(),'added_gap_mm':added.distance(s[k])}
proxy=s['separator'].translate((0,0,-.001))
checks['support_proxy']={'old_mm3':s['lower'].intersect(proxy).Volume(),'new_mm3':new.intersect(proxy).Volume(),'downshift_mm':.001}
poses=[]
for dx,dy,dz in itertools.product((-.1,0,.1),(-.25,0,.25),(-.1,0,.1)):
 poses.append(s['battery'].translate((dx,dy,dz)).intersect(new).Volume())
r={'status':'SIDE_SUPPORT_TRIAL_NOT_ADOPTED','sources_sha256':{v:hashlib.sha256((O/v).read_bytes()).hexdigest() for v in files.values()},'output_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'added_volume_mm3':added.Volume(),'checks':checks,'provisional_27_pose_battery_collisions':sum(v>1e-7 for v in poses),'limits':['Posts reach from floor to CAD separator seating plane; adhesion, stress and printed dimensions unqualified.','Battery displacement assumptions are exploratory, not validated printer tolerances.','Board model is not a guaranteed maximum component envelope; original harness and insertion path excluded.','Existing front/rear support loss is not repaired; new side supports require toolpath comparison and stable seating assessment.']}
(O/'film-battery-side-support-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r['checks'],indent=2));print('battery collisions',r['provisional_27_pose_battery_collisions'])
