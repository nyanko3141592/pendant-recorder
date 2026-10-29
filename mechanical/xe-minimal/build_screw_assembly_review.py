from pathlib import Path
import cadquery as cq,json,math,hashlib
O=Path(__file__).resolve().parent
files={'board':'screw-candidate-integrated-board.step','upper':'raised-nut-screw-upper-trial.step','lower':'raised-nut-screw-lower-trial.step','separator':'battery-separator-study.step'}
parts={n:cq.importers.importStep(str(O/f)).val()for n,f in files.items()}
pose=json.loads((O/'battery-over-connector-review.json').read_text())['selected_geometric_candidate'];parts['battery']=cq.importers.importStep(str(O/'dtp401525-xe-pack-max.step')).val().translate((pose['pack_x_min_mm']+7.75,-13.5,pose['pack_z_range_mm'][0]))
def cylinder(r,z0,z1):return cq.Workplane('XY').circle(r).extrude(z1-z0).translate((18.1,-26,z0)).val()
parts['screw_envelope']=cylinder(.5,-3.3,1.7).fuse(cylinder(.9,1.7,2.15))
parts['nut_envelope']=cq.Workplane('XY').polygon(6,2.5/math.cos(math.pi/6)).extrude(.8).translate((18.1,-26,-2.9)).val().cut(cylinder(.5,-3,-2))
checks=[]
for fast in ['screw_envelope','nut_envelope']:
 for other in ['board','upper','lower','separator','battery']:
  checks.append({'a':fast,'b':other,'intersection_mm3':parts[fast].intersect(parts[other]).Volume()})
a=cq.Assembly(name='single_screw_closure_candidate')
for n,s in parts.items():assert s.isValid();a.add(s,name=n)
out=O/'screw-closure-assembly-review.step';a.export(str(out))
r={'status':'INTEGRATED_SINGLE_SCREW_CANDIDATE_NOT_COMPLETE','sources':{f:hashlib.sha256((O/f).read_bytes()).hexdigest()for f in files.values()},'output_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'fastener_checks':checks,'limitations':['Smooth nominal fastener envelopes, no thread chamfer/runout or screw recess model','Nut retention and second fixing point missing','Original battery wires and mating housing missing','Thermal contact/acoustic path/button features not integrated here','Generic component models and no tolerance qualification','No assembly sequence or operating runtime approval']}
(O/'screw-closure-assembly-review.json').write_text(json.dumps(r,indent=2)+'\n');print(checks)
