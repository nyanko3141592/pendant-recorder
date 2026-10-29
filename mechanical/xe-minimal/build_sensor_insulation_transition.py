"""Continuous finished-envelope transition; not an actual tape process model."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
files={'lower':'film-lead-wrap-clearance-lower-trial.step','separator':'film-roomier-joint-separator-trial.step','board':'film-integration-integrated-board.step','battery':'offset-pack-assembly-trial.step'}
s={k:cq.importers.importStep(str(O/f)).val()for k,f in files.items()}
def pose(q):return q.rotate((0,0,0),(0,0,1),-28).translate((7.6,-25.5,0))
def rectangle(x,y,z,w,h):
 pts=[cq.Vector(x-w/2,y,z-h/2),cq.Vector(x+w/2,y,z-h/2),cq.Vector(x+w/2,y,z+h/2),cq.Vector(x-w/2,y,z+h/2)]
 return cq.Wire.makePolygon(pts+[pts[0]])
rows=[];parts=[]
for sign in [-1,1]:
 lead=cq.Workplane('XY').box(.86,1.05,.74,centered=(True,False,False)).translate((sign*.95,22,-2.4)).val()
 joint=cq.Workplane('XY').box(1.1,2.65,1.1,centered=(True,False,True)).translate((sign*.9,23.35,-1.92)).val()
 transition=cq.Solid.makeLoft([rectangle(sign*.95,23,-2.03,.86,.74),rectangle(sign*.9,23.4,-1.92,1.1,1.1)],ruled=True)
 total=pose(lead.fuse(transition,joint).clean());assert total.isValid() and len(total.Solids())==1;parts.append(total)
 rows.append({'sign':sign,'solid_count':len(total.Solids()),'valid':total.isValid(),'checks':{k:{'overlap_mm3':total.intersect(v).Volume(),'gap_mm':total.distance(v)}for k,v in s.items()}})
a=cq.Assembly(name='sensor_insulation_transition_envelopes')
for i,q in enumerate(parts):a.add(q,name=f'finished_envelope_{i}')
a.export(str(O/'film-sensor-insulation-transition.step'))
r={'status':'CONTINUOUS_ENVELOPE_TRIAL_NOT_INSULATION_PROCESS_QUALIFICATION','sources_sha256':{k:hashlib.sha256((O/f).read_bytes()).hexdigest()for k,f in files.items()},'transition_local_y_mm':[23,23.4],'rows':rows,'conductor_envelope_separation_mm':parts[0].distance(parts[1]),'limits':['Solid envelopes model occupied space; geometric continuity is not proof of electrical insulation.','Tape seams, overlap thickness, actual solder fillet, film-edge sealing and abrasion remain unmodeled.','No minimum axial retaining collar or pull strength defined.']}
(O/'film-sensor-insulation-transition-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
