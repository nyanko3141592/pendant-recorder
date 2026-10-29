"""User-authorized adhesive closure study, with rounded external edges."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
files=['retained-upper-case-study.step','retained-lower-case-study.step','glue-case-candidate-integrated-board.step','battery-separator-study.step','dtp401525-xe-pack-max.step']
upper,lower,board,sep,pack=[cq.importers.importStep(str(O/f)).val()for f in files];pack=pack.translate((8.25,-13.5,-6.62))
b=cq.Compound.makeCompound([upper,lower]).BoundingBox();cx=(b.xmin+b.xmax)/2;cy=(b.ymin+b.ymax)/2
# Retained shells predate screw posts, hooks and nut keeper.
envelope=cq.Workplane('XY').box(b.xlen,b.ylen,b.zlen,centered=(True,True,False)).edges('|Z').fillet(1.5).edges('not |Z').fillet(.4).translate((cx,cy,b.zmin)).val()
upper=upper.intersect(envelope).clean();lower=lower.intersect(envelope).clean()
# Keep top LED optical path and the existing slim microphone duct assumptions.
window=cq.Workplane('XY').center(14.125,-5.975).circle(.6).extrude(8).translate((0,0,.8364)).val();upper=upper.cut(window).clean()
ring=cq.Workplane('XY').circle(.9).circle(.5).extrude(-.15-b.zmin).translate((21.93,-4.565,b.zmin)).val()
bore=cq.Workplane('XY').circle(.5).extrude(-.15-b.zmin+1).translate((21.93,-4.565,b.zmin-.5)).val();lower=lower.fuse(ring).cut(bore).clean()
checks={}
for name,s in [('upper',upper),('lower',lower)]:
 assert s.isValid()and len(s.Solids())==1
 checks[name]={'valid':s.isValid(),'solids':len(s.Solids()),'intersections_mm3':{n:s.intersect(v).Volume()for n,v in [('board',board),('separator',sep),('pack',pack)]}}
 assert max(checks[name]['intersections_mm3'].values())<1e-7
 cq.exporters.export(s,str(O/f'rounded-glue-{name}-study.step'))
a=cq.Assembly(name='rounded_adhesive_case_study');a.add(upper,name='upper',color=cq.Color('#a0aab8'));a.add(lower,name='lower',color=cq.Color('#a0aab8'));a.export(str(O/'rounded-glue-case-study.step'))
r={'status':'USER_AUTHORIZED_ADHESIVE_CLOSURE_GEOMETRY_STUDY','outer_size_mm':[b.xlen,b.ylen,b.zlen],'external_plan_radius_mm':1.5,'external_top_bottom_edge_radius_mm':.4,'closure':'Adhesive after user connects battery and verifies operation','removed_requirements':['Screw and nut closure','Nut keeper','Sliding closure hooks'],'checks':checks,'sources':{f:hashlib.sha256((O/f).read_bytes()).hexdigest()for f in files},'remaining':['Adhesive and case material selection, bond land and bond-line tolerance','Minimum wall thickness and strength after rounding','Original battery leads and mating housing','Microphone seal and adhesive exclusion zone','Battery temperature contact','Omi size and 16h runtime unresolved'],'orders_performed':False}
(O/'rounded-glue-case-review.json').write_text(json.dumps(r,indent=2)+'\n');print(r)
