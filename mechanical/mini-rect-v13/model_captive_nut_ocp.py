"""Captive metal nut closure trial; no manufacturing release."""
import json,math,hashlib
from pathlib import Path
import cadquery as cq
P=Path(__file__).resolve().parent;out=P/'captive-nut-cad-trial';out.mkdir(exist_ok=True)
base=Path('/Users/takahashinaoki/Downloads/Pendant-v13-six-layer-acoustic-r8/print')
body=cq.importers.importStep(str(base/'CASE_R8_ACOUSTIC_CLEARANCE_FIT_ONLY.step')).val()
lid=cq.importers.importStep(str(base/'LID_R6_SHORT_TONGUES_FIT_ONLY.step')).val().translate((0,-25,-14.81)).rotate((0,0,0),(1,0,0),180)
src=P/'recessed-screw-root-trial/ASSEMBLY-NOT-PRINT-RELEASE.step';old=cq.importers.importStep(str(src)).val().Solids();parts=old[2:82]
outer=cq.Workplane('XY').box(23,25,14.81).edges('|Z').fillet(3.5).edges('#Z').fillet(2).val().translate((11.5,12.5,7.405))
def box(x,y,z,w,d,h):return cq.Workplane('XY').box(w,d,h).val().translate((x,y,z+h/2))
def hole(x,y,z,r,h):return cq.Solid.makeCylinder(r,h,cq.Vector(x,y,z))
fasteners=[]
for x,rx in [(2.2,.8),(20.8,22.2)]:
 y=5
 carrier=box(x,y,12.3,3.4,3.8,1.4).intersect(outer)
 root=box(rx,y,10.6,1.2,2.4,1.8).intersect(outer)
 body=body.fuse(root,carrier).clean()
 # Side-loading pocket; .10mm nominal clearance on each flat side, .05 vertically.
 body=body.cut(box(x,4.3,12.55,2.7,4.8,.9),hole(x,y,12.2,.6,1.6)).clean()
 # Relief surrounds carrier; separate lid seat is above cap.
 lid=lid.cut(box(x,y,11.7,3.6,4.0,2.1),box(rx,y,11.7,1.4,2.6,.8)).clean()
 seat=box(x,y,13.8,3.4,3.8,.3).intersect(outer)
 lid=lid.fuse(seat).cut(hole(x,y,14.1,1,1),hole(x,y,13.7,.65,.5)).clean()
 # Lid keeper closes the carrier's front slot when assembled.
 keeper=box(x,2.85,12.55,2.6,.3,1.35).fuse(box(x,3.0,13.8,2.6,.6,.3)).intersect(outer)
 lid=lid.fuse(keeper).clean()
 nut=cq.Workplane('XY').polygon(6,2.5/math.cos(math.pi/6)).extrude(.8).val().rotate((0,0,0),(0,0,1),30).translate((x,y,12.6)).cut(hole(x,y,12.5,.5,1))
 screw=hole(x,y,12.1,.5,2).fuse(hole(x,y,14.1,.9,.45)).clean()
 fasteners.extend([nut,screw])
checks=[]
for name,a in [('body',body),('lid',lid)]:
 for i,b in enumerate(parts):
  c=a.intersect(b)
  if c.Volume()>1e-6:checks.append(dict(a=name,part_index=i+2,volume_mm3=c.Volume(),valid=c.isValid()))
common=body.intersect(lid)
outerrows=[]
for name,a in [('body',body),('lid',lid)]+[(str(i),a) for i,a in enumerate(fasteners)]:
 c=a.cut(outer);outerrows.append(dict(name=name,outside_mm3=c.Volume(),valid=c.isValid()))
fastcheck=[]
for i,a in enumerate(fasteners):
 for name,b in [('body',body),('lid',lid)]:
  c=a.intersect(b);fastcheck.append(dict(fastener=i,case=name,overlap_mm3=c.Volume(),valid=c.isValid()))
f=out/'ASSEMBLY-NOT-RELEASED.step';cq.exporters.export(cq.Compound.makeCompound([body,lid]+parts+fasteners),str(f))
r=dict(status='CAPTIVE_NUT_GEOMETRY_TRIAL_NOT_RELEASED',step_sha256=hashlib.sha256(f.read_bytes()).hexdigest(),body_valid=body.isValid(),lid_valid=lid.isValid(),body_solids=len(body.Solids()),lid_solids=len(lid.Solids()),case_overlap_mm3=common.Volume(),case_intersection_valid=common.isValid(),component_overlaps=checks,outer_checks=outerrows,fastener_case_checks=fastcheck,limitations=['Lid keeper added; insertion/removal and nut escape paths still need verification','Carrier cap .25mm and lid seat .30mm require print process/strength qualification','No thread modeled; screw and nut simplified for geometry','No insertion trajectory or actual assembly tolerance verification'])
(out/'geometry-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
