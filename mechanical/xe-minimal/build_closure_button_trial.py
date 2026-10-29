"""Button opening and loose plunger study; return/overtravel system unresolved."""
from pathlib import Path
import json,hashlib,shutil,cadquery as cq,sys
O=Path(__file__).resolve().parent
accessible='--accessible' in sys.argv
protrusion=.9 if accessible else .2
stem='closure-button-accessible' if accessible else 'closure-button'
I=json.loads((O/'screw-candidate-board-inventory.json').read_text());sw=next(p for p in I['parts'] if p['ref']=='SW1');assert sw['side']=='F' and sw['rotation_deg']==0
x,y=sw['position_mm'];y=-y
upper=cq.importers.importStep(str(O/'clearance-hook-upper-trial.step')).val();top=upper.BoundingBox().zmax
roof_inner=top-.8 # Existing case wall assumption; verify by intersection below.
flange_top=roof_inner-.05;flange_bottom=flange_top-.4;tip_bottom=I['board_thickness_mm']+1.75+.15
shaft=cq.Workplane('XY').circle(1).extrude(top+protrusion-flange_top).translate((x,y,flange_top))
flange=cq.Workplane('XY').circle(1.6).extrude(.4).translate((x,y,flange_bottom))
tip=cq.Workplane('XY').circle(.5).extrude(flange_bottom-tip_bottom).translate((x,y,tip_bottom))
button=shaft.union(flange).union(tip).val();opening=cq.Workplane('XY').circle(1.15).extrude(4).translate((x,y,roof_inner-1)).val();case=upper.cut(opening).clean()
board=cq.importers.importStep(str(O/'screw-candidate-integrated-board.step')).val()
checks={'released_case_collision_mm3':button.intersect(case).Volume(),'released_board_collision_mm3':button.intersect(board).Volume(),'released_board_clearance_mm':button.distance(board)}
assert button.isValid() and case.isValid();assert checks['released_case_collision_mm3']<1e-6 and checks['released_board_collision_mm3']<1e-6
cq.exporters.export(case,str(O/(stem+'-upper-case-trial.step')));cq.exporters.export(button,str(O/(stem+'-plunger-trial.step')))
a=cq.Assembly(name='button_geometry_not_qualified');a.add(case,name='upper_case');a.add(button,name='loose_plunger',color=cq.Color('#529fc2'));a.export(str(O/(stem+'-assembly-trial.step')))
assert (O/'b3u-source.pdf').exists(), 'Retain manufacturer reference PDF beside script'
r={'status':'BUTTON_GEOMETRY_ONLY_NOT_OPERABLE_ASSEMBLY','pcb_sha256':I['pcb_sha256'],'manufacturer_source':{'url':'https://omronfs.omron.com/en_US/ecb/products/pdf/en-b3u.pdf','file':'b3u-source.pdf','sha256':hashlib.sha256((O/'b3u-source.pdf').read_bytes()).hexdigest(),'dimensions_page_visually_checked':2,'height_mm':[1.5,1.75],'nominal_height_mm':1.6,'pretravel_mm':[.05,.35],'operating_force_N':[1.01,1.99]},'geometry':{'switch_center_step_xy_mm':[x,y],'opening_diameter_mm':2.3,'shaft_diameter_mm':2,'flange_diameter_mm':3.2,'tip_diameter_mm':1,'tip_bottom_z_mm':tip_bottom,'flange_z_mm':[flange_bottom,flange_top],'case_top_z_mm':top,'nominal_protrusion_mm':protrusion,'above_case_at_worst_activation_mm':protrusion-.75,'gap_to_maximum_switch_height_mm':.15,'gap_to_minimum_switch_height_mm':.4,'worst_independent_gap_plus_pretravel_mm':.75},'checks':checks,'limitations':['Zero solder standoff assumed; tolerances not fully budgeted','Loose button lacks a return spring or elastomer suspension','No qualified hard stop or switch overtravel/force protection','No retention against inward fall with PCB removed','Protrusion is a trial choice, not approved finished size','Released library geometry is not manufacturer maximum envelope','Not adopted into final case']}
(O/(stem+'-trial-review.json')).write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
