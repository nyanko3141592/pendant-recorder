"""Continuous box sweeps of unsoldered-to-PCB sensor subassembly; wires excluded."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
p=O/'film-axial-stop-relieved-separator-trial.step';sep=cq.importers.importStep(str(p)).val()
# local xmin/ymin/zmin, dimensions; provisional envelope maxima.
parts={'body':(-2.05,0,-2.32,4.1,22,.5),'lead_left':(-1.3,22,-2.32,.7,4,.5),'lead_right':(.6,22,-2.32,.7,4,.5),'joint_left':(-1.35,23,-2.32,.9,3,.8),'joint_right':(.45,23,-2.32,.9,3,.8)}
def pose(q):return q.rotate((0,0,0),(0,0,1),-28).translate((7.6,-25.5,0))
rows=[]
for label,delta in [('from_below',(0,0,-8)),('from_sensor_tip',(0,-30,0)),('from_above',(0,0,8))]:
 checks={}
 for name,data in parts.items():
  origin=[data[i]+min(0,delta[i]) for i in range(3)];dims=[data[i+3]+abs(delta[i]) for i in range(3)]
  sweep=pose(cq.Workplane('XY').box(*dims,centered=(False,False,False)).translate(tuple(origin)).val())
  checks[name]={'overlap_mm3':sweep.intersect(sep).Volume(),'gap_mm':sweep.distance(sep)}
 rows.append({'direction':label,'start_offset_local_mm':delta,'checks':checks,'nominal_clear':all(q['overlap_mm3']<1e-8 for q in checks.values())})
r={'status':'SENSOR_INSERTION_DIRECTION_SCREEN_NOT_ASSEMBLY_QUALIFICATION','separator_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'rows':rows,'limits':['Seller assembly before PCB soldering and battery/case installation.','Sweeps are exact for these rectangular envelopes and straight translations only.','Flexible wires through axial holes, insulation, gripper, solder heat and actual tolerances excluded.','Clear sensor/joint envelopes alone do not prove a feasible wired assembly sequence.']}
(O/'film-sensor-stop-insertion-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
