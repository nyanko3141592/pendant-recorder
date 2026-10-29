"""Screen an axial nut keeper envelope; attachment remains a design decision."""
from pathlib import Path
import cadquery as cq,json,hashlib,math
O=Path(__file__).resolve().parent
files={'lower':'closure-acoustic-slim-lower-case-trial.step','upper':'top-led-window-upper-trial.step','board':'top-led-candidate-integrated-board.step','separator':'battery-separator-study.step','battery':'dtp401525-xe-pack-max.step'}
shapes={key:cq.importers.importStep(str(O/f)).val()for key,f in files.items()};shapes['battery']=shapes['battery'].translate((8.25,-13.5,-6.62))
# A transverse stop immediately outside the side-loading nut pocket.
# This is space allocation only; no press fit or snap force is assumed.
keeper=cq.Workplane('XY').box(.4,2.9,1.1,centered=(False,True,False)).translate((19.85,-26,-3.1)).val()
nut=cq.Workplane('XY').polygon(6,2.5/math.cos(math.pi/6)).extrude(.8).translate((18.1,-26,-2.9)).val()
collisions={name:keeper.intersect(s).Volume()for name,s in shapes.items()}
path=[{'x_offset_mm':i*.05,'keeper_nut_overlap_mm3':keeper.intersect(nut.translate((i*.05,0,0))).Volume()}for i in range(61)]
first=next((p['x_offset_mm']for p in path if p['keeper_nut_overlap_mm3']>1e-8),None)
# Subtract only the keeper volume to establish a nominal receiving pocket.
recessed=shapes['lower'].cut(keeper).clean()
assert recessed.isValid() and len(recessed.Solids())==1
cq.exporters.export(recessed,str(O/'nut-keeper-recess-lower-study.step'))
outer=shapes['lower'].BoundingBox();newbox=recessed.BoundingBox()
assert all(abs(getattr(outer,n)-getattr(newbox,n))<1e-6 for n in ['xmin','xmax','ymin','ymax','zmin','zmax'])
r={'status':'KEEPER_SPACE_SCREEN_ATTACHMENT_UNRESOLVED','sources':{f:hashlib.sha256((O/f).read_bytes()).hexdigest()for f in files.values()},'keeper_box_mm':{'xmin':19.85,'xmax':20.25,'ymin':-27.45,'ymax':-24.55,'zmin':-3.1,'zmax':-2.0},'intersections_mm3':collisions,'recessed_lower':{'valid':recessed.isValid(),'solids':len(recessed.Solids()),'outer_bounds_unchanged':True,'removed_volume_mm3':shapes['lower'].Volume()-recessed.Volume(),'keeper_overlap_after_cut_mm3':keeper.intersect(recessed).Volume()},'first_sampled_nut_exit_collision_offset_mm':first,'nut_translation_samples':path,'limits':['Keeper is a separate volume, not attached or manufacturable retention yet','Nominal nut only; tolerance and force unqualified','Wire and mating plug absent','No closure or assembly sequence approval']}
cq.exporters.export(keeper,str(O/'nut-keeper-envelope-study.step'));(O/'nut-keeper-space-review.json').write_text(json.dumps(r,indent=2)+'\n');print(collisions,first)
