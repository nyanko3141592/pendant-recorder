"""Candidate board geometry with sourced envelopes; not fabrication/fit approval."""
from pathlib import Path
import json,hashlib,subprocess,cadquery as cq
O=Path(__file__).resolve().parent
root=O.parents[1]
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
I=json.loads((O/'dmn-candidate-board-inventory.json').read_text())
old=json.loads((O/'board-inventory.json').read_text())
board=root/I['board_path'];assert sha(board)==I['pcb_sha256']
parts={p['ref']:p for p in I['parts']};previous={p['ref']:p for p in old['parts']}
assert not set(['Q5','R45','R46','U16','C34','SW1','R4','H4']) & set(parts)
reused=['J2','U1','U10','U11','U14','U8']
for ref in reused:
 for field in ['position_mm','rotation_deg','side','footprint']:
  assert parts[ref][field]==previous[ref][field],(ref,field)
exclude=set(reused+['U13','D6','Q6','Q7'])
refs=','.join(p for p in parts if p not in exclude)
base=O/'dmn-candidate-library-components.step'
cmd=['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','export','step','--force','--define-var','KICAD10_3DMODEL_DIR=/Applications/KiCad/KiCad.app/Contents/SharedSupport/3dmodels','--component-filter',refs,'-o',str(base),str(board)]
r=subprocess.run(cmd,capture_output=True,text=True)
(O/'dmn-candidate-step-export.log').write_text(r.stdout+r.stderr)
r.check_returncode()
a=cq.Assembly(name='tps_candidate_partial_board');sources=[]
def add(file,name):
 p=O/file;s=cq.importers.importStep(str(p)).val();assert s.isValid();a.add(s,name=name);sources.append({'file':file,'sha256':sha(p)});return s
add(base.name,'current_board_and_library_models')
for ref,stem in [('U8','u8-body'),('U14','u14-envelope'),('U10','u10-envelope'),('U1','u1-envelope'),('J2','j2-header')]:
 add(stem+'-positioned-study.step',ref)
p=O/'u11-package-body-max.step';s=cq.importers.importStep(str(p)).val();f=parts['U11'];s=s.rotate((0,0,0),(1,0,0),180).rotate((0,0,0),(0,0,1),f['rotation_deg']).translate((f['position_mm'][0],-f['position_mm'][1],0));a.add(s,name='U11');sources.append({'file':p.name,'sha256':sha(p)})
f=parts['U13'];assert f['side']=='F'
p=root/'hardware/xe-minimal/fixed-usb-limit-trial/tps22950-maximum-envelope.step'
s=cq.importers.importStep(str(p)).val();bb=s.BoundingBox()
s=s.translate((-(bb.xmin+bb.xmax)/2,-(bb.ymin+bb.ymax)/2,-bb.zmin)).rotate((0,0,0),(0,0,1),f['rotation_deg']).translate((f['position_mm'][0],-f['position_mm'][1],I['board_thickness_mm']))
a.add(s,name='U13');sources.append({'file':str(p.relative_to(root)),'sha256':sha(p),'placed_at_board_top':True})
# Candidate manufacturer's maximum rectangular envelope; no solder standoff.
f=parts['D6'];assert f['side']=='F'
p=O/'d6-led-selection-review.json';spec=json.loads(p.read_text())
x,y,h=spec['bounding_envelope_mm']
s=cq.Workplane('XY').box(x,y,h,centered=(True,True,False)).val().rotate((0,0,0),(0,0,1),f['rotation_deg']).translate((f['position_mm'][0],-f['position_mm'][1],I['board_thickness_mm']))
a.add(s,name='D6_candidate_max_envelope');sources.append({'file':p.name,'sha256':sha(p),'candidate_not_adopted':True})
# Conservative manufacturer maximum envelopes replace generic Q6/Q7 models.
for ref in ['Q6','Q7']:
 f=parts[ref];height=1.15
 z=-height if f['side']=='B' else I['board_thickness_mm']
 s=cq.Workplane('XY').box(2.55,3.0,height,centered=(True,True,False)).val().rotate((0,0,0),(0,0,1),f['rotation_deg']).translate((f['position_mm'][0],-f['position_mm'][1],z))
 a.add(s,name=ref+'_DMN2056U_max_envelope')
p=root/'docs/procurement/xe-q6-q7-dmn2056u-review.json'
sources.append({'file':str(p.relative_to(root)),'sha256':sha(p),'candidate_not_adopted':True})
out=O/'dmn-candidate-integrated-board.step';a.export(str(out));shape=cq.importers.importStep(str(out)).val();assert shape.isValid()
checks=[]
for file in ['rounded-glue-upper-study.step','rounded-glue-lower-study.step','battery-separator-study.step']:
 other=cq.importers.importStep(str(O/file)).val();checks.append({'file':file,'sha256':sha(O/file),'intersection_volume_mm3':shape.intersect(other).Volume()})
report={'status':'CANDIDATE_INTEGRATED_GEOMETRY_NOT_FIT_APPROVAL','pcb_sha256':sha(board),'output_sha256':sha(out),'sources':sources,'retained_envelope_pose_checked':reused,'excluded_library_models':sorted(exclude),'removed_Q5_present':False,'study_intersections':checks,'limitations':['Generic library bodies are not manufacturer maximum dimensions','J2 pose remains provisional; mating plug and original battery leads absent','Zero solder standoff is a visualization datum','Battery swelling, closure, thermal contact and assembly access remain unresolved','This candidate is not the adopted canonical circuit']}
(O/'dmn-candidate-integrated-review.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(report,indent=2))
