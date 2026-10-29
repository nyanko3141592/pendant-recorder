"""Evidence for rearranged stack; represented-body screen, not case/EVT release."""
from pathlib import Path
import cadquery as cq,json,hashlib,math
HERE=Path(__file__).resolve().parent;M=HERE.parent;D=HERE/'placement-compact-study'
load=lambda p:cq.importers.importStep(str(p)).val()
b=load(D/'top-battery-placement.step')
move=json.loads((HERE.parents[2]/'hardware/xe-minimal/costdown/HW-V1.4-TOP-BATTERY-STUDY/review.json').read_text())
u8move=next(r for r in move['moves'] if r['ref']=='U8');dx=u8move['to_mm'][0]-u8move['from_mm'][0];dy=-(u8move['to_mm'][1]-u8move['from_mm'][1])
u8=load(M/'u8-body-positioned-study.step').translate((dx,dy,0))
j2=load(M/'j2-header-positioned-study.step');u1=load(M/'u1-envelope-positioned-study.step')
# Deliberately explicit provisional storage volume: does NOT qualify exact MPN.
u11=cq.Workplane('XY').box(8.2,6.4,1.2).val().translate((4.575,-14.175,-.6))
board=cq.Compound.makeCompound([b,u8,j2,u1,u11])
xy=(.25,27.25,-16,-.5);under=[]
for i,solid in enumerate(board.Solids()):
 q=solid.BoundingBox()
 if min(q.xmax,xy[1])>max(q.xmin,xy[0]) and min(q.ymax,xy[3])>max(q.ymin,xy[2]):under.append((q.zmax,i,[q.xmin,q.xmax,q.ymin,q.ymax,q.zmin,q.zmax]))
max_top=max(x[0] for x in under);battery_bottom=max_top+.5
battery=load(M/'dtp401525-xe-pack-max.step').rotate((0,0,0),(0,0,1),90).translate((13.75,-8.25,battery_bottom))
bb=board.BoundingBox();bat=battery.BoundingBox();floor=bb.zmin-.25-.85;roof=max(bat.zmax+.25+.85,6.18);height=roof-floor
hits=board.intersect(battery).Volume();assert abs(hits)<1e-8
cq.exporters.export(cq.Compound.makeCompound([board,battery]),str(D/'top-battery-internals-study.step'))
# Enclosing rectangular volume is an explanatory envelope, NOT a printable shell.
envelope=cq.Workplane('XY').box(30.8,30.8,height).val().translate((13.75,-13.35,(floor+roof)/2))
cq.exporters.export(envelope,str(D/'top-battery-outer-envelope-NOT-CASE.step'))
report={'status':'TOP_BATTERY_ARCHITECTURE_SCREEN_NOT_RELEASED','copper_layers':4,'board_mm':[27.5,27.5],'same_bom':True,'same_assembly_sides':True,'moves':move['moves'],'battery_max_body_mm':[27,15.5,4.2],'battery_bounds_mm':[bat.xmin,bat.xmax,bat.ymin,bat.ymax,bat.zmin,bat.zmax],'highest_represented_part_under_battery_z_mm':max_top,'bottommost_represented_component_z_mm':bb.zmin,'battery_to_components_reserved_mm':.5,'provisional_outer_envelope_mm':[30.8,30.8,height],'height_reduction_vs_13p9_percent':100*(1-height/13.9),'represented_battery_board_overlap_mm3':hits,'highest_under_battery_solids':sorted(under,reverse=True)[:5],'unqualified_envelopes':['U1 uses legacy U535 7.4x7.4x0.6 mm screening envelope; replace with exact U585 max drawing before qualification.','U11 uses explicit 8.2x6.4x1.2 mm assumed envelope; exact MKDV8GIL-AST drawing required.'],'engineering_decision':'Prefer pursuing top-battery architecture over 0.2 mm shell-only shrink. Preserve existing routed board; this placement-only candidate requires a new 4-layer route.','remaining_gates':['Factory 15+/-3 mm harness routing from top battery around board to underside J2, no extension/pinch','Integrated insulating battery carrier, swelling allowance and drop retention without pressure on components','Stepped/recessed lid for USB/mic/button; enclosing box is not finished enclosure','Reserve continuous GND and reroute USB/PDM/power with 4 layers and ordinary vias','Confirm exact storage capacity, availability and Standard-only JLC assembly cost before final placement'],'external_actions':{'order':False,'upload':False,'payment':False,'supplier_contact':False}}
(D/'top-battery-review.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps({k:report[k] for k in ['provisional_outer_envelope_mm','height_reduction_vs_13p9_percent','represented_battery_board_overlap_mm3','highest_represented_part_under_battery_z_mm']}))
