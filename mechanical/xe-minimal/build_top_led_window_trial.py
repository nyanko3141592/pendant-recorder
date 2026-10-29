"""Window feasibility at removed switch site; PCB LED relocation is not yet routed."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
upper_path=O/'clearance-hook-upper-trial.step'
board_path=O/'buttonless-candidate-integrated-board.step'
upper=cq.importers.importStep(str(upper_path)).val()
board=cq.importers.importStep(str(board_path)).val()
inv=json.loads((O/'screw-candidate-board-inventory.json').read_text())
sw=next(p for p in inv['parts'] if p['ref']=='SW1')
assert sw['side']=='F'
x,y=sw['position_mm'];x-=1.6;y=-y # Copper-clear LED placement, 90-degree footprint
z=.8264
# This is a reserved corridor, not an asserted manufacturer LED envelope.
corridor=cq.Workplane('XY').center(x,y).circle(.6).extrude(8).val().translate((0,0,z+.01))
assert corridor.intersect(board).Volume()<1e-8
result=upper.cut(corridor)
assert result.isValid() and len(result.Solids())==1
assert upper.Volume()-result.Volume()>0
assert result.intersect(board).Volume()<1e-8
out=O/'top-led-window-upper-trial.step';cq.exporters.export(result,str(out))
before=upper.BoundingBox();after=result.BoundingBox()
assert all(abs(a-b)<1e-6 for a,b in zip((before.xlen,before.ylen,before.zlen),(after.xlen,after.ylen,after.zlen)))
r={'status':'OPTICAL_CORRIDOR_TRIAL_COMPLETE_BOARD_MODEL_UPDATE_PENDING','center_step_mm':[x,y],'LED_footprint_rotation_deg':90,'corridor_diameter_mm':1.2,'corridor_bottom_mm':z+.01,'current_board_corridor_intersection_mm3':corridor.intersect(board).Volume(),'case_removed_volume_mm3':upper.Volume()-result.Volume(),'case_valid':True,'case_solid_count':1,'outer_dimensions_unchanged':True,'sources':{p.name:hashlib.sha256(p.read_bytes()).hexdigest() for p in [upper_path,board_path]},'output_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'remaining':['Select LED MPN and verify package/emission/current','Integrate routed top LED candidate into 3D; source board model still has bottom LED','Check courtyard and copper clearances','Qualify viewing angle/brightness/window sealing','Verify implemented fault/full patterns on actual hardware']}
(O/'top-led-window-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
