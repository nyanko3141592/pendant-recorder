"""Segmented recessed butt joint, no thin printed groove lips; study only."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
paths=[O/f'rounded-glue-reinforced-{n}-study.step'for n in ['upper','lower']];u,l=[cq.importers.importStep(str(p)).val()for p in paths];b=l.BoundingBox();depth=.16;seam=.4;end=4.
# Full wall-width pockets end 4mm before each outer corner. Corners remain height stops.
boxes=[(b.xmin-1,b.ymin+end,2.8,b.ylen-2*end),(b.xmax-1.8,b.ymin+end,2.8,b.ylen-2*end),(b.xmin+end,b.ymin-1,b.xlen-2*end,2.8),(b.xmin+end,b.ymax-1.8,b.xlen-2*end,2.8)]
cutters=[]
for x,y,dx,dy in boxes:cutters.append(cq.Workplane('XY').box(dx,dy,depth+.01,centered=(False,False,False)).translate((x,y,seam-depth)).val())
trial=l
for c in cutters:trial=trial.cut(c)
trial=trial.clean();assert trial.isValid() and len(trial.Solids())==1
# Only removal: obstacle interference cannot increase; verify mating geometry and remaining contacts.
def faces(s,z):return [f for f in s.Faces()if f.geomType()=='PLANE'and abs(f.BoundingBox().zmin-z)<1e-6 and abs(f.BoundingBox().zmax-z)<1e-6]
contact=lambda a,b:sum(x.intersect(y).Area()for x in faces(a,seam)for y in faces(b,seam))
old=contact(u,l);new=contact(u,trial);removed=l.cut(trial);assert u.intersect(trial).Volume()<1e-7
out=O/'adhesive-pocket-lower-trial.step';cq.exporters.export(trial,str(out));cq.exporters.export(trial.translate((-b.xmin,-b.ymin,-b.zmin)),str(O/'adhesive-pocket-lower-trial.stl'),tolerance=.01,angularTolerance=.1)
r={'status':'SEGMENTED_RECESSED_BUTT_JOINT_STUDY_NOT_ADOPTED','source_sha256':{p.name:hashlib.sha256(p.read_bytes()).hexdigest()for p in paths},'recess_depth_mm':depth,'corner_stop_extent_from_outer_edge_mm':end,'contact_before_mm2':old,'contact_remaining_mm2':new,'recessed_common_land_mm2':old-new,'total_removed_volume_mm3':removed.Volume(),'valid_single_solid':True,'upper_collision_mm3':u.intersect(trial).Volume(),'external_size_mm':[trial.BoundingBox().xlen,trial.BoundingBox().ylen,trial.BoundingBox().zlen],'limits':['Full-width pockets open to both outer and inner edges; adhesive quantity and squeeze-out exclusion require qualification','0.16mm is a geometry trial, not adhesive manufacturer bondline specification','Corner stops set nominal Z only; lateral alignment requires assembly jig or additional feature','Layer quantization and warped mating faces may alter gap','No adhesive selected or bond strength tested; not for final assembly']};(O/'adhesive-pocket-trial-review.json').write_text(json.dumps(r,indent=2));print(json.dumps(r,indent=2))
