"""Continuous rigid assembly swept envelopes; harness is not modeled."""
from pathlib import Path
import json,hashlib
import cadquery as cq
P=Path(__file__).resolve().parent
O=Path('/Users/takahashinaoki/Downloads/Pendant-v15-XE-removable-ledge')
body_path=O/'body-NOT-MANUFACTURING.step';key_path=O/'key-NOT-MANUFACTURING.step'
body=cq.importers.importStep(str(body_path)).val();key=cq.importers.importStep(str(key_path)).val()
def box(x,y,z,w,l,t):return cq.Workplane('XY').box(w,l,t).val().translate((x+w/2,y+l/2,z+t/2))
pack=box(1.3,1.3,1.5,15.5,27,4.2)
# Exact swept union for a vertical translation of axis-aligned pack box.
pack_sweep=box(1.3,1.3,1.5,15.5,27,18.2)
# Key is union of two boxes; sweep each upward14mm, then union.
key_sweep=box(.2,20.2,7,.8,3.6,20.6).fuse(box(.8,21,7,3.8,2,15.6))
r=dict(status='VERTICAL_RIGID_PACK_AND_KEY_SWEEPS_ONLY',source_sha256={str(x):hashlib.sha256(x.read_bytes()).hexdigest() for x in [body_path,key_path]},pack_sweep_body_overlap_mm3=pack_sweep.intersect(body).Volume(),key_sweep_body_overlap_mm3=key_sweep.intersect(body).Volume(),key_sweep_pack_overlap_mm3=key_sweep.intersect(pack).Volume(),vertical_travel_mm=14,assumptions=['Install pack with key and PCB absent; insert key after pack.','Axis-aligned maximum pack rectangle and exact nominal key boxes; no tilting or cell bending.','No wire, housing, hand/tool clearance, manufacturing tolerance or pack swelling included.','Full assembly and key retention remain unqualified.'],release_allowed=False)
handoff=P.parents[1]/'hardware/mini-rect-v15/input-control-pa2-pb5/usb-reference-power.mechanical-handoff.json'
h=json.loads(handoff.read_text())
r['source_sha256'][str(handoff)]=hashlib.sha256(handoff.read_bytes()).hexdigest()
r['populated_board_vertical_sweeps']=[]
for margin in [0,.2]:
 shapes=[('PCB',box(1.8-margin,1.3-margin,8.6,26+2*margin,29+2*margin,.93+14))]
 for part in h['parts']:
  z=9.53 if part['side']=='F' else 8.6-part['height_mm']
  shapes.append((part['ref'],box(1.8+part['x_mm']-part['w_mm']/2-margin,1.3+part['y_mm']-part['d_mm']/2-margin,z,part['w_mm']+2*margin,part['d_mm']+2*margin,part['height_mm']+14)))
 hits=[]
 for ref,shape in shapes:
  for target,solid in [('body',body),('key',key),('pack',pack)]:
   v=shape.intersect(solid).Volume()
   if v>1e-6:hits.append(dict(ref=ref,target=target,overlap_mm3=v))
 r['populated_board_vertical_sweeps'].append(dict(additional_XY_margin_each_side_mm=margin,moving_envelopes=len(shapes),collisions=hits))
r['assumptions'].append('PCB sweep uses rectangular component envelopes and nominal Z;0.2mm XY expansion is a sensitivity allowance, not measured placement or printing tolerance.')
r['assumptions'].append('Mated battery housing, wire and thermal pad handling are omitted; populated-board clearance alone does not prove full assembly.')
# Exact union of the two key boxes translated from X=-14 to X=0.
# PCB and pack are already seated; shelf top only touches PCB lower face.
horizontal_key_sweep=box(.2-14,20.2,7,.8+14,3.6,6.6).fuse(box(.8-14,21,7,3.8+14,2,1.6))
static_targets=[('body',body),('pack',pack),('PCB',box(1.8,1.3,8.6,26,29,.93))]
for part in h['parts']:
 z=9.53 if part['side']=='F' else 8.6-part['height_mm']
 static_targets.append((part['ref'],box(1.8+part['x_mm']-part['w_mm']/2,1.3+part['y_mm']-part['d_mm']/2,z,part['w_mm'],part['d_mm'],part['height_mm'])))
horizontal_hits=[]
for target,solid in static_targets:
 v=horizontal_key_sweep.intersect(solid).Volume()
 if v>1e-6:horizontal_hits.append(dict(target=target,overlap_mm3=v))
r['horizontal_key_insertion_after_board_and_pack']=dict(travel_mm=14,static_envelopes=len(static_targets),collisions=horizontal_hits,continuous_sweep=True,nominal_geometry_only=True)
# Relative insertion misalignment sensitivity, not a manufacturing tolerance model.
# Include endpoints and continuous paths, not discrete sampling along X.
r['horizontal_key_alignment_sensitivity']=[]
for dy,dz in [(0,0),(-.2,0),(.2,0),(0,-.2),(0,.2)]:
 shifted_sweep=horizontal_key_sweep.translate((0,dy,dz))
 hits=[]
 for target,solid in static_targets:
  v=shifted_sweep.intersect(solid).Volume()
  if v>1e-6:hits.append(dict(target=target,overlap_mm3=v))
 r['horizontal_key_alignment_sensitivity'].append(dict(key_y_offset_mm=dy,key_z_offset_mm=dz,collisions=hits))
# Keep pack and PCB together 0.4mm above final seats while inserting key.
# Then lower the whole group, preserving the already-mated relative geometry.
# Earlier upward pack/PCB swept unions also cover this final 0.4mm descent.
raised_targets=[(name,solid if name=='body' else solid.translate((0,0,.4))) for name,solid in static_targets]
raised_hits=[]
for target,solid in raised_targets:
 v=horizontal_key_sweep.intersect(solid).Volume()
 if v>1e-6:raised_hits.append(dict(target=target,overlap_mm3=v))
r['raised_group_key_insertion']=dict(group_raise_mm=.4,key_offset_mm=[0,0,0],collisions=raised_hits,nominal_geometry_only=True,independent_support_fixture_required=True)
r['assumptions'].append('Y/Z key offsets are assembly alignment sensitivities, not printer dimensional tolerances. A nominally touching support has no positive insertion clearance at final PCB height. Raising both pack and PCB together preserves their relative geometry but still requires a support fixture and harness validation.')
r['source_sha256'][str(Path(__file__).resolve())]=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
r['alternative_assembly_sequence']=[
 'Mate pack and PCB outside the case while independently supporting both; final relative positions must be maintained.',
 'Lower pack and populated PCB together 14mm with key and lid absent. Existing individual sweeps against the body bound this rigid translation.',
 'Keep pack and PCB together 0.4mm above their final seats on independent supports; insert left key horizontally at its nominal height, then lower the group 0.4mm onto supports.',
 'Fit lid and qualified retention system only after harness and thermal interface placement are resolved.'
]
r['assumptions'].append('Alternative sequence is a rigid-body feasibility screen only: supporting fixture, connector mating access, final harness routing, thermal interface and outward key retention remain unresolved. Never suspend the battery by its wires.')
r['status']='RIGID_ASSEMBLY_PATH_SCREEN_HARNESS_AND_HANDLING_UNRESOLVED'
(P/'removable-ledge-path-review.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps(r,indent=2))
