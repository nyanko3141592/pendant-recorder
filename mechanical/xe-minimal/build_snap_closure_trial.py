"""Local cantilever latch trial within existing exterior; material unqualified."""
from pathlib import Path
import json, hashlib
import cadquery as cq
O=Path(__file__).resolve().parent
lower=cq.importers.importStep(str(O/'retained-lower-case-study.step')).val()
upper=cq.importers.importStep(str(O/'retained-upper-case-study.step')).val()
board=cq.importers.importStep(str(O/'tps-candidate-integrated-board.step')).val()
sep=cq.importers.importStep(str(O/'battery-separator-study.step')).val()
pack_pose=json.loads((O/'battery-over-connector-review.json').read_text())['selected_geometric_candidate']
bat=cq.importers.importStep(str(O/'dtp401525-xe-pack-max.step')).val().translate((pack_pose['pack_x_min_mm']+7.75,-13.5,pack_pose['pack_z_range_mm'][0]))
def box(x0,x1,y0,y1,z0,z1):
 return cq.Workplane('XY').box(x1-x0,y1-y0,z1-z0,centered=(False,False,False)).translate((x0,y0,z0)).val()
# Right wall, away from selected PCB supports. The beam bends inward.
# Body thickness .45, loaded length 4.15, latch projection .15. No material selected.
for y in [-15,-22]:
 lower=lower.cut(box(24.25,25.2,y-1.2,y+1.2,-2.8,.41))
 beam=box(24.3,24.75,y-1,y+1,-3.3,1.8)
 # Triangular lead-in above a square retention shoulder at z=1.35.
 head=cq.Workplane('XZ').polyline([(24.75,1.35),(24.9,1.35),(24.75,1.8)]).close().extrude(2).val().translate((0,y+1,0))
 lower=lower.fuse(beam).fuse(head).clean()
 upper=upper.cut(box(24.25,24.8,y-1.1,y+1.1,.39,2.0))
 upper=upper.cut(box(24.79,24.95,y-1.1,y+1.1,1.25,1.85)).clean()
checks={}
for name,s in [('lower',lower),('upper',upper)]:
 assert s.isValid()
 checks[name]={'solid_count':len(s.Solids()),'board_intersection_mm3':s.intersect(board).Volume(),'separator_intersection_mm3':s.intersect(sep).Volume(),'battery_intersection_mm3':s.intersect(bat).Volume()}
 cq.exporters.export(s,str(O/('snap-trial-'+name+'.step')))
checks['case_intersection_mm3']=lower.intersect(upper).Volume()
r={'status':'LOCAL_LATCH_STUDY_NOT_FUNCTIONAL_CLOSURE','checks':checks,'hypothesis':{'beam_thickness_mm':.45,'loaded_length_mm':4.15,'nominal_deflection_mm':.15,'linear_cantilever_surface_strain':1.5*.45*.15/(4.15**2)},'limitations':['Only right-side latches; opposite locating or fastening feature required','Material, print process, root radius, tolerances and fatigue unqualified','Elastic assembly motion not represented by rigid overlap check','Pocket leaves thin wall; manufacturing review required','Original leads and plug omitted','Battery placement inherited from battery-over-connector-review.json','Not adopted; exterior size target decision pending']}
(O/'snap-closure-trial.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
