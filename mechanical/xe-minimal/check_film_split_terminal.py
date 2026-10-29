"""Whole sensor diagonal placement; provisional rectangles, not qualified geometry."""
from pathlib import Path
import cadquery as cq,json,hashlib,math
O=Path(__file__).resolve().parent
files={'board':'film-sensor-depopulated-board-study.step','lower':'wider-right-support-lower-trial.step','upper':'tab-clearance-upper-trial.step','battery':'offset-pack-assembly-trial.step','separator':'film-wide-bridge-separator-trial.step'}
s={k:cq.importers.importStep(str(O/v)).val() for k,v in files.items()};rows=[];models=[]
# Head datum at localY0, terminal tips atY26; body treated conservatively uniform.
body=cq.Workplane('XY').box(4.1,22,.5,centered=(True,False,False)).translate((0,0,-2.32)).val()
# Overall max26 minus minimum exposed length4 yields maximum insulated extent22.
# Lead width0.7 is an explicit trial allowance around reference0.5, not a supplier max.
leads=[cq.Workplane('XY').box(.7,4,.5,centered=(True,False,False)).translate((x,22,-2.32)).val() for x in [-.95,.95]]
film=cq.Compound.makeCompound([body]+leads)
joints=cq.Compound.makeCompound([cq.Workplane('XY').box(.9,3,.8,centered=(True,False,False)).translate((x,23,-2.32)).val() for x in [-.9,.9]])
# Remove only an identified separator post for screening; final support must be restored elsewhere.
post=cq.Workplane('XY').box(1,2,5,centered=(False,False,False)).translate((16.6,-8,-7.22)).val()
lower_without_post=s['lower'].cut(post)
holders=cq.Compound.makeCompound([cq.Workplane('XY').box(1.7,3.8,1.6,centered=(True,False,False)).translate((x,22.6,-2.72)).val() for x in [-.9,.9]])
for head_x in [7.4,7.6,7.8]:
 for angle in [28.]:
  pose=lambda q:q.rotate((0,0,0),(0,0,1),-angle).translate((head_x,-25.5,0))
  f,j,h=pose(film),pose(joints),pose(holders);objects={'film':f,'joint':j,'holder_budget':h}
  obstacles={'board':s['board'],'lower_without_post':lower_without_post,'upper':s['upper'],'battery':s['battery']}
  checks={name:{k:q.intersect(v).Volume() for k,v in obstacles.items()} for name,q in objects.items()}
  rows.append({'head_x_mm':head_x,'angle_deg':angle,'overlap_mm3':checks,'clearance_mm':{name:{k:q.distance(v) for k,v in obstacles.items()} for name,q in objects.items()}});models.append((f,j,h))
clear=[i for i,r in enumerate(rows) if all(v<1e-8 for checks in r['overlap_mm3'].values() for v in checks.values())]
if clear:
 i=clear[0];a=cq.Assembly(name='diagonal_retention_budget');a.add(lower_without_post,name='lower_post_removed_trial',color=cq.Color('#aaaaaa'));a.add(s['board'],name='board',color=cq.Color('#328866'))
 for name,q in zip(['film','joints','holder_budget'],models[i]):a.add(q,name=name,color=cq.Color('#ef9850'))
 a.export(str(O/'film-split-terminal-study.step'))
out={'status':'DIAGONAL_RETENTION_SPACE_SCREEN_NOT_ADOPTED','rows':rows,'clear_rows':clear,'terminal_geometry_assumption':{'insulated_length_max_mm':22,'exposed_terminal_length_mm':4,'lead_width_trial_mm':.7,'lead_width_reference_mm':.5,'lead_pitch_max_mm':1.9,'thickness_conservative_mm':.5},'limits':['Terminal width0.7 is not a manufacturer guaranteed maximum.','Only one separator post removed for screening; replacement bearing required.','Holder budgets are solid boxes, not designed assemblies.','Separator slot, original battery leads, wire routes and assembly access unresolved.','No outer-case change or microphone duct removal.']}
(O/'film-split-terminal-review.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2))
