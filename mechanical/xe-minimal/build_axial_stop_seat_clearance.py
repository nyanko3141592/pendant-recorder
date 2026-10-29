"""Additional seat relief prompted by printed bead-prism interference."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
source=O/'film-axial-stop-relieved-lower-trial.step';lower=cq.importers.importStep(str(source)).val()
# Existing recess starts at -1.32; extend 0.16 mm downward without moving separator.
cut=cq.Workplane('XY').box(3.9,1.4,.46,centered=(True,False,False)).translate((0,22.7,-1.48)).val().rotate((0,0,0),(0,0,1),-28).translate((7.6,-25.5,0))
new=lower.cut(cut).clean();assert new.isValid() and len(new.Solids())==1
out=O/'film-axial-stop-seat-clearance-lower-trial.step';cq.exporters.export(new,str(out))
r={'status':'LOCAL_SEAT_CLEARANCE_TRIAL_REQUIRES_RESLICING','source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'output_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'extra_recess_depth_mm':.16,'removed_volume_mm3':lower.Volume()-new.Volume(),'valid':new.isValid(),'solid_count':len(new.Solids()),'limits':['Seat thickness and retaining strength require review.','No claim of print fit until new slice is screened.','Outer envelope and separator location intentionally unchanged.']}
(O/'film-axial-stop-seat-clearance-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
