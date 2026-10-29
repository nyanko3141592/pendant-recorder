"""Actual V15 placement envelope fit; no manufacturing approval."""
from pathlib import Path
import json,hashlib
import cadquery as cq
P=Path(__file__).resolve().parent;root=P.parents[1];source=root/'hardware/mini-rect-v15/input-control-pa2-pb5/usb-reference-power.mechanical-handoff.json';h=json.loads(source.read_text());O=Path('/Users/takahashinaoki/Downloads/Pendant-v15-XE-split-duct');O.mkdir(exist_ok=True)
def box(x,y,z,w,l,t):return cq.Workplane('XY').box(w,l,t).val().translate((x+w/2,y+l/2,z+t/2))
body=box(.2,.2,0,29.6,31.6,13.6).cut(box(1.2,1.2,1.2,27.6,29.6,14));lid=box(.2,.2,13.6,29.6,31.6,1.0);battery=box(1.5,1.5,1.5,15.5,27,4.2);pcb=box(2,1.5,8.6,*h['board_mm']);parts=[];checks=[]
# USB notch is open at body top; lid forms its ceiling, avoiding a thin bridge.
body=body.cut(box(6.5,30.65,9.23,12,1.55,4.37))
supports=[box(27,5,7.4,2.1,2,1.2),box(27,26,7.4,2.1,2,1.2),box(1,24,7.4,1.5,2,1.2)]
for shape in supports:body=body.fuse(shape)
thermal=box(5,3.3,5.7,3,3,2.3)
mic=next(p for p in h['round_npth_holes'] if p['ref']=='U8');mx,my=2+mic['x_mm'],1.5+mic['y_mm'];bore=mic['diameter_mm']/2
# Separate halves expose the entire groove during printing and cleaning.
# 1.6mm body inlet through1.2mm floor; microphone PCB bore remains0.8mm.
outer=box(mx-2,my-2,1.2,4,4,7)
channel=cq.Solid.makeCylinder(.8,7.2,cq.Vector(mx,my,1.1))
duct=outer.cut(channel)
duct_left=duct.intersect(box(mx-2,my-2,1.2,2,4,7))
duct_right=duct.intersect(box(mx,my-2,1.2,2,4,7))
body=body.cut(cq.Solid.makeCylinder(.8,1.4,cq.Vector(mx,my,-.1)))
void=cq.Solid.makeCylinder(bore,9,cq.Vector(mx,my,-.1))
gasket=cq.Solid.makeCylinder(.9,.4,cq.Vector(mx,my,8.2)).cut(void)
for hole in h['round_npth_holes']:
 pcb=pcb.cut(cq.Solid.makeCylinder(hole['diameter_mm']/2,1.1,cq.Vector(2+hole['x_mm'],1.5+hole['y_mm'],8.5)))
# Low guides constrain lateral battery movement without covering its wire exit.
# They leave 0.3mm nominal clearance to the maximum drawing envelope.
body=body.fuse(box(17.3,3,1.2,.6,22,1.5)).fuse(box(2,28.8,1.2,14,.6,1.5))
# Support battery bottom at the same elevation used throughout the placement study.
body=body.fuse(box(2,2,1.2,14.5,25,.3))
# Thin snap beams and lid fingers omitted in this separate closure study.
snap_data=[]
for r in h['parts']:
 z=8.6+h['board_mm'][2] if r['side']=='F' else 8.6-r['height_mm'];shape=box(2+r['x_mm']-r['w_mm']/2,1.5+r['y_mm']-r['d_mm']/2,z,r['w_mm'],r['d_mm'],r['height_mm']);parts.append((r['ref'],shape))
 for name,target in [('body',body),('lid',lid),('battery',battery),('thermal_pad_allocation',thermal),('acoustic_gasket',gasket),('duct_left',duct_left),('duct_right',duct_right)]:
  vol=shape.intersect(target).Volume()
  if vol>1e-6:checks.append(dict(part=r['ref'],target=name,overlap_mm3=vol))
# Final coordinates use the reduced case outer corner as origin.
body=body.translate((-.2,-.2,0));lid=lid.translate((-.2,-.2,0))
battery=battery.translate((-.2,-.2,0));pcb=pcb.translate((-.2,-.2,0))
thermal=thermal.translate((-.2,-.2,0));gasket=gasket.translate((-.2,-.2,0))
outer=outer.translate((-.2,-.2,0));parts=[(ref,shape.translate((-.2,-.2,0))) for ref,shape in parts]
duct_left=duct_left.translate((-.2,-.2,0));duct_right=duct_right.translate((-.2,-.2,0))
mx-=.2;my-=.2
for name,shape in [('body',body),('lid',lid),('duct-left',duct_left),('duct-right',duct_right)]:
 cq.exporters.export(shape,str(O/(name+'-NOT-MANUFACTURING.step')))
 cq.exporters.export(shape,str(O/(name+'-NOT-MANUFACTURING.stl')))
