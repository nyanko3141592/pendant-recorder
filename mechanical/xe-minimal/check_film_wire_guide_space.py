"""Exact tangent circular bends, selected radii are hypotheses not wire specifications."""
from pathlib import Path
import cadquery as cq
import numpy as np
import math,json,hashlib
O=Path(__file__).resolve().parent
source=O/'film-wire-route-review.json';data=json.loads(source.read_text())
files={'board':'film-sensor-depopulated-board-study.step','separator':'film-wide-bridge-separator-trial.step','lower':'wider-right-support-lower-trial.step','upper':'tab-clearance-upper-trial.step','battery':'offset-pack-assembly-trial.step'}
shapes={k:cq.importers.importStep(str(O/v)).val() for k,v in files.items()}
def rounded(points,r):
 p=[np.array(x,dtype=float) for x in points]; corners={}; trims={}
 for i in range(1,len(p)-1):
  u=(p[i]-p[i-1]);u/=np.linalg.norm(u);v=p[i+1]-p[i];v/=np.linalg.norm(v)
  theta=math.acos(np.clip(np.dot(u,v),-1,1));t=r*math.tan(theta/2)
  a=p[i]-t*u;b=p[i]+t*v;n=v-np.dot(u,v)*u;n/=np.linalg.norm(n);c=a+r*n
  mid=c+r*((a-c)+(b-c))/np.linalg.norm((a-c)+(b-c))
  corners[i]=(a,mid,b);trims[i]=t
 for i in range(len(p)-1):
  if trims.get(i,0)+trims.get(i+1,0)>=np.linalg.norm(p[i+1]-p[i])-1e-7: raise ValueError('radius requires more tangent length than segment provides')
 edges=[];last=p[0]
 for i in range(1,len(p)-1):
  a,m,b=corners[i];edges.append(cq.Edge.makeLine(cq.Vector(*last),cq.Vector(*a)));edges.append(cq.Edge.makeThreePointArc(cq.Vector(*a),cq.Vector(*m),cq.Vector(*b)));last=b
 edges.append(cq.Edge.makeLine(cq.Vector(*last),cq.Vector(*p[-1])))
 path=cq.Wire.assembleEdges(edges);normal=cq.Vector(*(p[1]-p[0]))
 shape=cq.Workplane(cq.Plane(origin=cq.Vector(*p[0]),normal=normal)).circle(.155).sweep(cq.Workplane(obj=path),isFrenet=True).val()
 return shape,path.Length()
source=O/'film-wire-pad-connected-review.json';d=json.loads(source.read_text());r=d['rows'][d['displayed_row']]
wires=[rounded(p,r['radius_mm'])[0] for p in r['paths_mm']];rows=[]
for x in [11.8,12.2,12.6,13.,13.4]:
 slab=cq.Workplane('XY').box(.6,6,4).translate((x,-1,-1)).val();sections=[w.intersect(slab) for w in wires]
 if any(s.Volume()<1e-8 for s in sections):continue
 boxes=[s.BoundingBox() for s in sections];intervals=sorted([(b.ymin-.1,b.ymax+.1) for b in boxes]);web=intervals[1][0]-intervals[0][1]
 ymin=min(a for a,b in intervals)-.4;ymax=max(b for a,b in intervals)+.4
 # Open-top guide proposal, wall top just above wires. Bottom overlaps separator top by.05.
 top=max(b.zmax for b in boxes)+.1;bottom=-1.97
 blank=cq.Workplane('XY').box(.6,ymax-ymin,top-bottom).translate((x,(ymin+ymax)/2,(top+bottom)/2)).val()
 for (low,high),bb in zip([(b.ymin-.1,b.ymax+.1) for b in boxes],boxes):
  floor=bb.zmin-.1
  cut=cq.Workplane('XY').box(.8,high-low,top-floor+.2).translate((x,(low+high)/2,(top+floor+.2)/2)).val();blank=blank.cut(cut)
 rows.append({'x_mm':x,'guide_width_x_mm':.6,'channel_intervals_y_mm':intervals,'middle_web_mm':web,'guide_top_z_mm':top,'shared_floor_z_mm':min(b.zmin for b in boxes)-.1,'added_guide_board_overlap_mm3':blank.intersect(shapes['board']).Volume(),'guide_separator_contact_mm3':blank.intersect(shapes['separator']).Volume(),'minimum_web_trial_mm':.4,'web_screen_pass':web>=.4})
out={'status':'OPEN_GUIDE_SPACE_SCREEN_NOT_STRAIN_RELIEF','wire_review_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'rows':rows,'limits':['0.1mm side clearance and0.4mm web are trial design choices, not qualified print tolerances.','Open guides alone cannot resist pull-out; cap/tape or another retention method remains required.','No new guide adopted or printed.']}
(O/'film-wire-guide-space-review.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(rows,indent=2))
