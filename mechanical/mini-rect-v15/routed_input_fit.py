"""Actual V15 placement envelope fit; no manufacturing approval."""
from pathlib import Path
import json,hashlib
import cadquery as cq
P=Path(__file__).resolve().parent;root=P.parents[1];source=root/'hardware/mini-rect-v15/input-control-pa2-pb5/usb-reference-power.mechanical-handoff.json';h=json.loads(source.read_text());O=Path('/Users/takahashinaoki/Downloads/Pendant-v15-XE-routed-fit');O.mkdir(exist_ok=True)
def box(x,y,z,w,l,t):return cq.Workplane('XY').box(w,l,t).val().translate((x+w/2,y+l/2,z+t/2))
body=box(0,0,0,30,32,13.6).cut(box(1.2,1.2,1.2,27.6,29.6,14));lid=box(0,0,13.6,30,32,1.2);battery=box(1.5,1.5,1.5,15.5,27,4.2);pcb=box(2,1.5,8.6,*h['board_mm']);parts=[];checks=[]
# USB notch is open at body top; lid forms its ceiling, avoiding a thin bridge.
body=body.cut(box(6.5,30.65,9.23,12,1.55,4.37))
supports=[box(27,5,7.4,2.1,2,1.2),box(27,26,7.4,2.1,2,1.2),box(1,24,7.4,1.5,2,1.2)]
for shape in supports:body=body.fuse(shape)
# Lid fingers touch only the PCB margin; closure and preload remain unqualified.
for x,y,w in [(27.1,5.2,.6),(27.1,26.2,.6),(2.05,24.2,.4)]:lid=lid.fuse(box(x,y,9.53,w,1.6,4.07))
thermal=box(5,3.3,5.7,3,3,2.3)
mic=next(p for p in h['round_npth_holes'] if p['ref']=='U8');mx,my=2+mic['x_mm'],1.5+mic['y_mm'];bore=mic['diameter_mm']/2
# A straight bottom inlet sits beside the narrow XE pouch, avoiding a lateral tunnel.
outer=cq.Solid.makeCylinder(.8,7.2,cq.Vector(mx,my,1))
void=cq.Solid.makeCylinder(bore,9,cq.Vector(mx,my,-.1))
body=body.fuse(outer).cut(void)
gasket=cq.Solid.makeCylinder(.9,.4,cq.Vector(mx,my,8.2)).cut(void)
for hole in h['round_npth_holes']:
 pcb=pcb.cut(cq.Solid.makeCylinder(hole['diameter_mm']/2,1.1,cq.Vector(2+hole['x_mm'],1.5+hole['y_mm'],8.5)))
# Low guides constrain lateral battery movement without covering its wire exit.
# They leave 0.3mm nominal clearance to the maximum drawing envelope.
body=body.fuse(box(17.3,3,1.2,.6,22,1.5)).fuse(box(2,28.8,1.2,14,.6,1.5))
# Support battery bottom at the same elevation used throughout the placement study.
body=body.fuse(box(2,2,1.2,14.5,25,.3))
# Four inward-flexing lid cantilevers in the 0.8mm PCB-to-wall corridor.
# Nominal 0.25mm assembly deflection; material and printed fatigue remain unqualified.
snap_data=[]
for side,y in [('left',8),('left',20),('right',10),('right',22)]:
 beam=box(1.35,y,9.8,.5,2.5,3.8)
 # Ramp below the retaining shoulder, extruded along y.
 wire=cq.Wire.makePolygon([cq.Vector(x,y,z) for x,z in [(1.35,9.8),(.95,10.3),(.95,10.7),(1.85,10.7),(1.85,9.8),(1.35,9.8)]])
 hook=cq.Solid.extrudeLinear(wire,[],cq.Vector(0,2.5,0))
 recess=box(.8,y-.15,9.65,.55,2.8,1.25)
 release=box(-.1,y+.55,10.05,1.45,1.4,.5)
 if side=='right':
  beam=beam.mirror('YZ',(15,0,0));hook=hook.mirror('YZ',(15,0,0));recess=recess.mirror('YZ',(15,0,0));release=release.mirror('YZ',(15,0,0))
 lid=lid.fuse(beam).fuse(hook);body=body.cut(recess).cut(release)
 snap_data.append(dict(side=side,y_mm=y,beam_mm=[.5,2.5,3.8],nominal_deflection_mm=.25,small_deflection_root_strain_estimate=1.5*.5*.25/(3.8**2)))
for r in h['parts']:
 z=8.6+h['board_mm'][2] if r['side']=='F' else 8.6-r['height_mm'];shape=box(2+r['x_mm']-r['w_mm']/2,1.5+r['y_mm']-r['d_mm']/2,z,r['w_mm'],r['d_mm'],r['height_mm']);parts.append((r['ref'],shape))
 for name,target in [('body',body),('lid',lid),('battery',battery),('thermal_pad_allocation',thermal),('acoustic_gasket',gasket)]:
  vol=shape.intersect(target).Volume()
  if vol>1e-6:checks.append(dict(part=r['ref'],target=name,overlap_mm3=vol))
for name,shape in [('body',body),('lid',lid)]:
 cq.exporters.export(shape,str(O/(name+'-NOT-MANUFACTURING.step')))
 cq.exporters.export(shape,str(O/(name+'-NOT-MANUFACTURING.stl')))
assembly=cq.Compound.makeCompound([body,lid,battery,pcb,thermal,gasket]+[s for _,s in parts]);cq.exporters.export(assembly,str(O/'XE-closure-NOT-MANUFACTURING.step'))
r=dict(status='SNAP_CLOSURE_DRAFT_NOT_RELEASED',snap_features=snap_data,battery_body_overlap_mm3=battery.intersect(body).Volume(),battery_guide_nominal_gap_mm=.3,pcb_lid_overlap_mm3=pcb.intersect(lid).Volume(),acoustic_inlet_xy_mm=[mx,my],acoustic_bore_mm=2*bore,acoustic_wall_mm=.4,acoustic_gasket_allocation_mm=[1.8,.8,.4],acoustic_pillar_battery_overlap_mm3=outer.intersect(battery).Volume(),body_valid=body.isValid(),lid_valid=lid.isValid(),body_solids=len(body.Solids()),lid_solids=len(lid.Solids()),body_lid_overlap_mm3=body.intersect(lid).Volume(),usb_opening_mm=[12,4.37],support_count=3,thermal_pad_allocation_mm=[3,3,2.3],source_board_sha256=h['source_sha256'],case_mm=[30,32,14.8],board_mm=h['board_mm'],component_count=len(parts),component_vs_body_lid_battery_intersections=checks,thermal_sensor_contact_gap_mm=8.6-.6-5.7,limitations=h['limitations']+['Conservative component envelopes can overstate body size','USB notch and support geometry provisional; plug insertion not qualified; four snap ramps/recesses and release windows added, assembly force and durability unqualified','Thermal pad is space allocation only; material, pressure, retention and response not qualified','Straight bottom acoustic inlet added; response, print bore accuracy, gasket material/seal/compression and debris protection not qualified','Low battery guides added with0.3mm nominal clearance; vertical retention and swelling allowance remain unqualified','Wire routing and mated connector insertion envelope are not included','Battery swelling and assembly tolerances are not qualified']);(P/'routed-input-fit-review.json').write_text(json.dumps(r,indent=2)+'\n');(O/'review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