assembly=cq.Compound.makeCompound([body,lid,battery,pcb,thermal,gasket,duct_left,duct_right]+[s for _,s in parts]);cq.exporters.export(assembly,str(O/'XE-closure-NOT-MANUFACTURING.step'))
r=dict(status='SPLIT_ACOUSTIC_DUCT_STUDY_NOT_RELEASED',snap_features=snap_data,battery_body_overlap_mm3=battery.intersect(body).Volume(),battery_guide_nominal_gap_mm=.3,pcb_lid_overlap_mm3=pcb.intersect(lid).Volume(),acoustic_inlet_xy_mm=[mx,my],acoustic_bore_mm=2*bore,acoustic_wall_mm=.4,acoustic_gasket_allocation_mm=[1.8,.8,.4],acoustic_pillar_battery_overlap_mm3=outer.intersect(battery).Volume(),body_valid=body.isValid(),lid_valid=lid.isValid(),body_solids=len(body.Solids()),lid_solids=len(lid.Solids()),body_lid_overlap_mm3=body.intersect(lid).Volume(),usb_opening_mm=[12,4.37],support_count=3,thermal_pad_allocation_mm=[3,3,2.3],source_board_sha256=h['source_sha256'],case_mm=[29.6,31.6,14.6],board_mm=h['board_mm'],component_count=len(parts),component_vs_body_lid_battery_intersections=checks,thermal_sensor_contact_gap_mm=8.6-.6-5.7,limitations=h['limitations']+['Conservative component envelopes can overstate body size','USB notch and support geometry provisional; plug insertion not qualified. Snap beams and lid fingers removed. Tape and PCB retention are unqualified.','Thermal pad is space allocation only; material, pressure, retention and response not qualified','Straight bottom acoustic inlet added; response, print bore accuracy, gasket material/seal/compression and debris protection not qualified','Low battery guides added with0.3mm nominal clearance; vertical retention and swelling allowance remain unqualified','Wire routing and mated connector insertion envelope are not included','Battery swelling and assembly tolerances are not qualified']);(P/'split-duct-fit-review.json').write_text(json.dumps(r,indent=2)+'\n');(O/'review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))

# Published SLA dimensional tolerance and assumed tape build, not a guarantee.
r['closure_tolerance_screen']=dict(nominal_case_mm=[29.6,31.6,14.6],positive_print_tolerance_mm=.2,assumed_tape_build_per_opposing_face_mm=.1,positive_envelope_mm=[30.,32.,15.],limits_mm=[30,32,15],tape_material_selected=False,warning='Tape overlaps, wrinkles, adhesive thickness and independent body/lid alignment are not included; no spare margin.')
r['board_origin_case_mm']=[1.8,1.3,8.6]
r['remaining_changes']=['Qualify split-duct printing, alignment, bonding, seal and acoustic response','Specify PCB top retention after removing thin fingers','Select tape and quantify overlap/alignment/durability','Complete wire/connector envelope and fit qualification']
(P/'split-duct-fit-review.json').write_text(json.dumps(r,indent=2)+'\n')
(O/'review.json').write_text(json.dumps(r,indent=2)+'\n')

r['split_duct']=dict(outer_mm=[4,4,7],each_half_mm=[2,4,7],channel_diameter_mm=1.6,open_groove_depth_mm=.8,min_side_wall_mm=1.2,body_inlet_diameter_mm=1.6,body_inlet_depth_mm=1.2,PCB_bore_mm=.8,halves_valid=duct_left.isValid() and duct_right.isValid(),half_solid_counts=[len(duct_left.Solids()),len(duct_right.Solids())],half_overlap_mm3=duct_left.intersect(duct_right).Volume(),battery_overlap_mm3=duct_left.intersect(battery).Volume()+duct_right.intersect(battery).Volume(),body_overlap_mm3=duct_left.intersect(body).Volume()+duct_right.intersect(body).Volume(),limitations=['Small2x4x7mm halves below published generic minimum-part combinations; carrier/handling acceptance required','Bond-line thickness and registration not modeled; zero nominal seam gap is not manufacturing clearance','Different acoustic volume and step into0.8mm PCB bore require frequency-response verification','Gasket seating and contamination control unqualified'])
r['acoustic_wall_mm']=1.2
r['limitations']=[v.replace('Straight bottom acoustic inlet added; response, print bore accuracy, gasket material/seal/compression and debris protection not qualified','Split acoustic duct candidate; groove geometry, bonding, seal, carrier/handling and acoustic response unqualified') for v in r['limitations']]
(P/'split-duct-fit-review.json').write_text(json.dumps(r,indent=2)+'\n')
(O/'review.json').write_text(json.dumps(r,indent=2)+'\n')
print('Split duct:',r['split_duct'])
