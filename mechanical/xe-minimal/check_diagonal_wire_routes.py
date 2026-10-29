"""Routes from diagonal sensor joint budget to board underside; not qualified harness."""
from pathlib import Path
import cadquery as cq,json,hashlib,math
from wire_geometry import rounded
O=Path(__file__).resolve().parent
files={'board':'film-sensor-depopulated-board-study.step','separator':'diagonal-bridge-separator-trial.step','lower':'diagonal-film-lower-trial.step','upper':'tab-clearance-upper-trial.step','battery':'offset-pack-assembly-trial.step'}
s={k:cq.importers.importStep(str(O/v)).val() for k,v in files.items()}
c=math.cos(math.radians(28));t=math.sin(math.radians(28))
def point(x,y,z):return [7.6+c*x+t*y,-25.5-t*x+c*y,z]
starts=[point(x,25.5,-1.92) for x in [-.9,.9]]
rows=[];models={}
for swap in [False,True]:
 pads=[14.48,16.13] if not swap else [16.13,14.48]
 for height in [-1.65,-1.45,-1.25]:
  for radius in [.3,.5,.75]:
   paths=[[start,[px,-1.055,height],[px,-1.055,-.2]] for start,px in zip(starts,pads)]
   row={'swap_pads':swap,'horizontal_approach_height_mm':height,'radius_mm':radius,'paths_mm':paths}
   try:
    pairs=[rounded(p,radius) for p in paths];w=[p[0] for p in pairs];shape=cq.Compound.makeCompound(w)
    row.update(valid=all(q.isValid() for q in w),lengths_mm=[p[1] for p in pairs],overlap_mm3={k:shape.intersect(q).Volume() for k,q in s.items()},clearance_mm={k:shape.distance(q) for k,q in s.items()},wire_gap_mm=w[0].distance(w[1]))
    row['nominal_clear']=row['valid'] and max(row['overlap_mm3'].values())<1e-8 and row['wire_gap_mm']>1e-6
    if row['nominal_clear']:models[len(rows)]=shape
   except ValueError as e:row['error']=str(e)
   rows.append(row)
selected=max(models,key=lambda i:min(list(rows[i]['clearance_mm'].values())+[rows[i]['wire_gap_mm']])) if models else None
if selected is not None:
 a=cq.Assembly(name='diagonal_wire_route_budget')
 for k,q in s.items():a.add(q,name=k)
 a.add(models[selected],name='wire_budget');a.export(str(O/'diagonal-wire-route-study.step'))
r={'status':'DIAGONAL_WIRE_ROUTE_SCREEN_NOT_ADOPTED','sources_sha256':{k:hashlib.sha256((O/v).read_bytes()).hexdigest() for k,v in files.items()},'rows':rows,'selected_row':selected,'clear_count':len(models),'limits':['Start is inside provisional sensor joint budget; exit tangent, solder and insulation transition not designed.','Ends stop 0.2 mm below pads; solder and strain relief absent.','Wire diameter 0.31 mm nominal; radius is a geometry hypothesis, not supplier rating.','No original battery harness or full assembly path included.']}
(O/'diagonal-wire-route-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps({'clear_count':len(models),'selected':rows[selected] if selected is not None else None},indent=2))
