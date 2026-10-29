from pathlib import Path
import cadquery as cq,json
O=Path(__file__).resolve().parent
board=cq.importers.importStep(str(O/'tps-candidate-integrated-board.step')).val()
upper=cq.importers.importStep(str(O/'retained-upper-case-study.step')).val();lower=cq.importers.importStep(str(O/'retained-lower-case-study.step')).val()
pose=json.loads((O/'battery-over-connector-review.json').read_text())['selected_geometric_candidate'];bat=cq.importers.importStep(str(O/'dtp401525-xe-pack-max.step')).val().translate((pose['pack_x_min_mm']+7.75,-13.5,pose['pack_z_range_mm'][0]))
def cyl(r,z0,z1):return cq.Workplane('XY').circle(r).extrude(z1-z0).translate((18.1,-26,z0)).val()
# 5mm screw from seat z1.7 ends at -3.3; nut band -3.2..-2.4.
rows=[]
for r in [1.2,1.4,1.6,1.9]:
 a=cyl(r,1.1,upper.BoundingBox().zmax).cut(cyl(.65,1,1.71)).cut(cyl(1.05,1.7,upper.BoundingBox().zmax+.1))
 z=cyl(1.9,lower.BoundingBox().zmin,-2.4)
 rows.append({'upper_support_radius_mm':r,'upper_components_collision_mm3':a.intersect(board).Volume(),'upper_case_attachment_mm3':a.intersect(upper).Volume(),'lower_components_collision_mm3':z.intersect(board).Volume(),'lower_battery_collision_mm3':z.intersect(bat).Volume(),'lower_case_attachment_mm3':z.intersect(lower).Volume()})
report={'status':'RECESSED_SCREW_SUPPORT_SCREEN_NOT_ADOPTED','center':[18.1,-26],'hypothesis':{'screw_length_mm':5,'head_diameter_mm':1.8,'head_height_mm':.45,'seat_z_mm':1.7,'nut_z_mm':[-3.2,-2.4],'lower_support_radius_mm':1.9},'cases':rows,'limitations':['5mm part procurement not yet verified','Nut pocket and assembly retention not cut','Nominal models only; screw and case tolerances absent','Uses component model from pre-hole PCB; hole excluded by z ranges','Driver access and second fixing point unresolved']}
(O/'recessed-screw-support-screen.json').write_text(json.dumps(report,indent=2)+'\n');print(rows)
