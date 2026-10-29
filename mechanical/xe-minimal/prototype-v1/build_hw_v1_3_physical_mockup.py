#!/usr/bin/env python3
"""Build a printable HW-V1.3 case/PCB/battery physical-size mockup.

This kit is for judging worn size and internal stacking.  It is not the final
case, populated-board STEP, thermal proof, or manufacturing release.
"""
from pathlib import Path
import hashlib
import json

import cadquery as cq

HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[2]
OUT=HERE/"hw-v1.3-physical-mockup"
OUT.mkdir(exist_ok=True)

BODY=39.7
TOTAL_Z=12.5
SPLIT_Z=6.5
WALL=1.6
INNER=BODY-2*WALL

def rounded_box(x,y,z,r):
    return (cq.Workplane("XY").rect(x,y).extrude(z)
            .edges("|Z").fillet(r).val())

def export(shape,name):
    stl=OUT/f"{name}.stl"; step=OUT/f"{name}.step"
    cq.exporters.export(shape,str(stl),tolerance=.02,angularTolerance=.1)
    cq.exporters.export(shape,str(step))
    return [stl,step]

# Lower: broad rounded back, open at the split.  The battery cavity is never
# allowed to squeeze the pouch; nominal XY reserve exceeds the max body.
lower_outer=rounded_box(BODY,BODY,SPLIT_Z,4.0)
lower_void=(cq.Workplane("XY").workplane(offset=WALL)
            .rect(INNER,INNER).extrude(SPLIT_Z-WALL+0.2)
            .edges("|Z").fillet(2.4).val())
lower=lower_outer.cut(lower_void)

# Integral transverse bail on the edge opposite USB.  Its wide root fuses to
# the lower back wall; the hole axis is CAD X and becomes print Z below.
bail=(cq.Workplane("XY").center(0,BODY/2+2.6)
      .box(9.0,6.0,6.0,centered=(True,True,False)).edges("|Z").fillet(2.2).val())
hole=(cq.Workplane("YZ").center(BODY/2+2.6,3.2)
      .circle(1.6).extrude(12.0,both=True).val())
lower=lower.fuse(bail).cut(hole).clean()

# Upper: open underside, USB bay at the connector edge, top microphone hole.
upper_outer=rounded_box(BODY,BODY,TOTAL_Z-SPLIT_Z,4.0).translate((0,0,SPLIT_Z))
upper_void=(cq.Workplane("XY").workplane(offset=SPLIT_Z-0.2)
            .rect(INNER,INNER).extrude(TOTAL_Z-SPLIT_Z-WALL+0.2)
            .edges("|Z").fillet(2.4).val())
upper=upper_outer.cut(upper_void)
usb_cut=(cq.Workplane("XZ").workplane(offset=-BODY/2-1)
         .center(0,8.2).rect(14.0,7.5).extrude(3.0).val())
upper=upper.cut(usb_cut)
# U8 sits at board (18,4); with board center (18,18), local Y=-14.
mic_hole=(cq.Workplane("XY").workplane(offset=TOTAL_Z-WALL-.2)
          .center(0,-14.0).circle(.8).extrude(WALL+.5).val())
upper=upper.cut(mic_hole).clean()

# Board outline and main height-driving component envelopes. Coordinates are
# transformed from the 0..36 mm KiCad board into a centered case coordinate.
pcb=rounded_box(36.0,36.0,.8,1.0).translate((0,0,SPLIT_Z-.2))
parts=[
    # ref, x, y, body x, body y, height
    ("J1",18.0,31.3,10.8,9.1,3.2), ("U1",17.5,18.5,7.0,7.0,.8),
    ("U11",8.0,20.0,8.0,6.0,.8), ("U8",18.0,4.0,4.0,3.0,1.2),
    ("J2",31.0,12.0,5.5,5.0,2.0), ("SW1",5.0,4.0,3.2,2.7,.7),
    ("U3",28.0,17.5,2.2,2.0,.8), ("U12",26.0,5.0,3.0,3.0,1.1),
]
component_shapes=[]
for ref,x,y,sx,sy,h in parts:
    component_shapes.append(cq.Workplane("XY").box(sx,sy,h,centered=(True,True,False)).val()
                            .translate((x-18,y-18,SPLIT_Z+.6)))
