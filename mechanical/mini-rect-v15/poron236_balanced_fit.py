"""Actual V15 placement envelope fit; no manufacturing approval."""
from pathlib import Path
import json,hashlib
import cadquery as cq
P=Path(__file__).resolve().parent;root=P.parents[1];source=root/'hardware/mini-rect-v15/input-control-pa2-pb5/usb-reference-power.mechanical-handoff.json';h=json.loads(source.read_text());O=Path('/Users/takahashinaoki/Downloads/Pendant-v15-XE-poron236-balanced');O.mkdir(exist_ok=True)
def box(x,y,z,w,l,t):return cq.Workplane('XY').box(w,l,t).val().translate((x+w/2,y+l/2,z+t/2))
body=box(.2,.2,0,29.6,31.6,13.6).cut(box(1.2,1.2,1.2,27.6,29.6,14));lid=box(.2,.2,13.6,29.6,31.6,1.0);battery=box(1.5,1.5,1.5,15.5,27,4.2);pcb=box(2,1.5,8.6,*h['board_mm']);parts=[];checks=[]
# USB notch is open at body top; lid forms its ceiling, avoiding a thin bridge.
body=body.cut(box(6.5,30.65,9.23,12,1.55,4.37))
# Underside ledges connect to case walls above battery height.
supports=[box(1.0,21.2,7,3.8,2,1.6),box(21.2,24.9,6.2,7.8,2,1.6).fuse(box(21.2,24.9,7.8,2,2,.8)),box(18.6,27.7,7,2,3.3,1.6)]
for shape in supports:body=body.fuse(shape)
# Nominal PCB top9.4, maximum9.53. Post end10.9 leaves1.5/1.37 gap.
# 2.36mm PORON candidate; adhesive and force qualification pending.
contact_centers=[(3.8,22.2),(22.2,25.9),(19.6,28.7)]
foam=[]
for x,y in contact_centers:
 lid=lid.fuse(box(x-1,y-1,10.9,2,2,2.7))
 foam.append(box(x-1,y-1,9.53,2,2,1.37))
thermal=box(5,3.3,5.7,3,3,2.3)
mic=next(p for p in h['round_npth_holes'] if p['ref']=='U8');mx,my=2+mic['x_mm'],1.5+mic['y_mm'];bore=mic['diameter_mm']/2
# Short printable inlet; no dedicated sealed duct or gasket.
# PCB microphone bore is unchanged; sound propagates through enclosure air.
outer=cq.Solid.makeCylinder(.75,1.4,cq.Vector(mx,my,-.1))
body=body.cut(outer)
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
 for name,target in [('body',body),('lid',lid),('battery',battery),('thermal_pad_allocation',thermal)]+[(f'pcb_pad_{i+1}',pad) for i,pad in enumerate(foam)]:
  vol=shape.intersect(target).Volume()
  if vol>1e-6:checks.append(dict(part=r['ref'],target=name,overlap_mm3=vol))
# Assumed lateral budget: +/-0.2mm placement plus0.3mm bulge per edge.
# This is an available-space check, not a foam deformation prediction.
expanded_pad_hits=[]
for i,(x,y) in enumerate(contact_centers):
 envelope=box(x-1.5,y-1.5,9.4,3,3,1.5)
 for ref,shape in parts:
  volume=shape.intersect(envelope).Volume()
  if volume>1e-6:expanded_pad_hits.append(dict(pad=i+1,part=ref,overlap_mm3=volume))
# Final coordinates use the reduced case outer corner as origin.
body=body.translate((-.2,-.2,0));lid=lid.translate((-.2,-.2,0))
battery=battery.translate((-.2,-.2,0));pcb=pcb.translate((-.2,-.2,0))
thermal=thermal.translate((-.2,-.2,0))
outer=outer.translate((-.2,-.2,0));parts=[(ref,shape.translate((-.2,-.2,0))) for ref,shape in parts]
foam=[p.translate((-.2,-.2,0)) for p in foam]
mx-=.2;my-=.2
for name,shape in [('body',body),('lid',lid)]:
 cq.exporters.export(shape,str(O/(name+'-NOT-MANUFACTURING.step')))
 cq.exporters.export(shape,str(O/(name+'-NOT-MANUFACTURING.stl')))
