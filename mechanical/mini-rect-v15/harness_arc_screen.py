"""Tangent-continuous four-arc lead candidate; rejection screen, not fit approval."""
from pathlib import Path
import math,json
import numpy as np
from scipy.spatial import cKDTree
R=1.4; CHORD=6.88; STEP=.005
BASE=.4+math.pi*R+CHORD

def geometry(length):
 slack=length-BASE
 cap=4*R*(math.pi/2-1)
 if slack<=cap:
  lo,hi=0,math.pi/2
  for _ in range(60):
   t=(lo+hi)/2
   if 4*R*(t-math.sin(t))<slack:lo=t
   else:hi=t
  theta=(lo+hi)/2;h=0
 else:theta=math.pi/2;h=(slack-cap)/2
 return theta,h,CHORD-4*R*math.sin(theta)-2*h*math.cos(theta)

def path(length,x,phase):
 theta,h,spare=geometry(length)
 p=[np.array([x,28.5,4.5])]
 def line(v,l):
  start=p[-1].copy();n=max(1,math.ceil(l/STEP))
  p.extend(start+np.array(v)*l*i/n for i in range(1,n+1))
 line((0,1,0),.4)
 for t in np.linspace(0,math.pi,math.ceil(math.pi*R/STEP)+1)[1:]:
  p.append(np.array([x,28.9+R*math.sin(t),4.5+R*(1-math.cos(t))]))
 line((0,-1,0),phase*spare)
 heading=0.
 for idx,turn in enumerate((theta,-theta,-theta,theta)):
  start=p[-1].copy();a=heading;s=1 if turn>0 else -1
  for t in np.linspace(0,abs(turn),max(2,math.ceil(R*abs(turn)/STEP)+1))[1:]:
   b=a+s*t
   p.append(start+np.array([R/s*(math.cos(a)-math.cos(b)),-R/s*(math.sin(b)-math.sin(a)),0]))
  heading+=turn
  if idx in (0,2):line((math.sin(heading),-math.cos(heading),0),h)
 line((0,-1,0),(1-phase)*spare)
 return np.array(p)
def main():
 rows=[]
 for length in (12.,15.,18.):
  theta,h,spare=geometry(length)
  for phases in ((0,0,0),(0,.5,1),(1,.5,0)):
   wires=[path(length,x,f) for x,f in zip((8.05,9.25,10.45),phases)]
   distances=[float(cKDTree(wires[i]).query(wires[j])[0].min()) for i,j in ((0,1),(1,2),(0,2))]
   assert all(np.linalg.norm(w[-1]-[x,22.02,7.3])<1e-8 for w,x in zip(wires,(8.05,9.25,10.45)))
   rows.append(dict(length_mm=length,phases=phases,angle_rad=theta,straight_mm=h,spare_y_mm=spare,min_sampled_center_distance_mm=min(distances),definite_collision_at_assumed_OD=min(distances)<.6,analytic_min_radius_mm=R,polyline_lengths_mm=[float(np.linalg.norm(np.diff(w,axis=0),axis=1).sum()) for w in wires]))
 result=dict(status='CANDIDATE_SCREEN_ONLY',assumed_wire_OD_mm=.6,sampling_step_mm=STEP,rows=rows,limitations=['Mated connector wire exit and pack length datum remain unverified.','Radius 1.4mm is an assumption, not a manufacturer rating.','Sample distances below OD prove collision; above OD alone do not certify continuous clearance.','No component, case, assembly or tolerance clearance approval.','Equal-length wires only; independent lead tolerances not screened.'])
 Path(__file__).with_name('harness-arc-screen.json').write_text(json.dumps(result,indent=2)+'\n')
 for r in rows:print(r['length_mm'],r['phases'],round(r['min_sampled_center_distance_mm'],4),r['definite_collision_at_assumed_OD'])

if __name__ == "__main__":
 main()
