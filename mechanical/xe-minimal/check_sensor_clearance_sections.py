"""Compare local transverse material sections around the sensor lead cutouts."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
files={'lower_before':'film-battery-end-wide-350um-lower-trial.step','lower_after':'film-sensor-clearance-200um-lower-trial.step','separator_before':'film-roomier-joint-separator-trial.step','separator_after':'film-sensor-clearance-200um-separator-trial.step'}
shapes={k:cq.importers.importStep(str(O/f)).val().translate((-7.6,25.5,0)).rotate((0,0,0),(0,0,1),28) for k,f in files.items()}
rows=[]
for yi in range(21):
 y=21.5+yi*.25
 for zi in range(15):
  z=-2.6+zi*.1
  ray=cq.Edge.makeLine(cq.Vector(-4,y,z),cq.Vector(4,y,z))
  for part in ('lower','separator'):
   intervals={}
   for version in ('before','after'):
    hit=shapes[f'{part}_{version}'].intersect(ray)
    intervals[version]=sorted([[e.BoundingBox().xmin,e.BoundingBox().xmax] for e in hit.Edges() if e.Length()>1e-6])
   old=sum(b-a for a,b in intervals['before']);new=sum(b-a for a,b in intervals['after'])
   if old-new>1e-6:rows.append({'part':part,'sensor_local_y_mm':y,'assembly_z_mm':z,'intervals_x_mm':intervals,'removed_length_mm':old-new,'remaining_length_mm':new})
r={'status':'LOCAL_TRANSVERSE_SECTION_COMPARISON_NOT_STRENGTH_APPROVAL','sources_sha256':{f:hashlib.sha256((O/f).read_bytes()).hexdigest() for f in files.values()},'probe_grid':{'y_mm':[21.5,26.5,.25],'z_mm':[-2.6,-1.2,.1],'x_range_mm':[-4,4]},'changed_probes':rows,'fully_removed_previously_occupied_probes':[x for x in rows if x['remaining_length_mm']<1e-6],'limits':['One transverse direction and discrete sections only; no global minimum wall thickness.','Intervals can represent intentional lips or disconnected sections, not structural load paths.','No print strength, retention load or thermal contact inference.']}
(O/'film-sensor-clearance-200um-sections.json').write_text(json.dumps(r,indent=2)+'\n')
print('changed',len(rows),'fully removed',len(r['fully_removed_previously_occupied_probes']))
for part in ('lower','separator'):
 q=[b-a for row in rows if row['part']==part for a,b in row['intervals_x_mm']['after']]
 print(part,'minimum sampled remaining interval',min(q) if q else None)
