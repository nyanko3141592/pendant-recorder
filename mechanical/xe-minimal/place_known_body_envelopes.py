"""Partial assembly visualization; body placement does not certify enclosure fit."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
I=json.loads((O/'board-inventory.json').read_text());C=json.loads((O/'model-coverage.json').read_text())
assert I['pcb_sha256']==C['pcb_sha256']
assert h(O/'pcb-partial-components.step')==C['step_sha256']
board=cq.importers.importStep(str(O/'pcb-partial-components.step')).val()
a=cq.Assembly(name='partial_board_with_package_envelopes');a.add(board,name='partial_kicad_export')
reports=[]
for ref,filename,dims in [('U11','u11-package-body-max.step',[8.1,6.3,.9])]:
 p=next(x for x in I['parts'] if x['ref']==ref);assert p['side']=='B';assert p['rotation_deg'] in [0,180]
 s=cq.importers.importStep(str(O/filename)).val();bb=s.BoundingBox();assert all(abs(x-y)<1e-6 for x,y in zip([bb.xlen,bb.ylen,bb.zlen],dims));assert abs(bb.zmin)<1e-6
 # KiCad STEP x=PCB x, y=-PCB y, bottom surface z=0. These symmetric
 # rectangular body envelopes need no pin-orientation mirror correction.
 s=s.rotate((0,0,0),(1,0,0),180).rotate((0,0,0),(0,0,1),p['rotation_deg']).translate((p['position_mm'][0],-p['position_mm'][1],0))
 assert s.isValid();a.add(s,name=ref+'_maximum_body_envelope',color=cq.Color(.9,.45,.1))
 bb=s.BoundingBox();reports.append({'ref':ref,'source_file':filename,'source_sha256':h(O/filename),'body_bounds_mm':[bb.xmin,bb.xmax,bb.ymin,bb.ymax,bb.zmin,bb.zmax],'solder_standoff_mm':0,'solder_standoff_status':'visualization datum only; must be measured or specified before fit approval'})
for ref,stem in [('U8','u8-body'),('U14','u14-envelope'),('U10','u10-envelope'),('U1','u1-envelope'),('J2','j2-header')]:
 review=json.loads((O/(ref.lower()+'-position-review.json')).read_text());assert review['pcb_sha256']==I['pcb_sha256']
 filename=stem+'-positioned-study.step';assert h(O/filename)==review['sha256']
 shape=cq.importers.importStep(str(O/filename)).val();assert shape.isValid();a.add(shape,name=ref+'_conservative_envelope',color=cq.Color(.9,.45,.1));reports.append({'ref':ref,'source_file':filename,'source_sha256':h(O/filename),'body_bounds_mm':review['bounds_mm'],'limitations':review['limitations']})
out=O/'pcb-partial-with-body-envelopes.step';a.export(str(out))
r={'status':'PARTIAL_ASSEMBLY_VISUALIZATION_NOT_FIT_APPROVAL','pcb_sha256':I['pcb_sha256'],'base_step_sha256':C['step_sha256'],'output_sha256':h(out),'placed_envelopes':reports,'remaining_missing_required_bodies':[x for x in C['missing_required_bodies'] if x not in ['U11','U8','U14','U10','U1','J2']],'limitations':['J2 header pose is provisional; manufacturer datum and stand-off require confirmation.','No battery, unmodified cable, mating plug, case, insulation or retention.','Envelope bodies omit terminals; zero solder standoff is a visualization datum, not an assembly dimension.','Existing library geometry has not been manufacturer-verified.']}
(O/'placed-body-envelopes-review.json').write_text(json.dumps(r,indent=2)+'\n');print(r)
