"""Straight maximum-envelope film sensor; exploratory, no selected attachment."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
files={'lower':'wider-right-support-lower-trial.step','upper':'tab-clearance-upper-trial.step','board':'ncu-candidate-integrated-board.step','separator':'support-notched-separator-trial.step','battery':'offset-pack-assembly-trial.step'}
s={k:cq.importers.importStep(str(O/v)).val() for k,v in files.items()}
b=s['battery'].BoundingBox();rows=[]
# Adhesive .1mm is only a placement hypothesis. Entire leads included in box.
for x in [3.1,5,7,9,11,13,14.2]:
 film=cq.Workplane('XY').box(4.1,26,.5,centered=(True,True,False)).translate((x,-13.5,b.zmax+.1)).val()
 row={'center_x_mm':x,'center_y_mm':-13.5,'bottom_z_mm':b.zmax+.1,'overlap_mm3':{k:film.intersect(v).Volume() for k,v in s.items()}}
 rows.append(row)
chosen=min(rows,key=lambda r:(r['overlap_mm3']['board'],abs(r['center_x_mm']-(b.xmin+b.xmax)/2)))
x=chosen['center_x_mm']
film=cq.Workplane('XY').box(4.1,26,.5,centered=(True,True,False)).translate((x,-13.5,b.zmax+.1)).val()
a=cq.Assembly(name='film_sensor_space_study')
for k in ['lower','battery','separator','board']:
 a.add(s[k],name=k,color=cq.Color({'lower':'#a0aab8','battery':'#6daed5','separator':'#d8b84e','board':'#328866'}[k]))
a.add(film,name='UNAPPROVED_sensor_full_envelope',color=cq.Color('#ee8866'))
a.export(str(O/'film-sensor-space-study.step'))
r={'status':'INTERFERENCE_STUDY_NOT_ASSEMBLY_DESIGN','source_sha256':{k:hashlib.sha256((O/v).read_bytes()).hexdigest() for k,v in files.items()},'envelope_mm':[4.1,26,.5],'adhesive_thickness_hypothesis_mm':.1,'rows':rows,'displayed_case':chosen,'conclusions':['Existing separator occupies part of the sensor envelope; unchanged separator cannot be reused for this placement.','All-current-component board is retained in this screen, including existing TH1; no circuit modification assumed.'],'limits':['Uniform box overestimates actual film leads and body; flagged overlap needs detailed-shape review.','No solder joints, wire exits, attachment patch or assembly path modeled.','Battery maximum envelope and fixed top used; no print, battery or placement tolerances.','No separator slot or structural change adopted; cutting needs retention/stiffness review.']}
(O/'film-sensor-space-review.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps(rows,indent=2))
