from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
p=O/'rounded-glue-reinforced-upper-study.step';s=cq.importers.importStep(str(p)).val()
# Only trim the four PCB overhang stops within the board footprint.
old=.9264;new=1.03
cut=cq.Workplane('XY').box(24,27,new-old,centered=(False,False,False)).translate((0,-27,old)).val()
t=s.cut(cut);removed=s.Volume()-t.Volume()
assert abs(removed-4*.7*1.5*(new-old))<1e-6,removed
assert t.isValid() and len(t.Solids())==1
out=O/'thickness-clearance-upper-trial.step';cq.exporters.export(t,str(out))
cq.exporters.export(t,str(out.with_suffix('.stl')),tolerance=.01,angularTolerance=.1)
r={'status':'THICKNESS_CLEARANCE_CANDIDATE_NOT_RETENTION_APPROVAL','source_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'output_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'old_stop_z_mm':old,'new_stop_z_mm':new,'removed_volume_mm3':removed,'finished_board_mm':[.73,.93],'vertical_play_mm':[.1,.3],'external_bbox_unchanged':all(abs(getattr(s.BoundingBox(),k)-getattr(t.BoundingBox(),k))<1e-7 for k in ['xmin','xmax','ymin','ymax','zmin','zmax']),'limitations':['0.1..0.3mm free play excludes printed-case error and warpage','Rigid stops do not eliminate movement; compliant retention or a qualified pad remains unresolved','No slicing or physical fit confirmation']}
(O/'thickness-clearance-upper-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
