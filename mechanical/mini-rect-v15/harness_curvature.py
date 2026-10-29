"""Fast geometric rejection screen; no claim of full harness fit."""
from pathlib import Path
import json,math
P=Path(__file__).resolve().parent;L=6.88;R=1.4
# sin^2 has zero lateral slope at both ends, matching the return tangent.
def points(A):return [(A*math.sin(math.pi*i/1000)**2,28.9-L*i/1000) for i in range(1001)]
def length(A):
 p=points(A);return .4+math.pi*R+sum(math.dist(a,b) for a,b in zip(p,p[1:]))
rows=[]
for target in [12,15,18]:
 lo,hi=0,10
 for _ in range(60):
  mid=(lo+hi)/2
  if length(mid)<target:lo=mid
  else:hi=mid
 A=(lo+hi)/2;rmin=L*L/(2*math.pi*math.pi*A)
 rows.append(dict(lead_length_mm=target,amplitude_mm=A,min_radius_mm=rmin,meets_assumed_radius=rmin>=R))
maxA=L*L/(2*math.pi*math.pi*R)
r=dict(status='CURVATURE_SCREEN_ONLY_NOT_HARNESS_APPROVAL',assumed_minimum_radius_mm=R,return_chord_mm=L,rows=rows,max_length_with_this_curve_and_radius_mm=length(maxA),rejected_previous_model='sin(2*pi*u) has nonzero endpoint slope and a tangent discontinuity at return entry; its expensive CAD run was intentionally stopped, not timed out',limitations=['1.4mm radius,0.6mm wire OD,exit heights and length datums remain unverified','This rejects only the specified planar curve family, not all possible paths','12mm curvature pass does not establish wire-wire, component or case clearance','15..18mm require another path with more space or a verified smaller allowable radius; do not cut/reterminate purchased leads']);(P/'harness-curvature-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
