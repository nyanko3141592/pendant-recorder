from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
upper,lower=[cq.importers.importStep(str(O/f'rounded-glue-{n}-study.step')).val()for n in ['upper','lower']];b=cq.Compound.makeCompound([upper,lower]).BoundingBox();cx=(b.xmin+b.xmax)/2;cy=(b.ymin+b.ymax)/2
rect=cq.Workplane('XY').box(b.xlen-1.6,b.ylen-1.6,b.zlen-1.6,centered=(True,True,False))
rounded=rect.edges('|Z').fillet(.7);wedge=rect.cut(rounded).translate((cx,cy,b.zmin+.8)).val()
board=cq.importers.importStep(str(O/'glue-case-candidate-integrated-board.step')).val();sep=cq.importers.importStep(str(O/'battery-separator-study.step')).val();pack=cq.importers.importStep(str(O/'dtp401525-xe-pack-max.step')).val().translate((8.25,-13.5,-6.62))
checks={n:wedge.intersect(s).Volume()for n,s in [('board',board),('separator',sep),('pack',pack)]};assert max(checks.values())<1e-7
results={}
for name,s,z0,z1 in [('upper',upper,.4,b.zmax),('lower',lower,b.zmin,.4)]:
 clip=cq.Workplane('XY').box(100,100,z1-z0,centered=(True,True,False)).translate((cx,cy,z0)).val();part=s.fuse(wedge.intersect(clip)).clean();assert part.isValid()and len(part.Solids())==1
 file=O/f'rounded-glue-reinforced-{name}-study.step';cq.exporters.export(part,str(file));lengths=[]
 for sx in [-1,1]:
  for sy in [-1,1]:
   x=b.xmin+1.5 if sx<0 else b.xmax-1.5;y=b.ymin+1.5 if sy<0 else b.ymax-1.5;z=1 if name=='upper'else -1
   edge=cq.Edge.makeLine(cq.Vector(x,y,z),cq.Vector(x+sx*2,y+sy*2,z));lengths.append(sum(e.Length()for e in part.intersect(edge).Edges()))
 results[name]={'added_volume_mm3':part.Volume()-s.Volume(),'corner_diagonal_wall_mm':lengths,'sha256':hashlib.sha256(file.read_bytes()).hexdigest()}
r={'status':'INTERNAL_CORNER_REINFORCEMENT_CANDIDATE','outer_radius_mm':1.5,'inner_radius_mm':.7,'external_envelope_unchanged':True,'reinforcement_obstacle_overlap_mm3':checks,'results':results,'limits':['Nominal geometry only; minimum wall near apertures and rounded top/bottom edges not globally verified','Adhesive joint and manufacturing tolerances unresolved','Original battery leads and mating housing absent']};(O/'glue-case-corner-reinforcement-review.json').write_text(json.dumps(r,indent=2)+'\n');print(r)
