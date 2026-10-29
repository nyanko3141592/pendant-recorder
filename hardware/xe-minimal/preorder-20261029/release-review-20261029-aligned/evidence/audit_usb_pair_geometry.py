import argparse
ap=argparse.ArgumentParser();ap.add_argument("--board",type=__import__("pathlib").Path);ap.add_argument("--output",type=__import__("pathlib").Path);args=ap.parse_args()
from pathlib import Path
import pcbnew as k,wx,math,json,hashlib,collections
app=wx.App(False);w=Path(__file__).resolve().parent;p=args.board or w/'usb-3313-width-trial.kicad_pcb';b=k.LoadBoard(str(p));xy=lambda q:(k.ToMM(q.x),k.ToMM(q.y))
def distance(q,a,c):
 vx,vy=c[0]-a[0],c[1]-a[1];den=vx*vx+vy*vy;t=max(0,min(1,((q[0]-a[0])*vx+(q[1]-a[1])*vy)/den)) if den else 0
 return math.hypot(q[0]-a[0]-t*vx,q[1]-a[1]-t*vy)
ts=[t for t in b.GetTracks() if not isinstance(t,k.PCB_VIA)];pairs=[t for t in ts if t.GetNetname() in ['/USB_DP','/USB_DM']];rows=[]
for t in pairs:
 a,c=xy(t.GetStart()),xy(t.GetEnd());length=k.ToMM(t.GetLength());n=max(1,math.ceil(length/.1));other=[q for q in pairs if q.GetNetname()!=t.GetNetname() and q.GetLayer()==t.GetLayer()]
 for i in range(n):
  pt=(a[0]+(c[0]-a[0])*(i+.5)/n,a[1]+(c[1]-a[1])*(i+.5)/n)
  if not other:continue
  q=min(other,key=lambda u:distance(pt,xy(u.GetStart()),xy(u.GetEnd())));u,v=xy(q.GetStart()),xy(q.GetEnd());dl=math.hypot(v[0]-u[0],v[1]-u[1]);parallel=abs((c[0]-a[0])*(v[1]-u[1])-(c[1]-a[1])*(v[0]-u[0]))<1e-5*max(length*dl,1e-9)
  gap=distance(pt,u,v)-(k.ToMM(t.GetWidth())+k.ToMM(q.GetWidth()))/2
  rows.append({'net':str(t.GetNetname()),'layer':b.GetLayerName(t.GetLayer()),'xy':pt,'gap_mm':gap,'parallel':parallel,'represented_length_mm':length/n})
summary={}
for name in ['/USB_DP','/USB_DM']:
 r=[a for a in rows if a['net']==name];summary[name]={'sampled_length_mm':sum(a['represented_length_mm'] for a in r),'parallel_gap_0p126_plusminus_0p01_mm_length':sum(a['represented_length_mm'] for a in r if a['parallel'] and abs(a['gap_mm']-.126)<.01),'nonmatching_length_mm':sum(a['represented_length_mm'] for a in r if not(a['parallel'] and abs(a['gap_mm']-.126)<.01))}
out={'sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'summary':summary,'samples':rows,'limits':['Nearest opposite-net segment only; branch total is not endpoint skew','No field solution or same-layer copper assessment','Nominal width/gap calculator applies only to matching parallel portions']};(args.output or w/'usb-pair-geometry.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(summary))
