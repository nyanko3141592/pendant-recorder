"""Header-projection access screen, not a plug or finger clearance model."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
review=json.loads((O/'j2-position-review.json').read_text())
x0,x1,y0,y1,z0,z1=review['bounds_mm']
# Open bottom access to a connector on B side. Start just outside header body.
access=cq.Workplane('XY').box(x1-x0,y1-y0,z0+12,centered=(False,False,False)).translate((x0,y0,-12)).val()
objects=[('separator','battery-separator-study.step',(0,0,0)),('battery','dtp401525-xe-pack-max.step',(8.25,-13.5,-6.62)),('lower_case','retained-lower-case-study.step',(0,0,0))]
rows=[]
a=cq.Assembly(name='connector_access_screen');a.add(access,name='header_projection_access',color=cq.Color(1,.3,.2,.35))
for name,file,translation in objects:
 p=O/file;s=cq.importers.importStep(str(p)).val().translate(translation);v=access.intersect(s).Volume();rows.append({'part':name,'source':file,'sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'translation_mm':translation,'access_intersection_mm3':v,'blocks_header_projection':v>1e-6});a.add(s,name=name)
a.export(str(O/'connector-access-screen.step'))
r={'status':'HEADER_PROJECTION_ACCESS_SCREEN_NOT_PLUG_FIT','access_bounds_mm':[x0,x1,y0,y1,-12,z0],'header_pose_source':'j2-position-review.json','access_type':'Straight approach from bottom, entire provisional header XY silhouette; actual plug/finger envelope unknown','objects':rows,'conclusion':'Do not instruct buyer to mate connector after seating battery and separator in the lower case. This straight approach is obstructed in the current study. Connect with lower case, battery and separator clear, then route and install them. That alternative sequence still needs cable reach and handling validation.','limitations':['Header silhouette is a screening keepout, not minimum required mating area','No actual housing pose, wire bend, finger or tool geometry','No claim that angled approaches are impossible','No proof that pre-mating and subsequent battery placement works with 12mm length datum','PCB support during connection must be designed']}
(O/'connector-access-screen.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
