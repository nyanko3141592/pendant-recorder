from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent;src=O/'adhesive-pocket-032-lower-trial.step';s=cq.importers.importStep(str(src)).val();old=s
# Separator begins at X0.3; leave0.1 nominal clearance to its insertion prism.
for yc in [-3,-22]:
 cutter=cq.Workplane('XY').box(.6,1.7,.5,centered=(False,True,False)).translate((.2,yc,-.4)).val();s=s.cut(cutter)
s=s.clean();assert s.isValid()and len(s.Solids())==1
out=O/'assembly-access-lower-trial.step';cq.exporters.export(s,str(out))
rows=[]
for name,fn,pose in [('separator','battery-separator-study.step',(0,0,0)),('pack','dtp401525-xe-pack-max.step',(8.25,-13.5,-6.62))]:
 part=cq.importers.importStep(str(O/fn)).val().translate(pose);b=part.BoundingBox()
 # Bounding prism contains the full translated part for every dz in0..20.
 prism=cq.Workplane('XY').box(b.xlen,b.ylen,b.zlen+20,centered=(False,False,False)).translate((b.xmin,b.ymin,b.zmin)).val();hit=s.intersect(prism)
 rows.append({'part':name,'continuous_z_sweep_enclosing_prism_overlap_mm3':hit.Volume(),'clearance_to_case_mm':s.distance(prism)})
# Flat support footprint within nominal PCB24x27, at underside Z0.
boardface=cq.Face.makeFromWires(cq.Workplane('XY').rect(24,27).val()).translate((12,-13.5,0))
def contact(part):
 return sum(f.intersect(boardface).Area()for f in part.Faces()if f.geomType()=='PLANE'and abs(f.BoundingBox().zmin)<1e-7 and abs(f.BoundingBox().zmax)<1e-7)
r={'status':'ASSEMBLY_ACCESS_GEOMETRY_TRIAL_NOT_ADOPTED','source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'trim_x_boundary_mm':.2,'sweep_screens':rows,'nominal_board_support_area_before_mm2':contact(old),'nominal_board_support_area_after_mm2':contact(s),'removed_volume_mm3':old.Volume()-s.Volume(),'limits':['Only pack and separator bounding prisms; board, housing, wires, fingers and tools not included','Left PCB bearing width reduced to0.2mm; printability/strength/tolerances not qualified','No full assembly approval; existing manufacturing package unchanged']};(O/'assembly-access-support-review.json').write_text(json.dumps(r,indent=2));print(json.dumps(r,indent=2))
