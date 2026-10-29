"""Sample outward ground strips beside the routed inner pair; not a field solver."""
from pathlib import Path
import wx,pcbnew as k,json,math,hashlib
app=wx.App(False);P=Path(__file__).resolve().parent;src=P/'usb-symmetric-pair-candidate.kicad_pcb';b=k.LoadBoard(str(src))
zones=[z for z in b.Zones() if z.GetNetname()=='/GND' and z.GetLayer()==k.In2_Cu]
tracks={n:[t for t in b.GetTracks() if not isinstance(t,k.PCB_VIA) and t.GetNetname()==n and t.GetLayer()==k.In2_Cu] for n in ['/USB_DP','/USB_DM']}
def xy(q):return k.ToMM(q.x),k.ToMM(q.y)
def closest(q,t):
 a,c=xy(t.GetStart()),xy(t.GetEnd());dx,dy=c[0]-a[0],c[1]-a[1];u=max(0,min(1,((q[0]-a[0])*dx+(q[1]-a[1])*dy)/(dx*dx+dy*dy)));return a[0]+u*dx,a[1]+u*dy
rows=[]
for net,other in [('/USB_DP','/USB_DM'),('/USB_DM','/USB_DP')]:
 samples=[];lengths={'with_ground':0.,'without_ground':0.}
 for t in tracks[net]:
  a,c=xy(t.GetStart()),xy(t.GetEnd());length=k.ToMM(t.GetLength());dx,dy=(c[0]-a[0])/length,(c[1]-a[1])/length;n=max(1,math.ceil(length/.05));half=k.ToMM(t.GetWidth())/2
  for i in range(n):
   u=(i+.5)/n;q=(a[0]+u*(c[0]-a[0]),a[1]+u*(c[1]-a[1]));neighbors=[closest(q,v) for v in tracks[other]];v=min(neighbors,key=lambda v:math.dist(q,v));nx,ny=-dy,dx
   if (v[0]-q[0])*nx+(v[1]-q[1])*ny>0:nx,ny=-nx,-ny
   # Sample outside pair, just past 0.15 mm clearance, plus 0.05 mm outward strip.
   checks=[]
   for extra in [.16,.185,.21]:
    pt=k.VECTOR2I(k.FromMM(q[0]+nx*(half+extra)),k.FromMM(q[1]+ny*(half+extra)))
    checks.append(any(z.HitTestFilledArea(k.In2_Cu,pt) for z in zones))
   ok=all(checks);lengths['with_ground' if ok else 'without_ground']+=length/n;samples.append({'xy_mm':q,'outward_normal':[nx,ny],'ground_samples':checks})
 rows.append({'net':net,'length_mm':sum(lengths.values()),'length_by_ground_mm':lengths,'samples':samples})
r={'status':'COPLANAR_GROUND_GEOMETRY_SCREEN_ONLY','source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'rows':rows,'limitations':['Outward direction estimated by nearest opposite-net point; fanouts and bends can be ambiguous','Three lateral sample points per 0.05 mm path do not establish continuous or adequately wide ground','Ground connection, laminate and manufacturing tolerances still require review','Missing copper means ideal coplanar calculator assumptions do not directly apply']}
(P/'usb-coplanar-ground-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps([{k:v for k,v in x.items() if k!='samples'} for x in rows],indent=2))
