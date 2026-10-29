from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
source=O/'offset-pack-lower-trial.step';old=cq.importers.importStep(str(source)).val()
# Extend the existing right support 0.25 mm at each end, with unchanged seat Z=0.
lip=cq.Workplane('XY').box(1.2,2.0,.3,centered=(False,False,False)).translate((23.3,-9,-.3)).val()
new=old.fuse(lip).clean();assert new.isValid() and len(new.Solids())==1
bounds=lambda s:[getattr(s.BoundingBox(),k) for k in ['xmin','ymin','zmin','xmax','ymax','zmax']]
assert all(abs(a-b)<1e-6 for a,b in zip(bounds(old),bounds(new)))
checks={}
for name in ['ncu-candidate-integrated-board.step','thickness-clearance-upper-trial.step','support-notched-separator-trial.step','offset-pack-assembly-trial.step']:
 part=cq.importers.importStep(str(O/name)).val();checks[name]=sum(new.intersect(s).Volume() for s in part.Solids())
assert max(checks.values())<1e-5,checks
out=O/'wider-right-support-lower-trial.step';cq.exporters.export(new,str(out))
r={'status':'GEOMETRY_TRIAL_NOT_ADOPTED','source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'output_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'right_support_y_bounds_mm':[-9,-7],'seat_z_mm':0,'added_volume_mm3':new.Volume()-old.Volume(),'unchanged_bounds_mm':bounds(new),'nominal_intersections_mm3':checks,'limits':['No original wire or plug model','Insertion path, tolerance, thermal and printed strength not qualified']}
(O/'wider-right-support-review.json').write_text(json.dumps(r,indent=2)+'\n');print(r)
