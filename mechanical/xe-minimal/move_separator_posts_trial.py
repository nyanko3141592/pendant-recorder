from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent;source=O/'adhesive-pocket-032-lower-trial.step';case=cq.importers.importStep(str(source)).val();sep=cq.importers.importStep(str(O/'support-notched-separator-trial.step')).val();pack=cq.importers.importStep(str(O/'offset-pack-assembly-trial.step')).val();board=cq.importers.importStep(str(O/'glue-case-candidate-integrated-board.step')).val();floor=case.BoundingBox().zmin+.8;top=sep.BoundingBox().zmin
for y in [-7,-20]:
 old=cq.Workplane('XY').box(1,2,top-floor+.001,centered=(True,True,False)).translate((16.7,y,floor)).val();case=case.cut(old)
 new=cq.Workplane('XY').box(1,2,top-floor+.1,centered=(True,True,False)).translate((17.1,y,floor-.1)).val();case=case.fuse(new)
case=case.clean();assert case.isValid()and len(case.Solids())==1
rows=[]
for name,part in [('pack',pack),('separator',sep)]:
 hits=[]
 for f in part.Faces():
  if f.geomType()=='PLANE'and abs(abs(f.normalAt().z)-1)<1e-7:hits.append(case.intersect(cq.Solid.extrudeLinear(f.outerWire(),f.innerWires(),cq.Vector(0,0,20))).Volume())
 rows.append({'part':name,'max_sweep_overlap_mm3':max(hits),'final_case_overlap_mm3':part.intersect(case).Volume()})
checks={'board':board.intersect(case).Volume(),'separator':sep.intersect(case).Volume(),'pack':pack.intersect(case).Volume()}
areas=[]
for y in [-7,-20]:
 face=cq.Face.makeFromWires(cq.Workplane('XY').rect(1,2).val()).translate((17.1,y,top));areas.append(sum(face.intersect(f).Area()for f in sep.Faces()if abs(f.BoundingBox().zmin-top)<1e-7 and abs(f.BoundingBox().zmax-top)<1e-7))
cq.exporters.export(case,str(O/'offset-pack-lower-trial.step'));r={'status':'SHIFTED_SEPARATOR_POSTS_TRIAL','source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'post_x_shift_mm':.4,'note':'Original features support separator ears; not dedicated battery retainers','final_intersections_mm3':checks,'continuous_sweeps':rows,'separator_bearing_area_each_mm2':areas,'limits':['Original wires/mating housing and physical tolerances unresolved','Separator support stiffness and PLA bearing strength not qualified','Full PCB insertion sweep not yet verified','No adopted case or manufacturing package change']};(O/'offset-pack-lower-review.json').write_text(json.dumps(r,indent=2));print(r)
