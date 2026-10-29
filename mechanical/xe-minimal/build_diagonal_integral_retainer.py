"""Attach joint cap to removable separator so buyer handles one module."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
files={'separator':'diagonal-bridge-separator-trial.step','cap':'diagonal-recessed-joint-cap-trial.step','lower':'diagonal-recessed-cap-lower-trial.step','board':'film-sensor-depopulated-board-study.step','battery':'offset-pack-assembly-trial.step','upper':'tab-clearance-upper-trial.step'}
s={k:cq.importers.importStep(str(O/v)).val() for k,v in files.items()};rows=[];models={}
for y in [-5.8,-5,-4.2]:
 leg=cq.Workplane('XY').box(.6,.6,1.05,centered=(False,False,False)).translate((15.4,y,-1.97)).val()
 roof=cq.Workplane('XY').box(2.2,.6,.4,centered=(False,False,False)).translate((15.4,y,-1.32)).val()
 arm=leg.fuse(roof)
 combined=s['separator'].fuse(arm,s['cap']).clean()
 row={'arm_y_start_mm':y,'valid':combined.isValid(),'solid_count':len(combined.Solids()),'arm_separator_overlap_mm3':arm.intersect(s['separator']).Volume(),'arm_cap_overlap_mm3':arm.intersect(s['cap']).Volume(),'overlap_mm3':{k:combined.intersect(s[k]).Volume() for k in ['lower','board','battery','upper']}}
 row['nominal_joined_clear']=row['valid'] and row['solid_count']==1 and max(row['overlap_mm3'].values())<1e-8
 if row['nominal_joined_clear']:models[len(rows)]=combined
 rows.append(row)
chosen=next(iter(models),None)
if chosen is not None:cq.exporters.export(models[chosen],str(O/'diagonal-integral-retainer-separator-trial.step'))
r={'status':'INTEGRAL_SEPARATOR_RETAINER_TRIAL_NOT_ADOPTED','sources_sha256':{k:hashlib.sha256((O/v).read_bytes()).hexdigest() for k,v in files.items()},'rows':rows,'selected_row':chosen,'limits':['Cap integrated into separator avoids a loose buyer-installed cap; seller preassembly path not proven.','New arm to sensor/joints/wires requires integrated checks.','Cap limits upward travel only; axial retention still unresolved.','Printing, stiffness, insertion and tolerances unqualified.']}
(O/'diagonal-integral-retainer-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