pcb_populated=cq.Compound.makeCompound([pcb]+component_shapes)

battery=(cq.Workplane("XY").rect(15.5,27.0).extrude(4.2)
         .edges("|Z").fillet(1.2).edges("not |Z").fillet(.4).val())
battery=battery.translate((0,0,WALL+.15))

assembly=cq.Assembly(name="hw_v1_3_physical_mockup")
assembly.add(lower,name="case_lower",color=cq.Color(.72,.76,.84))
assembly.add(upper,name="case_upper",color=cq.Color(.86,.88,.92))
assembly.add(pcb_populated,name="pcb_populated_envelope",color=cq.Color(.12,.45,.27))
assembly.add(battery,name="dtp401525_xe_max",color=cq.Color(.25,.58,.84))
assembly_step=OUT/"hw-v1.3-physical-mockup-assembly.step"
assembly.save(str(assembly_step))

outputs=[assembly_step]
outputs+=export(lower,"hw-v1.3-case-lower-size-mockup")
outputs+=export(upper,"hw-v1.3-case-upper-size-mockup")
outputs+=export(pcb_populated,"hw-v1.3-populated-pcb-envelope-gauge")
outputs+=export(battery,"dtp401525-xe-max-envelope-gauge")

# One A1-mini plate. Lower is rotated so the lanyard hole axis is build Z.
lower_print=lower.rotate((0,0,0),(0,1,0),-90)
bb=lower_print.BoundingBox(); lower_print=lower_print.translate((-bb.xmin,-bb.ymin,-bb.zmin))
upper_print=upper.rotate((0,0,0),(1,0,0),180)
bb=upper_print.BoundingBox(); upper_print=upper_print.translate((-bb.xmin,-bb.ymin,-bb.zmin))
pcb_print=pcb_populated.translate((0,0,-pcb_populated.BoundingBox().zmin))
battery_print=battery.translate((0,0,-battery.BoundingBox().zmin))
plate_parts=[lower_print,upper_print.translate((20,0,0)),
             pcb_print.translate((66,0,0)),battery_print.translate((76,46,0))]
plate=cq.Compound.makeCompound(plate_parts)
plate_stl=OUT/"hw-v1.3-case-pcb-battery-print-plate.stl"
plate_step=OUT/"hw-v1.3-case-pcb-battery-print-plate.step"
cq.exporters.export(plate,str(plate_stl),tolerance=.02,angularTolerance=.1)
cq.exporters.export(plate,str(plate_step)); outputs += [plate_stl,plate_step]

def sha(p): return hashlib.sha256(p.read_bytes()).hexdigest()
abb=assembly.toCompound().BoundingBox(); pbb=plate.BoundingBox()
report={
 "version":"HW-V1.3-PHYSICAL-SIZE-MOCKUP-R0",
 "status":"PRINTABLE_SIZE_AND_STACKING_MOCKUP_NOT_FINAL_CASE_OR_ELECTRICAL_QUALIFICATION",
 "complete_bbox_mm":[abb.xlen,abb.ylen,abb.zlen],
 "body_bbox_mm":[BODY,BODY,TOTAL_Z], "print_plate_bbox_mm":[pbb.xlen,pbb.ylen,pbb.zlen],
 "parts":{"case_lower":1,"case_upper":1,"populated_pcb_envelope_gauge":1,"battery_max_envelope_gauge":1},
 "print_orientation":{"lower":"CAD X / lanyard-hole axis rotated to printer Z","upper":"broad exterior face down","gauges":"flat"},
 "outputs_sha256":{str(p.relative_to(ROOT)):sha(p) for p in outputs},
 "limitations":["Major component envelopes only; not every passive body is modeled.","Battery lead and connector flex are reserved by requirements but are not a printed flexible harness.","A successful print checks perceived size and nominal stacking only; it does not qualify fit, heat, acoustics, USB retention, electrical safety or lanyard strength.","V1.3 routing and final populated-board STEP are not released."],
}
(OUT/"review.json").write_text(json.dumps(report,ensure_ascii=False,indent=2)+"\n")
print(json.dumps({"status":report["status"],"complete_bbox_mm":report["complete_bbox_mm"],"plate_bbox_mm":report["print_plate_bbox_mm"]}))
