from pathlib import Path
import json,hashlib,cadquery as cq
O=Path(__file__).resolve().parent;I=json.loads((O/'tmux-candidate-board-inventory.json').read_text());parts={p['ref']:p for p in I['parts']};h=I['board_thickness_mm'];a=cq.Assembly(name='tmux_additions_only');rows=[]
selection_path=O.parents[1]/'docs/procurement/xe-c34-murata-candidate.json'
selection=json.loads(selection_path.read_text())
length,width,thickness=selection['dimensions_max_LWT_mm']
for ref,dims,provisional in [('U16',(2.65,2.4,1.1),False),('C34',(width,length,thickness),False)]:
 p=parts[ref];assert p['rotation_deg']==90;assert p['side']==('F' if ref=='U16' else 'B');x,y=p['position_mm'];z=h if p['side']=='F' else -dims[2];s=cq.Workplane('XY').box(*dims,centered=(True,True,False)).val().translate((x,-y,z));assert s.isValid();file=O/(ref.lower()+'-tmux-candidate-envelope.step');cq.exporters.export(s,str(file));a.add(s,name=ref,color=cq.Color('#d9a439' if ref=='U16' else '#527cc2'));bb=s.BoundingBox();checks=[]
 for case in ['retained-upper-case-study.step','retained-lower-case-study.step','battery-separator-study.step']:
  body=cq.importers.importStep(str(O/case)).val();checks.append({'study':case,'intersection_volume_mm3':s.intersect(body).Volume(),'distance_mm':s.distance(body)})
 rows.append({'ref':ref,'dimensions_in_step_axes_mm':dims,'provisional':provisional,'bounds_mm':[bb.xmin,bb.xmax,bb.ymin,bb.ymax,bb.zmin,bb.zmax],'study_checks':checks,'file':file.name})
a.export(str(O/'tmux-candidate-additions.step'))
r={'status':'ADDITIONAL_ENVELOPES_ONLY_NOT_COMPLETE_ASSEMBLY','pcb_sha256':I['pcb_sha256'],'C34_selection_file':str(selection_path.relative_to(O.parents[1])),'C34_selection_sha256':hashlib.sha256(selection_path.read_bytes()).hexdigest(),'parts':rows,'U16_basis':'TI DCK0005A 4214834/G PDF p35; lead span max2.4, body length2.15 plus 0.25 flash each end =2.65, seating height max1.1. Cuboid after90deg rotation.','C34_basis':'Murata GRM155R71C104KA88J; manufacturer GRM155R71C104KA88-01A reference sheet dated 2024-12-25 p2: L1.0+/-0.05 W0.5+/-0.05 T0.5+/-0.05 mm; maximum cuboid rotated90deg; candidate selection only','limitations':['Zero solder standoff is a visualization datum','Existing case studies are incomplete historical geometry, not a finished fit target','No wire, mating plug, full component or battery swelling clearance proof','No case height or overall size acceptance follows from these local intersections']};(O/'tmux-candidate-mechanical-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
