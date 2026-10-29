"""Pad-end solder packaging budget. Does not qualify a vertical wire termination."""
from pathlib import Path
import json,hashlib,cadquery as cq
O=Path(__file__).resolve().parent
mapping=O/'film-pad-mapping-review.json';pads=json.loads(mapping.read_text())['pads']
files={'board':'film-sensor-depopulated-board-study.step','separator':'film-wide-bridge-separator-trial.step','lower':'wider-right-support-lower-trial.step','upper':'tab-clearance-upper-trial.step'}
s={k:cq.importers.importStep(str(O/v)).val() for k,v in files.items()}
rows=[];assembly=cq.Assembly(name='pad_solder_packaging_budget');assembly.add(s['board'],name='board',color=cq.Color('#328866'))
for pad in pads:
 x,y=pad['assembly_xy_mm'];width,length=.6,.75;height=.25
 box=cq.Workplane('XY').box(width,length,height,centered=(True,True,False)).translate((x,y,-height)).val()
 conductor=cq.Solid.makeCylinder(.075,.2,cq.Vector(x,y,-.2))
 rows.append({'pad':pad['number'],'net':pad['net'],'solder_box_mm':[width,length,height],'z_range_mm':[-height,0],'bare_conductor_diameter_mm':.15,'bare_conductor_length_mm':.2,'planar_pad_margin_each_side_mm':[(pad['pad_size_mm'][0]-width)/2,(pad['pad_size_mm'][1]-length)/2],'overlap_mm3':{k:box.intersect(v).Volume() for k,v in s.items()},'conductor_inside_solder_budget':abs(conductor.intersect(box).Volume()-conductor.Volume())<1e-9})
 assembly.add(box,name='pad_'+pad['number']+'_solder_budget',color=cq.Color('#aaaaaa'))
assembly.export(str(O/'film-solder-budget-study.step'))
r={'status':'SOLDER_SPACE_BUDGET_NOT_TERMINATION_APPROVAL','sources_sha256':{k:hashlib.sha256((O/v).read_bytes()).hexdigest() for k,v in files.items()},'pad_mapping_sha256':hashlib.sha256(mapping.read_bytes()).hexdigest(),'rows':rows,'limits':['Rectangular solder envelopes are trial maximum packaging dimensions, not predicted meniscus or manufacturing tolerances.','Vertical end-on termination has no qualified pull strength or fatigue performance. Must add seller-installed strain relief or redesign pads for a supported lap joint.','0.2mm bare length is geometric continuity only; strip process not qualified.','No adjacent copper trace/solder-mask clearance check; body-only collision model is insufficient for electrical shorts.','No buyer soldering or wire processing is allowed.']}
(O/'film-solder-budget-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(rows,indent=2))
