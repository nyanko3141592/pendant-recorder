"""Separate intentional PCB seat contact from upper-case clearance."""
from pathlib import Path
import cadquery as cq,json,hashlib
from OCP.BRepExtrema import BRepExtrema_DistShapeShape
P=Path(__file__).resolve().parent;files=['tab-clearance-upper-trial.step','wider-right-support-lower-trial.step'];rows=[]
for width in [4.,5.]:
 for residual in [.1,.2,.3]:
  tab=cq.Workplane('XY').box(width,residual,.93,centered=(False,False,False)).translate((20.2-width/2,-27-residual,0)).val()
  for name in files:
   other=cq.importers.importStep(str(P/name)).val();d=BRepExtrema_DistShapeShape(tab.wrapped,other.wrapped);d.Perform();assert d.IsDone()
   points=[]
   for i in range(1,d.NbSolution()+1):
    a=d.PointOnShape1(i);b=d.PointOnShape2(i);points.append({'tab':[a.X(),a.Y(),a.Z()],'case':[b.X(),b.Y(),b.Z()]})
   contact=d.Value()<1e-7
   seat=contact and all(abs(p['tab'][2])<1e-7 and abs(p['case'][2])<1e-7 for p in points) and name.startswith('wider-right')
   rows.append({'width_mm':width,'residual_mm':residual,'other':name,'distance_mm':d.Value(),'overlap_mm3':tab.intersect(other).Volume(),'nearest_points':points,'classification':'LOWER_PCB_SEATING_PLANE_CONTACT' if seat else 'POSITIVE_GAP' if not contact else 'UNCLASSIFIED_CONTACT'})
assert all(r['classification']!='UNCLASSIFIED_CONTACT' and r['overlap_mm3']<1e-7 for r in rows)
r={'status':'NOMINAL_CONTACT_LOCATION_SCREEN','sources_sha256':{f:hashlib.sha256((P/f).read_bytes()).hexdigest() for f in files},'rows':rows,'finding':'The zero minimum distance is the lower PCB seating plane at z=0. The upper case has a positive gap for these samples.','limits':['Only sampled nominal remnant widths and lengths; no print or machining tolerances.','Positive gap does not prove sufficient manufacturing allowance or retention strength.']}
(P/'tab-clearance-contact-location-review.json').write_text(json.dumps(r,indent=2)+'\n');print([(x['width_mm'],x['residual_mm'],x['classification'],round(x['distance_mm'],4)) for x in rows])
