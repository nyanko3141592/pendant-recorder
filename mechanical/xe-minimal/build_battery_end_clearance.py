"""Screen local battery end relief; candidates only, no print/retention approval."""
from pathlib import Path
import hashlib,json
import cadquery as cq
O=Path(__file__).resolve().parent
source=O/'film-lead-wrap-clearance-lower-trial.step'
lower=cq.importers.importStep(str(source)).val()
battery=cq.importers.importStep(str(O/'offset-pack-assembly-trial.step')).val()
insulation=cq.importers.importStep(str(O/'film-sensor-insulation-transition.step')).val()
rows=[]
for margin in (.15,.25,.35):
 # Extend only the two end faces, preserving the nominal floor and side supports.
 cuts=[cq.Workplane('XY').box(15.6,margin+.01,4.3,centered=False).translate((.85,y,-6.67)).val() for y in (-27-margin,-.01)]
 candidate=lower.cut(*cuts).clean()
 assert candidate.isValid() and len(candidate.Solids())==1
 b0=lower.BoundingBox();b1=candidate.BoundingBox()
 assert all(abs(getattr(b0,k)-getattr(b1,k))<1e-7 for k in ('xmin','xmax','ymin','ymax','zmin','zmax'))
 name=f'film-battery-end-{round(margin*1000):03d}um-lower-trial.step'
 cq.exporters.export(candidate,str(O/name))
 # Local ray intervals through end walls, not a global thickness certificate.
 probes=[]
 for x in (1.0,4.0,8.0,12.0,16.0):
  for z in (-6.5,-4.5,-2.5):
   for side,start,end in [('negative',-29,-26.9),('positive',-.1,2)]:
    cross=candidate.intersect(cq.Edge.makeLine(cq.Vector(x,start,z),cq.Vector(x,end,z)))
    spans=[[e.BoundingBox().ymin,e.BoundingBox().ymax] for e in cross.Edges()]
    probes.append({'x':x,'z':z,'side':side,'material_y_intervals_mm':spans})
 shifts=[]
 for shift in (-margin,0,margin):
  pack=battery.translate((0,shift,0))
  shifts.append({'battery_shift_y_mm':shift,'lower_overlap_mm3':pack.intersect(candidate).Volume(),'insulation_overlap_mm3':pack.intersect(insulation).Volume(),'insulation_gap_mm':pack.distance(insulation)})
 rows.append({'margin_per_end_mm':margin,'path':name,'sha256':hashlib.sha256((O/name).read_bytes()).hexdigest(),'removed_volume_mm3':lower.Volume()-candidate.Volume(),'valid_single_solid':True,'same_outer_bbox':True,'nominal_battery_gap_mm':battery.distance(candidate),'nominal_battery_overlap_mm3':battery.intersect(candidate).Volume(),'local_end_wall_probes':probes,'battery_shift_checks':shifts})
for row in rows:
 row['minimum_sampled_end_wall_interval_mm']=min(b-a for q in row['local_end_wall_probes'] for a,b in q['material_y_intervals_mm'])
 row['interpretation']='End-face relief is directional; total nearest battery-to-case distance remains 0.07071mm near relief boundaries. This is not uniform clearance equal to the requested end margin.'
r={'status':'END_RELIEF_SCREEN_NOT_ADOPTED','source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'candidates':rows,'limits':['Only local ray probes; no global minimum wall thickness or load qualification.','New clearance allows battery movement: sensor contact/thermal response and wire tension must be checked at all permitted positions.','Original battery harness and plug are absent; no assembly approval.','Printed fit, supports, retention and toolpath review remain untested.']}
(O/'film-battery-end-clearance-review.json').write_text(json.dumps(r,indent=2)+'\n')
for row in rows:print({k:v for k,v in row.items() if k not in ('local_end_wall_probes','sha256')})
