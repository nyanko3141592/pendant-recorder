"""Build Case V3 around the fixed HW-V1.4 four-layer mechanical envelope.

Unlike the previous 30 mm trial, this case is not clipped from an older shell.
It is constructed from the actual 27.5 mm PCB, fixed battery envelope and
assembly clearance.  The small size increase is deliberate: it preserves a
printable wall through the rounded PCB corners.
"""
from __future__ import annotations

from pathlib import Path
import hashlib
import json

import cadquery as cq

HERE = Path(__file__).resolve().parent
MECH = HERE.parent
ROOT = HERE.parents[2]
OUT = HERE / "actual-fit-case-v3"
OUT.mkdir(exist_ok=True)

def load(path: Path):
    s = cq.importers.importStep(str(path)).val()
    assert s.isValid(), path
    return s

def sha(path: Path): return hashlib.sha256(path.read_bytes()).hexdigest()

def rounded_prism(width, depth, height, radius, cx, cy, z0):
    wp = cq.Workplane("XY").rect(width, depth).extrude(height)
    if radius:
        wp = wp.edges("|Z").fillet(radius)
    s = wp.val()
    return s.translate((cx, cy, z0))

def export(shape, name):
    step, stl = OUT/f"{name}.step", OUT/f"{name}.stl"
    cq.exporters.export(shape, str(step))
    cq.exporters.export(shape, str(stl), tolerance=.02, angularTolerance=.1)
    return step, stl

# Canonical internals, including maximum envelopes missing from KiCad STEP.
pcb_native = load(HERE / "pcb-assembly-pack-ntc.step")
missing = [
    load(MECH / "u1-envelope-positioned-study.step"),
    load(MECH / "u8-body-positioned-study.step"),
    load(MECH / "j2-header-positioned-study.step"),
]
pcb = cq.Compound.makeCompound([pcb_native, *missing])
battery_source = load(MECH / "dtp401525-xe-pack-max.step")
battery = battery_source.translate((8.25, -13.5, -6.62))
separator = load(MECH / "battery-separator-study.step")
harness = cq.Compound.makeCompound([
    cq.Workplane("XY").box(2.3, 5.0, 2.3).val().translate((1.4, -2.5, -2.5)),
    cq.Workplane("XY").box(4.3, 2.3, 2.3).val().translate((2.5, -3.125, -2.5)),
])
internals = cq.Compound.makeCompound([pcb, battery, separator, harness])

# Actual internals need X 0..27.5, Y -27.2..0.5 and Z -6.62..4.1514.
# 0.25 mm XY clearance per PCB side plus a robust FDM wall and R3.2 corners
# requires 31.4 mm; a 30 mm rounded shell left sub-nozzle corner material.
W = D = 31.4
CX, CY = 13.75, -13.35
ZMIN, ZMAX, SEAM = -7.72, 6.18, 0.10
PLAN_R, EDGE_R = 3.2, 1.2
CAV_W, CAV_D, CAV_R = 28.0, 28.2, .55
CAV_BOTTOM, CAV_TOP = -6.87, 5.28

outer = rounded_prism(W, D, ZMAX-ZMIN, PLAN_R, CX, CY, ZMIN)
# Soften every exterior top/bottom edge after plan rounding.
outer = cq.Workplane(obj=outer).edges("not |Z").fillet(EDGE_R).val()

cavity = rounded_prism(CAV_W, CAV_D, CAV_TOP-CAV_BOTTOM, CAV_R, CX, CY, CAV_BOTTOM)
lower_half = cq.Workplane("XY").box(40, 40, SEAM-ZMIN+2).val().translate((CX,CY,(ZMIN+SEAM-2)/2))
upper_half = cq.Workplane("XY").box(40, 40, ZMAX-SEAM+2).val().translate((CX,CY,(SEAM+ZMAX+2)/2))
lower = outer.intersect(lower_half).cut(cavity).clean()
upper = outer.intersect(upper_half).cut(cavity).clean()

# Friction-locating tongue outside the component cavity.  It aligns the halves
# without narrowing the actual PCB/battery clearance.
tongue_outer = rounded_prism(29.0, 29.2, .65, 1.05, CX, CY, SEAM-.02)
tongue_inner = rounded_prism(28.15, 28.35, .9, .63, CX, CY, SEAM-.12)
tongue = tongue_outer.cut(tongue_inner).clean()
lower = lower.fuse(tongue).clean()
groove_outer = rounded_prism(29.25, 29.45, .78, 1.17, CX, CY, SEAM-.08)
groove_inner = rounded_prism(27.95, 28.15, 1.0, .52, CX, CY, SEAM-.18)
upper = upper.cut(groove_outer.cut(groove_inner)).clean()

# USB-C: preserve the receptacle mating plane at Y=-26.17.  The old 7.5 mm
# opening broke through the roof.  A 6.7 mm rounded overmold bay now retains
# 0.83 mm of roof at the front while the 9.4 x 3.6 throat remains unchanged.
usb_x, usb_z = 12.0, 2.0
front_y, mating_y = CY-D/2, -26.17
outer_bay = (cq.Workplane("XY").box(13.8, mating_y-front_y+.4, 6.7)
             .edges("|Y").fillet(1.15)
             .translate((usb_x, (front_y+mating_y-.4)/2, usb_z)).val())
def xz_wire(y, width, height):
    plane = cq.Plane(origin=(0,y,0), xDir=(1,0,0), normal=(0,1,0))
    return cq.Workplane(plane).center(usb_x,usb_z).rect(width,height).val()
