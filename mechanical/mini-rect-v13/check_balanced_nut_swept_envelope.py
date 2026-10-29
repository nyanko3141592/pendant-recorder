"""Conservative continuous straight nut insertion envelope, with PCB present."""
from pathlib import Path
import json,math,hashlib,cadquery as cq
p=Path(__file__).resolve().parent/'captive-nut-balanced-trial';f=p/'ASSEMBLY-NOT-RELEASED.step';s=cq.importers.importStep(str(f)).val().Solids();assert len(s)==86
# Convex hull of translated outer hexagons is exact translational sweep for
# this convex prism. Filling the threaded bore makes the envelope conservative.
def hull(points):
 points=sorted(set(points))
 def cross(o,a,b):return (a[0]-o[0])*(b[1]-o[1])-(a[1]-o[1])*(b[0]-o[0])
 lo=[];hi=[]
 for a in points:
  while len(lo)>=2 and cross(lo[-2],lo[-1],a)<=0:lo.pop()
  lo.append(a)
 for a in reversed(points):
  while len(hi)>=2 and cross(hi[-2],hi[-1],a)<=0:hi.pop()
  hi.append(a)
 return lo[:-1]+hi[:-1]
rows=[]
for x in [2.2,20.8]:
 radius=2.5/(2*math.cos(math.pi/6));verts=[]
 for dy in [0,-5]:
  verts += [(x+radius*math.cos(math.radians(30+i*60)),5+dy+radius*math.sin(math.radians(30+i*60))) for i in range(6)]
 swept=cq.Workplane('XY').polyline(hull(verts)).close().extrude(.8).val().translate((0,0,12.35))
 collisions=[]
 for i in [0]+list(range(2,82)):
  c=swept.intersect(s[i])
  if not c.isValid() or c.Volume()>1e-6:collisions.append(dict(solid_index=i,overlap_mm3=c.Volume(),valid=c.isValid()))
 rows.append(dict(x_mm=x,path_y_mm=[0,5],envelope_valid=swept.isValid(),collisions=collisions))
r=dict(status='CONTINUOUS_NOMINAL_NUT_INSERTION_ENVELOPE',step_sha256=hashlib.sha256(f.read_bytes()).hexdigest(),rows=rows,method='Convex outer hexagonal prism swept 5mm along Y, bore filled; against case body and all80 PCB/component/battery solids with lid removed',limitations=['No tweezers/finger access envelope','Nominal nut dimensions; supplier and print tolerances excluded','Lid motion still only discrete samples','Keeper retention under load and plastic cap strength not proven'])
(p/'nut-sweep-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
