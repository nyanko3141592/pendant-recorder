"""Explore 0.2mm rectangular insulation clearance without changing outer size."""
from pathlib import Path
import cadquery as cq
import hashlib,json
O=Path(__file__).resolve().parent
margin=.2
cuts=[]
for sign in (-1,1):
 specs=[(sign*.9-.55,sign*.9+.55,23.2,26,-2.47,-1.37),(sign*.95-.43,sign*.95+.43,22,23.05,-2.4,-1.66),(min(sign*.95-.43,sign*.9-.55),max(sign*.95+.43,sign*.9+.55),23,23.4,-2.47,-1.37)]
 for x0,x1,y0,y1,z0,z1 in specs:
  cut=cq.Workplane('XY').box(x1-x0+2*margin,y1-y0+2*margin,z1-z0+2*margin,centered=False).translate((x0-margin,y0-margin,z0-margin)).val()
  cuts.append(cut.rotate((0,0,0),(0,0,1),-28).translate((7.6,-25.5,0)))
rows=[]
insulation=cq.importers.importStep(str(O/'film-sensor-insulation-transition.step')).val()
modified={}
for label,filename in [('lower','film-battery-end-wide-350um-lower-trial.step'),('separator','film-roomier-joint-separator-trial.step')]:
 source=O/filename;before=cq.importers.importStep(str(source)).val()
 after=before.cut(*cuts).clean()
 assert after.isValid() and len(after.Solids())==1,label
 bb0,bb1=before.BoundingBox(),after.BoundingBox()
 same=all(abs(getattr(bb0,k)-getattr(bb1,k))<1e-7 for k in ('xmin','xmax','ymin','ymax','zmin','zmax'))
 assert same,label
 output=O/f'film-sensor-clearance-200um-{label}-trial.step'
 cq.exporters.export(after,str(output))
 modified[label]=after
 rows.append({'nominal_insulation_gap_mm':after.distance(insulation),'part':label,'source':filename,'source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'output':output.name,'output_sha256':hashlib.sha256(output.read_bytes()).hexdigest(),'removed_mm3':before.Volume()-after.Volume(),'single_valid_solid':True,'same_outer_bounds':same})
seat_overlap=modified['lower'].intersect(modified['separator'].translate((0,0,-.001))).Volume()
r={'separator_down_1um_overlap_proxy_mm3':seat_overlap,'status':'EXPLORATORY_SENSOR_CLEARANCE_NOT_ADOPTED','clearance_budget_mm':margin,'parts':rows,'limits':['Expanded conservative rectangular insulation envelopes, not actual solder/tape geometry.','Wall thickness, support seating, sensor retention and thermal contact require checks.','Slicing and printed bead clearance not yet checked.','0.2mm is an engineering trial allowance, not measured A1 mini tolerance.','Original battery harness and plug remain excluded.']}
(O/'film-sensor-clearance-200um-review.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps(rows,indent=2))
