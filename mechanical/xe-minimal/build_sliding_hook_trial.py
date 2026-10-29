from pathlib import Path
import cadquery as cq,json
O=Path(__file__).resolve().parent
lo=cq.importers.importStep(str(O/'raised-nut-screw-lower-trial.step')).val();hi=cq.importers.importStep(str(O/'raised-nut-screw-upper-trial.step')).val();board=cq.importers.importStep(str(O/'screw-candidate-integrated-board.step')).val()
sep=cq.importers.importStep(str(O/'battery-separator-study.step')).val()
pose=json.loads((O/'battery-over-connector-review.json').read_text())['selected_geometric_candidate']
bat=cq.importers.importStep(str(O/'dtp401525-xe-pack-max.step')).val().translate((pose['pack_x_min_mm']+7.75,-13.5,pose['pack_z_range_mm'][0]))
def box(x0,x1,y0,y1,z0,z1):return cq.Workplane('XY').box(x1-x0,y1-y0,z1-z0,centered=(False,False,False)).translate((x0,y0,z0)).val()
for x in [6,20]:
 hook=box(x-1,x+1,-.1,1.05,-1.8,-1.2)
 stem=box(x-1,x+1,.4,1.05,-1.8,.8)
 receiver=box(x-2,x+2,-.6,1.1,-1.1,-.3)
 lo=lo.fuse(receiver).cut(box(x-1.1,x+1.1,-.65,2.0,-1.9,-1.1)).cut(box(x-1.1,x+1.1,.3,2.0,-1.1,.41)).clean()
 hi=hi.fuse(hook).fuse(stem).clean()
checks={'upper_valid':hi.isValid(),'lower_valid':lo.isValid(),'upper_solids':len(hi.Solids()),'lower_solids':len(lo.Solids()),'closed_case_overlap_mm3':hi.intersect(lo).Volume(),'upper_board_overlap_mm3':hi.intersect(board).Volume(),'lower_board_overlap_mm3':lo.intersect(board).Volume(),'lower_battery_overlap_mm3':lo.intersect(bat).Volume(),'lower_separator_overlap_mm3':lo.intersect(sep).Volume()}
path=[]
for i in range(6):
 offset=i*.1;moving=hi.translate((0,offset,0));path.append({'offset_y_mm':offset,'lower_collision_mm3':moving.intersect(lo).Volume(),'board_collision_mm3':moving.intersect(board).Volume(),'battery_collision_mm3':moving.intersect(bat).Volume(),'separator_collision_mm3':moving.intersect(sep).Volume()})
approach=[]
for i in range(21):
 z=i*.25;moving=hi.translate((0,.5,z));approach.append({'raise_mm':z,'lower_collision_mm3':moving.intersect(lo).Volume(),'board_collision_mm3':moving.intersect(board).Volume(),'battery_collision_mm3':moving.intersect(bat).Volume(),'separator_collision_mm3':moving.intersect(sep).Volume()})
for name,s in [('upper',hi),('lower',lo)]:cq.exporters.export(s,str(O/('sliding-hook-'+name+'-trial.step')))
r={'status':'SLIDING_HOOK_CANDIDATE_NOT_ADOPTED','closed_checks':checks,'slide_samples':path,'vertical_approach_samples':approach,'limitations':['Sampled approach and slide only, not continuous sweep proof','Rigid nominal solids; no manufacturing tolerance or structural check','Battery leads and mating plug absent','Raised nut retention unresolved','Existing board edge support may restrict assembly motion']};(O/'sliding-hook-review.json').write_text(json.dumps(r,indent=2)+'\n');print(r)
