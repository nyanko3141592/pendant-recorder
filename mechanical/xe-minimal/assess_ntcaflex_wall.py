from pathlib import Path
import cadquery as cq, json
p=Path(__file__).resolve().parent
s=cq.importers.importStep(str(p/'vendor/ntcaflex/NTCAFLEX05103HH.STEP')).val().rotate((0,0,0),(1,0,0),90).rotate((0,0,0),(0,0,1),120).translate((12.9,-5,-2.32))
l=cq.importers.importStep(str(p/'ntcaflex-relocated-support-lower-trial.step')).val()
i=s.intersect(l); b=i.BoundingBox(); sb=s.BoundingBox()
r={'status':'WALL_EXPANSION_ESTIMATE_ONLY_NOT_ADOPTED','pose':{'head_xy_mm':[12.9,-5],'angle_deg':120},'intersection_volume_mm3':i.Volume(),'intersection_bounds_mm':{a:[getattr(b,a+'min'),getattr(b,a+'max')]for a in 'xyz'},'sensor_rightmost_x_mm':sb.xmax,'existing_local_inner_wall_x_mm':24.3,'nominal_reference_clearance_target_mm':0.2,'estimated_right_wall_shift_mm':sb.xmax+0.2-24.3,'estimated_outer_width_mm':26.2+sb.xmax+0.2-24.3,'limitations':['Only nominal related HH geometry; exact GL maximum geometry unresolved.','Local wall translation estimate; no modified case, separator, lid or slicer validation.','Not a complete enclosure size, harness fit or mounting qualification.','0.2 mm is a design exploration allowance, not validated print tolerance.']}
(p/'ntcaflex-wall-expansion-estimate.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
