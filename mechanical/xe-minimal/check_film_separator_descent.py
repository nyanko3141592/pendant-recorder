"""Exact relative box sweep for separator descent over represented sensor/cell."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
p=O/'film-wide-bridge-separator-trial.step';s=cq.importers.importStep(str(p)).val()
# Moving separator from+20mm to0 equals moving obstacles from-20 to0.
def swept_box(x,y,z,dx,dy,dz,travel=20):return cq.Workplane('XY').box(dx,dy,dz+travel,centered=(False,False,False)).translate((x,y,z-travel)).val()
obstacles={'sensor_envelope':swept_box(6.95,-26.5,-2.32,4.1,26,.5),'battery_envelope':swept_box(.9,-27,-6.62,15.5,27,4.2)}
r={'status':'PARTIAL_CONTINUOUS_DESCENT_SCREEN','source_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'separator_descent_mm':20,'intersection_mm3':{k:s.intersect(v).Volume()for k,v in obstacles.items()},'method':'Exact continuous relative rectangular obstacle prisms; not sampled poses.','conclusion':'Separator can descend vertically over these two fixed envelopes at the proposed pose.','limits':['Only sensor and battery represented; not proof of full assembly sequence.','PCB not installed during this proposed step.','Original battery leads/plug, sensor wiring, joints, tape, case-support insertion and user handling excluded.','No print or placement tolerances; no permission to press sensor into a tight space.']}
(O/'film-separator-descent-review.json').write_text(json.dumps(r,indent=2)+'\n');print(r['intersection_mm3'])
