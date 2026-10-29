"""Ray-sample emitted ring polygon; no continuous tolerance/DFM approval."""
from pathlib import Path
import sys
import json,math,hashlib
from gerbonara import GerberFile
from gerbonara.utils import MM
p=Path(sys.argv[1]) if len(sys.argv)>1 else Path(__file__).resolve().parent/'mic-smd-gerber-review';f=next(p.glob('*.gts'));g=GerberFile.open(f);polys=[]
for o in g.objects:
 b=o.bounding_box(MM)
 if b and 17.9<b[0][0]<18.7 and 20<b[1][0]<20.4:polys.extend(o.to_primitives(unit=MM))
assert len(polys)==1
verts=[(x-19.13,y+16.2) for x,y in polys[0].outline]
def cross(a,b):return a[0]*b[1]-a[1]*b[0]
# Gerber regions encode holes with a zero-width bridge traversed in both
# directions. Those coincident edges are not physical aperture boundaries.
raw_edges=list(zip(verts,verts[1:]+verts[:1]))
bridges=[(a,b) for a,b in raw_edges if a!=b and (b,a) in raw_edges]
edges=[(a,b) for a,b in raw_edges if (a,b) not in bridges]
rows=[]
for deg in [i+.25 for i in range(360)]:
 d=(math.cos(math.radians(deg)),math.sin(math.radians(deg)));hits=[]
 for a,b in edges:
  v=(b[0]-a[0],b[1]-a[1]);den=cross(d,v)
  if abs(den)<1e-12:continue
  t=cross(a,v)/den;u=cross(a,d)/den
  if t>0 and 0<=u<=1:hits.append(t)
 hits=sorted(set(round(t,8) for t in hits));rows.append(dict(angle_deg=deg,radii_mm=hits))
valid=[r['radii_mm'] for r in rows if len(r['radii_mm'])==2]
r=dict(status='DISCRETE_GERBER_RING_SAMPLES_NOT_DFM_APPROVAL',source_sha256=hashlib.sha256(f.read_bytes()).hexdigest(),zero_width_bridge_directed_edges_removed=len(bridges),samples=len(rows),two_boundary_samples=len(valid),anomalies=[r for r in rows if len(r['radii_mm'])!=2],inner_radius_range_mm=[min(x[0] for x in valid),max(x[0] for x in valid)],outer_radius_range_mm=[min(x[1] for x in valid),max(x[1] for x in valid)],nominal_recommendation_mm=[.58,1.03],limitations=['Polygon approximation and offset cause variation; supplier registration not included','360 rays are not full mathematical boundary proof','Ring paste apertures not measured by this script'])
(p/'mask-ring-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
