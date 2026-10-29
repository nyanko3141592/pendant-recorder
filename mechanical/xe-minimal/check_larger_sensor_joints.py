from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
files={'lower':'film-axial-stop-seat-clearance-lower-trial.step','separator':'film-bottom-slot-separator-trial.step','board':'film-integration-integrated-board.step','battery':'offset-pack-assembly-trial.step'}
s={k:cq.importers.importStep(str(O/v)).val()for k,v in files.items()};rows=[]
for width,height in [(.9,.8),(1.1,1.0),(1.1,1.1)]:
 joints=[cq.Workplane('XY').box(width,3,height,centered=(True,False,True)).translate((x,23,-1.92)).val().rotate((0,0,0),(0,0,1),-28).translate((7.6,-25.5,0))for x in [-.9,.9]]
 q=cq.Compound.makeCompound(joints)
 rows.append({'width_mm':width,'height_mm':height,'center_z_mm':-1.92,'checks':{k:{'overlap_mm3':q.intersect(o).Volume(),'gap_mm':q.distance(o)}for k,o in s.items()},'joint_to_joint_gap_mm':joints[0].distance(joints[1])})
r={'status':'JOINT_ENVELOPE_EXPANSION_SCREEN_NOT_ADOPTED','sources_sha256':{k:hashlib.sha256((O/v).read_bytes()).hexdigest()for k,v in files.items()},'rows':rows,'limits':['Center placement held at wire axis; old .8 mm box was asymmetric vertically, so first row is a new centered comparison.','No realized wrap, minimum collar, pull strength or assembly path.','No geometry is changed by this screen.']}
(O/'film-larger-joint-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(rows,indent=2))
