"""Factory-prepared solder/insulation envelope budget, not a component model."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
files={'board':'ncu-candidate-integrated-board.step','separator':'film-wide-bridge-separator-trial.step','lower':'wider-right-support-lower-trial.step','upper':'tab-clearance-upper-trial.step','battery':'offset-pack-assembly-trial.step'}
s={k:cq.importers.importStep(str(O/v)).val() for k,v in files.items()}
rows=[];models={}
for thickness in [.6,.8,1.,1.2,1.4]:
 pieces=[]
 for x in [8.1,9.9]:
  #3mm lies within4mm minimum exposed terminal length; +.1 lateral envelope
  # covers pitch tolerance only, not assembly placement error.
  pieces.append(cq.Workplane('XY').box(thickness+.1,3,thickness,centered=(True,False,False)).translate((x,-3.5,-2.32)).val())
 shape=cq.Compound.makeCompound(pieces);models[thickness]=shape
 row={'joint_box_width_mm':thickness+.1,'joint_box_height_mm':thickness,'length_mm':3,'bottom_z_mm':-2.32,'overlap_mm3':{k:shape.intersect(v).Volume() for k,v in s.items()},'distance_to_board_mm':shape.distance(s['board'])};rows.append(row)
chosen=.8
a=cq.Assembly(name='factory_sensor_joint_budget');a.add(s['board'],name='unchanged_board',color=cq.Color('#328866'));a.add(s['separator'],name='separator_candidate',color=cq.Color('#d8b84e'));a.add(s['battery'],name='battery_envelope',color=cq.Color('#6daed5'));a.add(models[chosen],name='joint_budget_not_selected_parts',color=cq.Color('#b367c9'));a.export(str(O/'film-joint-space-study.step'))
r={'status':'JOINING_SPACE_BUDGET_NOT_PART_SELECTION','sources_sha256':{k:hashlib.sha256((O/v).read_bytes()).hexdigest() for k,v in files.items()},'rows':rows,'joint_centers_x_mm':[8.1,9.9],'joint_y_range_mm':[-3.5,-.5],'displayed_height_mm':chosen,'assembly_responsibility':'Seller solders, insulates and strain-relieves sensor; buyer performs no wiring operations.','assumptions':['Lead tips located atY-.5; sensing strip extends towardnegativeY.','3mm overlap length is design trial, not solder-process qualification.','Bottomdatum matches film placement hypothesis; exposed lead/joint transitions not yet shaped.'],'limits':['Boxes are packaging budgets, not selected tube/wire/solder dimensions.','Existing TH1 remains on board; no electrical substitution yet.','No solder meniscus, stripped-wire length, sleeve recovery, glue, bend radius or assembly tolerances.','Joining heat process must protect film; not performed with battery attached.','Wire routing to PCB pads, insulation material and strain relief remain to be designed.','Nominal zero overlap does not prove production clearance or assembly sequence.']}
(O/'film-joint-space-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(rows,indent=2))
