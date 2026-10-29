from pathlib import Path
import pcbnew as k,wx,json,math
app=wx.App(False);D=Path(__file__).resolve().parent;b=k.LoadBoard(str(D/'led-land-trial/pendant-xe-minimal.kicad_pcb'))
def xy(p):return [k.ToMM(p.x),k.ToMM(p.y)]
def dseg(p,a,z):
 dx,dy=z[0]-a[0],z[1]-a[1];t=max(0,min(1,((p[0]-a[0])*dx+(p[1]-a[1])*dy)/(dx*dx+dy*dy))) if dx or dy else 0
 return math.dist(p,[a[0]+t*dx,a[1]+t*dy])
tracks=[(xy(t.GetStart()),xy(t.GetEnd()),k.ToMM(t.GetWidth(t.TopLayer()) if isinstance(t,k.PCB_VIA)else t.GetWidth())/2) for t in b.GetTracks()if t.GetNetname()!='/GND']
boxes=[]
for f in b.GetFootprints():
 for p in f.Pads():
  if p.GetNetname()=='/GND':continue
  q=p.GetBoundingBox();boxes.append([k.ToMM(x)for x in [q.GetX(),q.GetY(),q.GetRight(),q.GetBottom()]])
rows=[]
for ix in range(100,201):
 for iy in range(220,341):
  p=[ix*.05,iy*.05]
  if any(dseg(p,a,z)<r+.175+.15 for a,z,r in tracks):continue
  if any(math.hypot(max(l-p[0],0,p[0]-r),max(t-p[1],0,p[1]-d))<.325 for l,t,r,d in boxes):continue
  v=k.VECTOR2I(*(k.FromMM(x)for x in p))
  cover={b.GetLayerName(layer):any(q.GetNetname()=='/GND'and q.GetLayer()==layer and q.GetFilledPolysList(layer).Contains(v)for q in b.Zones())for layer in [k.In1_Cu,k.In3_Cu]}
  if all(cover.values()):rows.append({'point_mm':p,'distance_to_CLK_via_mm':math.dist(p,[7.35,13.95]),'ground_center_coverage':cover})
rows.sort(key=lambda r:r['distance_to_CLK_via_mm']);(D/'pdm-stitch-trial/position-screen.json').write_text(json.dumps({'status':'GEOMETRIC_SCREEN_NOT_DRC','candidates':rows,'limits':['Conservative projected pad bounding boxes','Via hole spacing and all constraints require DRC','Plane coverage at center only']},indent=2)+'\n');print(rows[:5])
