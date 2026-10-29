"""Local edge relief for seller insertion of the preformed wire; candidate only."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent;p=O/'diagonal-integral-retainer-separator-trial.step';s=cq.importers.importStep(str(p)).val()
# Edge notch, not a closed hole: no threading operation for the buyer.
cut=cq.Workplane('XY').box(2,.65,2,centered=(False,False,False)).translate((14.9,-.25,-2.6)).val()
n=s.cut(cut).clean();assert n.isValid() and len(n.Solids())==1
out=O/'diagonal-entry-notched-separator-trial.step';cq.exporters.export(n,str(out))
r={'status':'WIRE_ENTRY_NOTCH_CANDIDATE_NOT_ADOPTED','source_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'output_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'cut_bounds_mm':{'x':[14.9,16.9],'y':[-.25,.4],'z':[-2.6,-.6]},'removed_volume_mm3':s.Volume()-n.Volume(),'valid':n.isValid(),'solid_count':len(n.Solids()),'limits':['Must recheck wire insertion against this new source.','Local stiffness, slicing and manufacturing tolerance not qualified.','Current assembly images and integrated reviews still reference the unnotched separator.']}
(O/'diagonal-wire-entry-notch-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
