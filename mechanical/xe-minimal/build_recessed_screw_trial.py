from pathlib import Path
import json,math,cadquery as cq
O=Path(__file__).resolve().parent
board=cq.importers.importStep(str(O/'tps-candidate-integrated-board.step')).val()
upper=cq.importers.importStep(str(O/'retained-upper-case-study.step')).val();lower=cq.importers.importStep(str(O/'retained-lower-case-study.step')).val()
def cyl(r,z0,z1):return cq.Workplane('XY').circle(r).extrude(z1-z0).translate((18.1,-26,z0)).val()
# Pocket .1mm clearance per flat; nominal nut 2.5AF x .8 high.
post=cyl(1.9,lower.BoundingBox().zmin,-1.8)
pocket=cq.Workplane('XY').polygon(6,2.7/math.cos(math.pi/6)).extrude(.9).translate((18.1,-26,-3.3)).val()
# Side loading slot from the interior/right side of case; retention unresolved.
slot=cq.Workplane('XY').box(5,2.7,.9,centered=(False,True,False)).translate((18.1,-26,-3.3)).val()
post=post.cut(pocket).cut(slot).cut(cyl(.65,-3.5,-1.7))
up=cyl(1.6,1.1,upper.BoundingBox().zmax).cut(cyl(.65,1,1.71)).cut(cyl(1.05,1.7,upper.BoundingBox().zmax+.1))
lo=lower.fuse(post).clean();hi=upper.fuse(up).cut(cyl(1.05,1.7,upper.BoundingBox().zmax+.1)).clean()
roof=cyl(1.9,-2.4,-1.8).cut(cyl(.65,-2.5,-1.7))
r={'status':'RECESSED_SCREW_JOINT_TRIAL_NOT_ADOPTED','nominal_dimensions_mm':{'screw_length':5,'seat_z':1.7,'tip_z':-3.3,'nut_top_z':-2.4,'nut_bottom_z':-3.2,'nut_roof_thickness':.6,'upper_seat_thickness':.6,'nominal_thread_overlap':.8,'tip_beyond_nut':.1},'checks':{'roof_component_collision_mm3':roof.intersect(board).Volume(),'lower_support_component_collision_mm3':post.intersect(board).Volume(),'upper_support_component_collision_mm3':up.intersect(board).Volume(),'upper_valid':hi.isValid(),'lower_valid':lo.isValid(),'upper_solids':len(hi.Solids()),'lower_solids':len(lo.Solids()),'case_halves_intersection_mm3':lo.intersect(hi).Volume()},'limitations':['Nut side-loading slot needs retention and insertion access','Thread runout/chamfer and dimensional tolerances not included in nominal overlap','Case stiffness/creep/torque not qualified','One fixing point only','Original battery leads/plug omitted','Component model is pre-hole PCB; supports are outside PCB z band']}
nut=cq.Workplane('XY').polygon(6,2.5/math.cos(math.pi/6)).extrude(.8).translate((18.1,-26,-3.2)).val()
path=[]
for i in range(17):
 offset=i*.25
 path.append({'offset_x_mm':offset,'lower_case_collision_mm3':nut.translate((offset,0,0)).intersect(lo).Volume()})
r['nut_insertion_samples']=path
r['nut_insertion_max_collision_mm3']=max(v['lower_case_collision_mm3']for v in path)
r['limitations'].append('Sampled nut path is not a continuous sweep proof; install nut before PCB and battery is a proposed sequence only')
for name,s in [('upper',hi),('lower',lo)]:cq.exporters.export(s,str(O/('recessed-screw-'+name+'-trial.step')))
(O/'recessed-screw-joint-review.json').write_text(json.dumps(r,indent=2)+'\n');print(r)
