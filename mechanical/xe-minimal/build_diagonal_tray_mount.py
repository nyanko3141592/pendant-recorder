"""Case-integrated pedestal for provisional terminal tray; no load qualification."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
files={'lower':'diagonal-film-lower-trial.step','tray':'diagonal-joint-tray-trial.step','board':'film-sensor-depopulated-board-study.step','battery':'offset-pack-assembly-trial.step','separator':'diagonal-bridge-separator-trial.step','upper':'tab-clearance-upper-trial.step'}
s={k:cq.importers.importStep(str(O/v)).val() for k,v in files.items()}
floor=s['lower'].BoundingBox().zmin+.8
rows=[];models={}
for x,y in [(18.5,-4.5),(19,-4.5),(19.5,-4.5)]:
 post=cq.Workplane('XY').box(1.2,1.2,-2.70-floor+.1,centered=(True,True,False)).translate((x,y,floor-.1)).val()
 row={'center_xy_mm':[x,y],'post_tray_join_volume_mm3':post.intersect(s['tray']).Volume(),'post_lower_join_volume_mm3':post.intersect(s['lower']).Volume(),'post_overlap_mm3':{k:post.intersect(s[k]).Volume() for k in ['board','battery','separator','upper']}}
 merged=s['lower'].fuse(post,s['tray']).clean();row.update(valid=merged.isValid(),solid_count=len(merged.Solids()))
 row['nominal_joined_clear']=row['valid'] and row['solid_count']==1 and row['post_tray_join_volume_mm3']>.05 and row['post_lower_join_volume_mm3']>.05 and max(row['post_overlap_mm3'].values())<1e-8
 if row['nominal_joined_clear']:models[len(rows)]=merged
 rows.append(row)
selected=next(iter(models),None)
if selected is not None:cq.exporters.export(models[selected],str(O/'diagonal-tray-mounted-lower-trial.step'))
r={'status':'TRAY_PEDESTAL_GEOMETRY_NOT_ADOPTED','sources_sha256':{k:hashlib.sha256((O/v).read_bytes()).hexdigest() for k,v in files.items()},'rows':rows,'selected_row':selected,'limits':['Tray to pre-existing lower-case geometry clearance remains only 0.074 mm.','Pedestal load, print overhangs and cap/adhesive retention unqualified.','Original battery leads and assembly access missing.','Only pedestal evaluated for new collisions; no full printed assembly qualification.']}
(O/'diagonal-tray-mount-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
