"""30x32 envelope study. Board is an allocation, NOT a populated PCB."""
from pathlib import Path
import json,math
import cadquery as cq
P=Path(__file__).resolve().parent;O=Path('/Users/takahashinaoki/Downloads/Pendant-v15-XE-packing-study');O.mkdir(exist_ok=True)
def box(x,y,z,w,l,h):return cq.Workplane('XY').box(w,l,h).val().translate((x+w/2,y+l/2,z+h/2))
body=box(0,0,0,30,32,13.6).cut(box(1.2,1.2,1.2,27.6,29.6,14))
lid=box(0,0,13.6,30,32,1.2)
battery=box(1.5,1.5,1.5,15.5,27,4.2)
pcb=box(2,1.5,8.6,26,29,.93)
# Footprint F.Fab bounding allocation5.4x4.5, official mated height1.55.
# Mated shell overhang and insertion sweep are not represented.
header=box(6.55,17.2,7.05,5.4,4.5,1.55)
# Three assumed0.6mm-OD leads; explicit external bend first extends0.4mm.
R=1.4;exit_y=28.5;exit_z=4.5;points=[(exit_y,exit_z),(exit_y+.4,exit_z)]
for i in range(1,41):
 a=math.pi*i/40;points.append((exit_y+.4+R*math.sin(a),exit_z+R*(1-math.cos(a))))
points.append((21.7,exit_z+2*R))
wires=[]
for x in [8.05,9.25,10.45]:
 seg=[]
 for (y,z),(yy,zz) in zip(points,points[1:]):
  v=cq.Vector(0,yy-y,zz-z);seg.append(cq.Solid.makeCylinder(.3,v.Length,cq.Vector(x,y,z),v.normalized()))
 wires.append(cq.Compound.makeCompound(seg))
checks=[]
for name,s in [('battery',battery),('header',header),('pcb_allocation',pcb)]+[(f'wire{i}',w) for i,w in enumerate(wires)]:
 for target,t in [('case',body),('lid',lid)]:
  vol=s.intersect(t).Volume()
  if vol>1e-6:checks.append(dict(part=name,target=target,overlap_mm3=vol))
assembly=cq.Compound.makeCompound([body,lid,battery,pcb,header]+wires)
cq.exporters.export(assembly,str(O/'XE-packing-NOT-MANUFACTURING.step'))
report=dict(status='ALLOCATION_STUDY_NOT_ASSEMBLY_APPROVAL',case_mm=[30,32,14.8],pack_max_mm=[15.5,27,4.2],pack_origin_mm=[1.5,1.5,1.5],board_allocation_mm=[26,29,.93],board_bottom_z_mm=8.6,header_envelope_mm=[5.4,4.5,1.55],wire_assumed_OD_mm=.6,wire_assumed_bend_radius_mm=R,wire_assumed_exit_z_mm=exit_z,wire_centerline_length_mm=.4+math.pi*R+(28.9-21.7),wire_to_rear_inner_wall_clearance_mm=30.8-(28.9+R+.3),tested_intersections=checks,body_valid=body.isValid(),limitations=['Wire radius,OD and exit height are assumptions needing actual pack verification','Model represents12mm shortest lead approximately;15..18mm slack routing not complete','Cylindrical polysegments approximate bend; not printable harness geometry','Board blank has no components,routes,supports,acoustic path or USB connector','Header rectangle is footprint allocation, not verified mated body or insertion/removal sweep','Case has no closure,port,retention,thermal contact or swelling allowance qualification','No order or fabrication approval'])
(P/'pack-layout-review.json').write_text(json.dumps(report,indent=2)+'\n');(O/'review.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
