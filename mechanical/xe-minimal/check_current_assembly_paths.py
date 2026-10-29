"""Current represented solids only; missing leads/housing prevent assembly approval."""
from pathlib import Path
import cadquery as cq,json,hashlib,itertools
O=Path(__file__).resolve().parent
files={'lower':'offset-pack-lower-trial.step','upper':'thickness-clearance-upper-trial.step','board':'dmn-candidate-integrated-board.step','separator':'support-notched-separator-trial.step','battery':'offset-pack-assembly-trial.step'}
s={k:cq.importers.importStep(str(O/f)).val()for k,f in files.items()};pairs=[]
for a,b in itertools.combinations(s,2):pairs.append({'a':a,'b':b,'intersection_mm3':s[a].intersect(s[b]).Volume()})
paths=[]
for name in ['battery','separator']:
 shape=s[name];sweeps=[]
 for f in shape.Faces():
  if f.geomType()=='PLANE' and abs(abs(f.normalAt().z)-1)<1e-7:sweeps.append(cq.Solid.extrudeLinear(f.outerWire(),f.innerWires(),cq.Vector(0,0,20)))
 assert sweeps
 volumes=[s['lower'].intersect(shape).Volume()]+[s['lower'].intersect(t).Volume()for t in sweeps]
 paths.append({'part':name,'motion':'Translation down20mm to final pose, horizontal-face extrusion screen','horizontal_faces':len(sweeps),'maximum_overlap_with_lower_mm3':max(volumes)})
r={'status':'CURRENT_NOMINAL_GEOMETRY_SCREEN_NOT_ASSEMBLY_APPROVAL','source_sha256':{k:hashlib.sha256((O/f).read_bytes()).hexdigest()for k,f in files.items()},'final_pose_all_pairs':pairs,'insertion_screens':paths,'limits':['Only represented bodies; original mating housing, leads and thermal interface absent','Horizontal-face sweeps apply to prismatic battery/separator only','Board movement is separately screened in offset-stack-candidate-review.json','Separate successful movements do not prove a premated battery/board/lead assembly can be inserted','No print tolerances, deformation, swelling, connector engagement or assembly forces are qualified']}
(O/'current-assembly-path-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