assembly=cq.Compound.makeCompound([body,lid,battery,pcb,thermal]+foam+[s for _,s in parts]);cq.exporters.export(assembly,str(O/'XE-closure-NOT-MANUFACTURING.step'))
r=dict(status='PADDED_THREE_POINT_RETENTION_STUDY_NOT_RELEASED',snap_features=snap_data,battery_body_overlap_mm3=battery.intersect(body).Volume(),battery_guide_nominal_gap_mm=.3,pcb_lid_overlap_mm3=pcb.intersect(lid).Volume(),acoustic_inlet_xy_mm=[mx,my],acoustic_bore_mm=1.5,acoustic_wall_mm=None,acoustic_gasket_allocation_mm=None,acoustic_pillar_battery_overlap_mm3=outer.intersect(battery).Volume(),body_valid=body.isValid(),lid_valid=lid.isValid(),body_solids=len(body.Solids()),lid_solids=len(lid.Solids()),body_lid_overlap_mm3=body.intersect(lid).Volume(),usb_opening_mm=[12,4.37],support_count=3,thermal_pad_allocation_mm=[3,3,2.3],source_board_sha256=h['source_sha256'],case_mm=[29.6,31.6,14.6],board_mm=h['board_mm'],component_count=len(parts),component_vs_body_lid_battery_intersections=checks,thermal_sensor_contact_gap_mm=8.6-.6-5.7,limitations=h['limitations']+['Conservative component envelopes can overstate body size','USB notch and support geometry provisional; plug insertion not qualified. Snap beams and lid fingers removed. Tape and PCB retention are unqualified.','Thermal pad is space allocation only; material, pressure, retention and response not qualified','Open-cavity inlet comparison: no sealed duct; cavity resonance, other openings, structure-borne noise and debris exposure unqualified','Low battery guides added with0.3mm nominal clearance; vertical retention and swelling allowance remain unqualified','Wire routing and mated connector insertion envelope are not included','Battery swelling and assembly tolerances are not qualified']);(P/'poron236-balanced-fit-review.json').write_text(json.dumps(r,indent=2)+'\n');(O/'review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))

# Published SLA dimensional tolerance and assumed tape build, not a guarantee.
r['closure_tolerance_screen']=dict(nominal_case_mm=[29.6,31.6,14.6],positive_print_tolerance_mm=.2,assumed_tape_build_per_opposing_face_mm=.1,positive_envelope_mm=[30.,32.,15.],limits_mm=[30,32,15],tape_material_selected=False,warning='Tape overlaps, wrinkles, adhesive thickness and independent body/lid alignment are not included; no spare margin.')
r['board_origin_case_mm']=[1.8,1.3,8.6]
r['remaining_changes']=['Measure open-cavity acoustic response, handling noise and debris exposure','Specify PCB top retention after removing thin fingers','Select tape and quantify overlap/alignment/durability','Complete wire/connector envelope and fit qualification']
(P/'poron236-balanced-fit-review.json').write_text(json.dumps(r,indent=2)+'\n')
(O/'review.json').write_text(json.dumps(r,indent=2)+'\n')

r['acoustic_design']=dict(type='Open shared enclosure cavity',bottom_inlet_diameter_mm=1.5,bottom_wall_depth_mm=1.2,PCB_microphone_bore_mm=2*bore,dedicated_duct=False,gasket=False,tube_purchase_required=False,qualification='NOT_TESTED',bench_comparison=['Same microphone/board/gain/distance/speaker stimulus for open cavity versus sealed reference','Compare speech intelligibility, frequency response, clipping and background noise across intended recording levels','Exercise USB connector, lid, lead/battery movement and case handling to detect mechanically coupled noise','Keep all recordings and test setup metadata; no DSP change to hide acoustic differences'])
(P/'poron236-balanced-fit-review.json').write_text(json.dumps(r,indent=2)+'\n')
(O/'review.json').write_text(json.dumps(r,indent=2)+'\n')

r['retention']=dict(centers_board_mm=[[1.8,20.7],[20.2,24.4],[17.6,27.2]],post_cross_section_mm=[2,2],bottom_ledge_thickness_mm=1.6,pad_free_thickness_assumed_mm=2.36,post_tip_case_Z_mm=10.9,nominal_PCB_thickness_mm=.8,max_PCB_thickness_mm=.93,nominal_pad_compression_fraction=1-1.5/2.36,max_PCB_pad_compression_fraction=1-1.37/2.36,pad_material_selected=False,limitations=['Compression values ignore printed Z tolerance, pad thickness tolerance and lid misalignment','Clamp force, tape retention and PCB bending/drop response unqualified','Front PCB overhang remains; no physical load test'])
r['remaining_changes']=['Select compliant pad and quantify force/tolerance stack','Validate three-point restraint and front overhang under USB insertion and handling','Select tape and qualify closure','Complete battery harness and acoustic checks']
(P/'poron236-balanced-fit-review.json').write_text(json.dumps(r,indent=2)+'\n')
(O/'review.json').write_text(json.dumps(r,indent=2)+'\n')

# Minimum nominal lateral AABB margin to F components, before final XY shift.
import math
margins=[]
for cx,cy in r['retention']['centers_board_mm']:
 nearby=[]
 for part in h['parts']:
  if part['side']!='F': continue
  dx=max(abs(cx-part['x_mm'])-1-part['w_mm']/2,0)
  dy=max(abs(cy-part['y_mm'])-1-part['d_mm']/2,0)
  nearby.append((math.hypot(dx,dy),part['ref']))
 distance,ref=min(nearby)
 margins.append(dict(center_board_mm=[cx,cy],nearest_F_component=ref,lateral_AABB_clearance_mm=distance))
r['status']='PORON_236_NOMINAL_CAD_STUDY_NOT_ADOPTED'
r['retention']['candidate_mpn']='4701-30-20093-04'
r['retention']['lateral_margins']=margins
r['retention']['warning']='Margins exclude pad bulging, cutting/placement tolerance and adhesive. Positive nominal clearance does not establish lateral stability.'
r['cad_script_sha256']=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
r['expanded_pad_space_screen']=dict(envelope_xy_mm=[3,3],assumed_placement_mm=.2,assumed_bulge_per_edge_mm=.3,material_deformation_verified=False,intersections=expanded_pad_hits)
r['adopted']=False
r['release_allowed']=False
(P/'poron236-balanced-fit-review.json').write_text(json.dumps(r,indent=2)+'\n')
(O/'review.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps(dict(body_valid=r['body_valid'],lid_valid=r['lid_valid'],intersections=checks,margins=margins),indent=2))
