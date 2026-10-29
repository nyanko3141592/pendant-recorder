"""Remove obsolete JT terminal holder from alternative-sensor carrier trial."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent;p=O/'ntcaflex-board-relief-separator-trial.step';s=cq.importers.importStep(str(p)).val()
# Region encloses former JT terminal pocket; new sensor has a separate mounting path.
cut=cq.Workplane('XY').box(8,5.5,3,centered=False).translate((14.5,-6.5,-3)).val()
a=s.cut(cut).clean();lower=cq.importers.importStep(str(O/'ntcaflex-relocated-support-lower-trial.step')).val()
out=O/'ntcaflex-trimmed-separator-trial.step';cq.exporters.export(a,str(out))
r={'status':'OBSOLETE_HOLDER_REMOVAL_TRIAL_NOT_COMPLETE_CARRIER','source_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'output_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'valid':a.isValid(),'solids':len(a.Solids()),'removed_volume_mm3':s.Volume()-a.Volume(),'support_proxy_before_mm3':s.translate((0,0,-.001)).intersect(lower).Volume(),'support_proxy_after_mm3':a.translate((0,0,-.001)).intersect(lower).Volume(),'limits':['JT terminal retention intentionally removed only in NTCAFLEX alternative branch.','New sensor fastening, thermal interface and complete insulation barrier are not yet provided.','Lower support proxy is not strength or physical assembly evidence.','Printed connectivity must be checked after slicing.']}
(O/'ntcaflex-trim-review.json').write_text(json.dumps(r,indent=2)+'\n');print(r)
