"""Interference screen for shortest and longest XE leads in populated case."""
raise RuntimeError('Superseded: non-tangent sinusoid path is invalid. Use harness_curvature.py; no CAD fit approval exists.')
from pathlib import Path
import runpy,json,math
import cadquery as cq
P=Path(__file__).resolve().parent;g=runpy.run_path(str(P/'closure_fit.py'));O=Path('/Users/takahashinaoki/Downloads/Pendant-v15-XE-harness-study');O.mkdir(exist_ok=True)
R=1.4;end_y=22.02;L=28.9-end_y
# Follow the allocated connector rear edge; mating shell and wire exits remain assumptions.
def path(x,A):
 pts=[(x,28.5,4.5),(x,28.9,4.5)]
 for i in range(1,61):
  t=math.pi*i/60;pts.append((x,28.9+R*math.sin(t),4.5+R*(1-math.cos(t))))
 for i in range(1,101):
  u=i/100;pts.append((x+A*math.sin(2*math.pi*u),28.9-L*u,7.3))
 return pts
def length(p):return sum(math.dist(a,b) for a,b in zip(p,p[1:]))
def solid(p):
 shapes=[]
 for a,b in zip(p,p[1:]):
  v=cq.Vector(*[bb-aa for aa,bb in zip(a,b)]);shapes.append(cq.Solid.makeCylinder(.3,v.Length,cq.Vector(*a),v.normalized()))
 return cq.Compound.makeCompound(shapes)
rows=[]
for target in [12,15,18]:
 lo,hi=0,5
 for _ in range(50):
  mid=(lo+hi)/2
  if length(path(9.25,mid))<target:lo=mid
  else:hi=mid
 A=(lo+hi)/2;pts=[path(x,A) for x in [8.05,9.25,10.45]];wires=[solid(p) for p in pts];hits=[]
 for i,w in enumerate(wires):
  for name,obj in [('body',g['body']),('lid',g['lid']),('pcb',g['pcb']),('battery',g['battery']),('thermal',g['thermal']),('gasket',g['gasket'])]+g['parts']:
   if name=='J2':continue # Intended termination inside header allocation; not proof of mating geometry.
   v=w.intersect(obj).Volume()
   if v>1e-6:hits.append(dict(wire=i,target=name,overlap_mm3=v))
 pairhits=[]
 for i,j in [(0,1),(1,2),(0,2)]:
  v=wires[i].intersect(wires[j]).Volume()
  if v>1e-6:pairhits.append(dict(wires=[i,j],overlap_mm3=v))
 # Analytic minimum radius at the sinusoid extrema; polysegments are display approximations.
 rmin=L*L/(4*math.pi*math.pi*A) if A else None
 rows.append(dict(nominal_lead_mm=target,model_centerline_mm=length(pts[0]),lateral_amplitude_mm=A,sinusoid_min_radius_mm=rmin,assumed_preferred_min_radius_mm=R,solid_collisions=hits,wire_wire_collisions=pairhits))
 cq.exporters.export(cq.Compound.makeCompound([g['body'],g['lid'],g['battery'],g['pcb']]+[s for _,s in g['parts']]+wires),str(O/f'XE-{target}mm-NOT-MANUFACTURING.step'))
r=dict(status='HARNESS_ROUTE_SCREEN_NOT_QUALIFIED',assumptions=['Wire OD0.6mm and exit z4.5mm unverified','1.4mm bend radius is design assumption, not wire manufacturer limit','Connector terminal edge from Fab allocation, not a verified mated-shell exit','Lead length datum and connector embedded wire length unverified','Polyline cylinders approximate sweeps; boundary contacts need physical validation'],rows=rows);(P/'harness-fit-review.json').write_text(json.dumps(r,indent=2)+'\n');(O/'review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
