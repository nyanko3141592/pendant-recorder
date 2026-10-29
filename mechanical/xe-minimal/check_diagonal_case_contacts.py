from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
p=O/'wider-right-support-lower-trial.step';lower=cq.importers.importStep(str(p)).val()
pose=lambda s:s.rotate((0,0,0),(0,0,1),-30).translate((8,-25.5,0))
film=pose(cq.Workplane('XY').box(4.1,26,.5,centered=(True,False,False)).translate((0,0,-2.32)).val())
joints=pose(cq.Compound.makeCompound([cq.Workplane('XY').box(.9,3,.8,centered=(True,False,False)).translate((x,23,-2.32)).val() for x in [-.9,.9]]))
rows=[];a=cq.Assembly(name='diagonal_case_contacts');a.add(lower,name='lower',color=cq.Color('#aaaaaa'))
for name,shape in [('film',film),('joints',joints)]:
 contact=shape.intersect(lower);pieces=[]
 for solid in contact.Solids():
  b=solid.BoundingBox();pieces.append({'volume_mm3':solid.Volume(),'bounds_mm':[b.xmin,b.ymin,b.zmin,b.xmax,b.ymax,b.zmax]})
 rows.append({'part':name,'contacts':pieces});a.add(contact,name=name+'_collision',color=cq.Color('#ee2222'))
a.export(str(O/'film-diagonal-case-contacts.step'))
(O/'film-diagonal-case-contacts.json').write_text(json.dumps({'status':'INTERFERENCE_LOCALIZATION_NOT_MODIFIED_CASE','lower_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'head_xy_mm':[8,-25.5],'angle_deg':30,'rows':rows},indent=2)+'\n');print(json.dumps(rows,indent=2))
