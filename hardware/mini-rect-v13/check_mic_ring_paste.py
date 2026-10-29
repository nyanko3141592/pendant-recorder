"""Inspect emitted polygon stencil apertures, independent of KiCad pad metadata."""
from pathlib import Path
import sys
import hashlib,json,math
from gerbonara import GerberFile
from gerbonara.utils import MM
root=Path(__file__).resolve().parent
review=Path(sys.argv[1]) if len(sys.argv)>1 else root/'mic-smd-gerber-review'
path=next(review.glob('*.gtp'))
rows=[]
for obj in GerberFile.open(path).objects:
    box=obj.bounding_box(MM)
    if not (box and 18<box[0][0] and box[1][0]<20.3 and -17.3<box[0][1] and box[1][1]<-15.1):continue
    for poly in obj.to_primitives(unit=MM):
        assert hasattr(poly,'outline') and all(a is None for a in poly.arc_centers)
        vertices=[(x-19.13,y+16.2) for x,y in poly.outline]
        center=math.atan2(sum(y for x,y in vertices),sum(x for x,y in vertices))
        angles=[center+math.atan2(math.sin(math.atan2(y,x)-center),math.cos(math.atan2(y,x)-center)) for x,y in vertices]
        minima=[]
        for a,b in zip(vertices,vertices[1:]+vertices[:1]):
            dx,dy=b[0]-a[0],b[1]-a[1];den=dx*dx+dy*dy
            t=max(0,min(1,-(a[0]*dx+a[1]*dy)/den)) if den else 0
            minima.append(math.hypot(a[0]+t*dx,a[1]+t*dy))
        rows.append(dict(center_deg=round((math.degrees((max(angles)+min(angles))/2)+360)%360,3),inner_boundary_min_mm=min(minima),outer_boundary_max_mm=max(math.hypot(x,y) for x,y in vertices),angular_span_deg=math.degrees(max(angles)-min(angles)),vertices=len(vertices),dark=poly.polarity_dark))
assert len(rows)==6
assert all(abs(actual-target)<.02 for actual,target in zip(sorted(r['center_deg'] for r in rows),[0,60,120,180,240,300])), rows
# Geometric containment only: previous mask check is sampled, so use an
# intentionally more conservative radial band than its sampled extremes.
for row in rows:row['within_conservative_annulus_0_59_to_1_02']=row['inner_boundary_min_mm']>=.59 and row['outer_boundary_max_mm']<=1.02
out=dict(status='GEOMETRY_REVIEW_NOT_STENCIL_PROCESS_APPROVAL',source_sha256=hashlib.sha256(path.read_bytes()).hexdigest(),manufacturer_reference='reference/infineon-im69d130-v1-timing.pdf page 13 Figure 12',recommendation=dict(inner_radius_mm=.6,outer_radius_mm=1,angular_sector_deg=52,angular_gap_deg=8,rounded_end_radius_mm=.2),apertures=sorted(rows,key=lambda r:r['center_deg']),limitations=['Polygon chord approximation differs slightly from ideal radii and angular span.','Rounded-end radius and paste volume/stencil thickness are not qualified by this check.','Conservative radial containment is not a full Boolean mask intersection check.','Assembly supplier approval remains open.'])
(review/'ring-paste-review.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out,indent=2))
