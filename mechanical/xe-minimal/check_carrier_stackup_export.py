"""Reconcile STEP body with stackup and produce an explicitly conservative envelope."""
from pathlib import Path
import json,re,hashlib
from decimal import Decimal
import cadquery as cq
P=Path(__file__).resolve().parent;H=P.parents[1]/'hardware/xe-minimal/current-single-carrier-trial';pcb=H/'panel-rounded.kicad_pcb';step=H/'rounded-fabrication-review/carrier-substrate.step';text=pcb.read_text();stack=text.split('(stackup',1)[1].split('(copper_finish',1)[0]
layers=[{'name':m.group(1),'thickness_mm':float(m.group(2))} for m in re.finditer(r'\(layer "([^"]+)"\s*\(type "[^"]+"\)\s*\(thickness ([\d.]+)\)',stack)];assert len(layers)==11
s=cq.importers.importStep(str(step)).val();b=s.BoundingBox();total=sum(Decimal(str(x['thickness_mm'])) for x in layers);outer=sum(Decimal(str(x['thickness_mm'])) for x in layers if x['name'] in ['F.Cu','B.Cu']);interior=total-outer
assert abs(float(interior)-b.zlen)<1e-7
faces=[f for f in s.Faces() if f.geomType()=='PLANE' and abs(f.Center().z-b.zmin)<1e-7 and abs(f.normalAt().z)>.999]
assert len(faces)==1
face=faces[0];envelope=cq.Solid.extrudeLinear(face.outerWire(),face.innerWires(),cq.Vector(0,0,.93));assert envelope.isValid();out=H/'rounded-fabrication-review/carrier-max-thickness-envelope.step';cq.exporters.export(envelope,str(out))
r={'status':'STACKUP_ARITHMETIC_RECONCILED_EXPORT_ENVELOPE_NOT_PHYSICAL_MEASUREMENT','pcb_sha256':hashlib.sha256(pcb.read_bytes()).hexdigest(),'substrate_step_sha256':hashlib.sha256(step.read_bytes()).hexdigest(),'layers':layers,'stack_sum_mm':float(total),'outer_copper_total_mm':float(outer),'interior_stack_mm':float(interior),'exported_body_z_range_mm':[b.zmin,b.zmax],'interpretation':'Observed STEP body thickness equals total stack minus the two outer copper layers. This is inferred from output and stackup, not a verified exporter implementation contract.','case_envelope':{'path':str(out),'sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'z_range_mm':[0,.93],'basis':'Existing finished-PCB upper thickness envelope; retains exported XY and all drilled holes. Full XY cross-section extruded to .93, not a physical copper reconstruction.'},'limits':['Do not replace existing .73.. .93 finished thickness checks with .7564 substrate thickness.','Envelope excludes solder, components, warpage and manufacturing variation outside assumed range.','Carrier tooling and depanelization remain unqualified.']};(H/'rounded-fabrication-review/stackup-export-review.json').write_text(json.dumps(r,indent=2)+'\n');print(total,outer,interior,'envelope',envelope.BoundingBox().zlen)
