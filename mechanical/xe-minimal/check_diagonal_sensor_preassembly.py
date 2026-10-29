"""Exact vertical box sweeps for bare sensor and joint budgets from below."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
source=O/'diagonal-integral-retainer-separator-trial.step';sep=cq.importers.importStep(str(source)).val()
def pose(q):return q.rotate((0,0,0),(0,0,1),-28).translate((7.6,-25.5,0))
def box(w,l,h,x,y,z):return cq.Workplane('XY').box(w,l,h,centered=(True,False,False)).translate((x,y,z)).val()
# A prism enlarged downward by 8 mm is the exact swept envelope for each box.
swept={'body':pose(box(4.1,22,8.5,0,0,-10.32))}
for i,x in enumerate([-.95,.95]):swept[f'lead_{i}']=pose(box(.7,4,8.5,x,22,-10.32))
for i,x in enumerate([-.9,.9]):swept[f'joint_budget_{i}']=pose(box(.9,3,8.8,x,23,-10.32))
checks={k:{'overlap_mm3':q.intersect(sep).Volume(),'minimum_gap_mm':q.distance(sep)} for k,q in swept.items()}
r={'status':'SENSOR_FROM_BELOW_SWEEP_ONLY_NOT_COMPLETE_PREASSEMBLY','separator_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'translation_range_mm':[-8,0],'checks':checks,'limits':['Only bare sensor and provisional joint boxes, not attached wires or board.','Separator must be out of case during this operation; no battery is present.','Preconnected wire flex/routing or in-place soldering process not established.','Sensor terminal size and insulation joint tolerances unresolved.','No force or physical assembly qualification.']}
(O/'diagonal-sensor-preassembly-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
