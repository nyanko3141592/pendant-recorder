"""Candidate local relief for a routed carrier tab remnant; external envelope fixed."""
from pathlib import Path
import cadquery as cq,json,hashlib
P=Path(__file__).resolve().parent;src=P/'thickness-clearance-upper-trial.step'
old=cq.importers.importStep(str(src)).val()
# 5mm tab centered x20.2, with 0.2mm lateral study margin and 0.3mm remnant.
# Floor of retention remains above max PCB .93 by .10mm, matching existing stop target.
cut=cq.Workplane('XY').box(5.4,.36,1.03,centered=(False,False,False)).translate((17.5,-27.35,0)).val()
new=old.cut(cut).clean()
assert new.isValid() and len(new.Solids())==1
bounds=lambda s:[getattr(s.BoundingBox(),k) for k in ['xmin','ymin','zmin','xmax','ymax','zmax']]
assert max(abs(a-b) for a,b in zip(bounds(old),bounds(new)))<1e-6
assert 0<old.Volume()-new.Volume()<1
out=P/'tab-clearance-upper-trial.step';cq.exporters.export(new,str(out))
r={'status':'LOCAL_RELIEF_TRIAL_NOT_ADOPTED','source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'output_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'cut_bounds_mm':bounds(cut),'unchanged_external_bounds_mm':bounds(new),'removed_volume_mm3':old.Volume()-new.Volume(),'assumed_max_residual_mm':.3,'upper_relief_z_mm':1.03,'max_pcb_thickness_mm':.93,'nominal_vertical_gap_mm':.1,'limits':['Residual length and tool positioning are hypotheses, not manufacturing tolerances.','No printed strength, slice or assembly validation.','Original battery plug, leads and thermal interface remain absent.']}
(P/'tab-clearance-upper-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
