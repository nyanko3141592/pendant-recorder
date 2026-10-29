"""Nominal USB mouth plane versus case exterior; not a cable compatibility release."""
from pathlib import Path
import json,hashlib
import cadquery as cq
P=Path(__file__).resolve().parent;ROOT=P.parents[1]
hp=ROOT/'hardware/mini-rect-v15/input-control-pa2-pb5/usb-reference-power.mechanical-handoff.json';h=json.loads(hp.read_text())
fitp=P/'removable-ledge-fit-review.json';fit=json.loads(fitp.read_text())
board=Path(h['source_board']);assert hashlib.sha256(board.read_bytes()).hexdigest()==h['source_sha256']
j=next(x for x in h['parts'] if x['ref']=='J1');assert j['side']=='F' and j['rotation_deg']==0
holes=[x for x in h['round_npth_holes'] if x['ref']=='J1'];assert len(holes)==2 and holes[0]['y_mm']==holes[1]['y_mm']
# GCT B4 first sheet: mating face to NPTH axis =2.60+3.68=6.28mm.
# Matches local F.Fab front+3.675 relative to NPTH-2.605 in footprint.
origin=fit['board_origin_case_mm'];mouth_y=origin[1]+holes[0]['y_mm']+2.60+3.68
outer_y=fit['case_mm'][1];stand_off=1.85
recess=outer_y-mouth_y;gap=stand_off-recess
case_path=Path('/Users/takahashinaoki/Downloads/Pendant-v15-XE-removable-ledge/body-NOT-MANUFACTURING.step')
lid_path=case_path.with_name('lid-NOT-MANUFACTURING.step')
# Use only a conservative rectangular metal-opening allocation, not actual plug.
center_x=origin[0]+j['origin_x_mm'];axis_z=origin[2]+h['board_mm'][2]+1.73
w=8.40;height=2.60;travel=14
allocation=cq.Workplane('XY').box(w,travel,height).val().translate((center_x,mouth_y+travel/2,axis_z))
hits={name:allocation.intersect(cq.importers.importStep(str(path)).val()).Volume() for name,path in [('body',case_path),('lid',lid_path)]}
r=dict(status='NOMINAL_RECESS_SCREEN_POSITION_TOLERANCE_UNRESOLVED',source_sha256={str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in [hp,fitp,board,case_path,lid_path,P/'evidence/usb4105-B4.pdf',Path(__file__)]},drawing=dict(url='https://gct.co/files/drawings/usb4105.pdf',revision='B4',date='18/12/2023',sheet=1,front_to_NPTH_axis_mm=6.28,minimum_mated_plug_shoulder_standoff_mm=1.85,illustrated_maximum_plug_height_mm=6.5),mouth_plane_y_mm=mouth_y,case_outer_y_mm=outer_y,mouth_recess_mm=recess,nominal_shoulder_to_case_gap_mm=gap,axis_case_mm=[center_x,mouth_y,axis_z],metal_allocation_mm=[w,travel,height],metal_allocation_case_overlap_mm3=hits,adverse_recess_increase_sensitivity=[dict(additional_recess_mm=x,remaining_gap_mm=gap-x,positive_gap=gap-x>0) for x in [0,.1,.2,.3,.4]],limitations=['Mating drawing establishes illustrated shoulder standoff, not compatibility of every marketed USB-C cable or shell molding.','8.40x2.60 rectangle is a geometric allocation only; exact plug shell geometry, cable molding width and tolerances not supplied.','Positive-volume intersection check omits the receptacle internals and cannot prove electrical mating depth/contact force.','Sensitivity offsets are not a complete manufacturing tolerance stack. Connector, PCB seating, print size, body/lid alignment and closure tape must be included.','No adopted cable or full insertion test; current0.215mm nominal reserve is not a qualified assembly margin.'],release_allowed=False)
(P/'usb-mating-recess-review.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps({k:r[k] for k in ['mouth_plane_y_mm','mouth_recess_mm','nominal_shoulder_to_case_gap_mm','metal_allocation_case_overlap_mm3','adverse_recess_increase_sensitivity']},indent=2))