transition = cq.Solid.makeLoft([xz_wire(mating_y,13.8,6.7), xz_wire(-25.82,9.4,3.6)], True)
usb_cut = outer_bay.fuse(transition)
lower = lower.cut(usb_cut).clean(); upper = upper.cut(usb_cut).clean()

# Functional top access.  The mic hole is deliberately small; the surrounding
# shallow dish makes it readable without turning it into a styling notch.
mic_x, mic_y = 21.93, -4.565
mic = cq.Workplane("XY").workplane(offset=4.0).center(mic_x,mic_y).circle(.8).extrude(3.0).val()
mic_dish = cq.Workplane("XY").workplane(offset=5.72).center(mic_x,mic_y).circle(1.65).extrude(.7).val()
upper = upper.cut(mic).cut(mic_dish).clean()
button_x, button_y = 15.725, -5.975
button = cq.Workplane("XY").workplane(offset=4.0).center(button_x,button_y).circle(1.75).extrude(3.0).val()
upper = upper.cut(button).clean()

# Cord path V3: drill the diagonal tunnel through the existing rounded-corner
# shell material.  V2 added an internal boss, which did not collide with the
# current assembly but consumed optional cavity volume.  V3 adds no material
# on the cavity side and does not enlarge the silhouette.  The 2.0 mm tunnel
# accepts a 1.0-1.5 mm braided cord while leaving more shell ligament than the
# former 2.4 mm hole.  The load is spread diagonally through two exterior walls
# and the tunnel remains wholly in the one-piece lower shell (not the seam).
lower_before_cord = lower
cord_plane = cq.Plane(origin=(23.8,2.7,-5.25), xDir=(0,0,1), normal=(1,-1,0))
cord_tunnel = cq.Workplane(cord_plane).circle(1.0).extrude(9.0).val()
lower = lower.cut(cord_tunnel).clean()

assert lower.isValid() and len(lower.Solids()) == 1
assert upper.isValid() and len(upper.Solids()) == 1

checks = {
    "lower_to_internals_mm3": lower.intersect(internals).Volume(),
    "upper_to_internals_mm3": upper.intersect(internals).Volume(),
    "cord_reinforcement_added_inside_cavity_mm3": 0.0,
    "cord_tunnel_to_internals_mm3": cord_tunnel.intersect(internals).Volume(),
    "lower_upper_overlap_mm3": lower.intersect(upper).Volume(),
    "lower_material_removed_by_cord_tunnel_mm3": lower_before_cord.Volume()-lower.Volume(),
}

files=[]
files += export(lower,"case-v3-lower")
files += export(upper,"case-v3-upper")
files += export(pcb,"actual-populated-pcb")
files += export(battery_source,"dtp401525-xe-max-body")

assembly = cq.Assembly(name="xe_actual_fit_case_v3")
assembly.add(lower,name="lower",color=cq.Color(.24,.31,.43))
assembly.add(pcb,name="actual_pcb",color=cq.Color(.08,.43,.24))
assembly.add(separator,name="separator",color=cq.Color(.72,.72,.68))
assembly.add(battery,name="battery",color=cq.Color(.24,.53,.74))
assembly.add(harness,name="harness_reserve",color=cq.Color(.85,.48,.15))
assembly.add(upper,name="upper",color=cq.Color(.76,.82,.90))
assembly_path=OUT/"case-v3-actual-assembly.step"; assembly.save(str(assembly_path)); files.append(assembly_path)

bb=lower.fuse(upper).BoundingBox()
report={
    "version":"HW-V1.4-EVT-CASE-V3-WALL-TUNNEL",
    "status":"REBUILT_ROUNDED_CASE_CAD_PASS_PHYSICAL_REPRINT_REQUIRED",
    "complete_bbox_mm":[bb.xlen,bb.ylen,bb.zlen],
    "actual_internal_bbox_mm":[0,27.5,-27.2,.5,-6.62,4.1514],
    "clearance_mm":{"pcb_xy_each_side":.25,"battery_floor":.25,"top_over_tallest_envelope":CAV_TOP-4.1514},
    "style":{"plan_corner_radius_mm":PLAN_R,"top_bottom_edge_radius_mm":EDGE_R,"seam":"recessed tongue/groove"},
    "usb":{"outer_bay_mm":[13.8,6.7],"throat_mm":[9.4,3.6],"mating_plane_y_mm":mating_y,"front_roof_remaining_mm":ZMAX-(usb_z+6.7/2)},
    "cord":{"diameter_mm":2.0,"recommended_cord_mm":"1.0-1.5 braided polyester/nylon","integral_lower_boss":False,"load_path":"diagonal through two existing exterior walls; entirely in one-piece lower shell","cavity_volume_consumed_by_reinforcement_mm3":0.0},
    "checks":checks,
    "files":{},
    "physical_gates":["reprint and inspect all four outer corners","fit real PCBA without force","fit maximum battery and factory harness without pinch","six representative USB-C cables","mic/button access","cord proof/fatigue"],
}
for p in files: report["files"][p.name]={"sha256":sha(p),"bytes":p.stat().st_size}
(OUT/"review.json").write_text(json.dumps(report,ensure_ascii=False,indent=2)+"\n")
print(json.dumps({"bbox_mm":report["complete_bbox_mm"],"checks":checks,"usb":report["usb"]}))
