"""Candidate board geometry with sourced envelopes; not fabrication/fit approval."""
from pathlib import Path
import json,hashlib,subprocess,cadquery as cq
O=Path(__file__).resolve().parent
root=O.parents[1]
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
I=json.loads((O/'tmux-candidate-board-inventory.json').read_text())
old=json.loads((O/'board-inventory.json').read_text())
board=root/I['board_path'];assert sha(board)==I['pcb_sha256']
parts={p['ref']:p for p in I['parts']};previous={p['ref']:p for p in old['parts']}
assert 'Q5' not in parts
reused=['J2','U1','U10','U11','U14','U8']
for ref in reused:
 for field in ['position_mm','rotation_deg','side','footprint']:
  assert parts[ref][field]==previous[ref][field],(ref,field)
exclude=set(reused+['U16','C34'])
refs=','.join(p for p in parts if p not in exclude)
base=O/'tmux-candidate-library-components.step'
cmd=['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','export','step','--force','--define-var','KICAD10_3DMODEL_DIR=/Applications/KiCad/KiCad.app/Contents/SharedSupport/3dmodels','--component-filter',refs,'-o',str(base),str(board)]
r=subprocess.run(cmd,capture_output=True,text=True)
(O/'tmux-candidate-step-export.log').write_text(r.stdout+r.stderr)
r.check_returncode()
a=cq.Assembly(name='tmux_candidate_partial_board');sources=[]
def add(file,name):
 p=O/file;s=cq.importers.importStep(str(p)).val();assert s.isValid();a.add(s,name=name);sources.append({'file':file,'sha256':sha(p)});return s
add(base.name,'current_board_and_library_models')
for ref,stem in [('U8','u8-body'),('U14','u14-envelope'),('U10','u10-envelope'),('U1','u1-envelope'),('J2','j2-header')]:
 add(stem+'-positioned-study.step',ref)
p=O/'u11-package-body-max.step';s=cq.importers.importStep(str(p)).val();f=parts['U11'];s=s.rotate((0,0,0),(1,0,0),180).rotate((0,0,0),(0,0,1),f['rotation_deg']).translate((f['position_mm'][0],-f['position_mm'][1],0));a.add(s,name='U11');sources.append({'file':p.name,'sha256':sha(p)})
for ref in ['U16','C34']:add(ref.lower()+'-tmux-candidate-envelope.step',ref)
out=O/'tmux-candidate-integrated-board.step';a.export(str(out));shape=cq.importers.importStep(str(out)).val();assert shape.isValid()
checks=[]
for file in ['retained-upper-case-study.step','retained-lower-case-study.step','battery-separator-study.step']:
 other=cq.importers.importStep(str(O/file)).val();checks.append({'file':file,'sha256':sha(O/file),'intersection_volume_mm3':shape.intersect(other).Volume()})
report={'status':'CANDIDATE_INTEGRATED_GEOMETRY_NOT_FIT_APPROVAL','pcb_sha256':sha(board),'output_sha256':sha(out),'sources':sources,'retained_envelope_pose_checked':reused,'excluded_library_models':sorted(exclude),'removed_Q5_present':False,'study_intersections':checks,'limitations':['Generic library bodies are not manufacturer maximum dimensions','J2 pose remains provisional; mating plug and original battery leads absent','Zero solder standoff is a visualization datum','Battery swelling, closure, thermal contact and assembly access remain unresolved','This candidate is not the adopted canonical circuit']}
(O/'tmux-candidate-integrated-review.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(report,indent=2))
