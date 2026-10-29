from pathlib import Path
import wx,math,json
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;b=k.LoadBoard(str(P/'pofv-final-trial.kicad_pcb'));out=[]
def xy(p):return k.ToMM(p.x),k.ToMM(p.y)
def dist(x,y,a,z):
 dx=z[0]-a[0];dy=z[1]-a[1];den=dx*dx+dy*dy;u=max(0,min(1,((x-a[0])*dx+(y-a[1])*dy)/den)) if den else 0
 return math.hypot(x-a[0]-u*dx,y-a[1]-u*dy)
vias=[];tracks=[];pads=[]
for t in b.GetTracks():
 if isinstance(t,k.PCB_VIA):vias.append((xy(t.GetPosition()),max(.1+k.ToMM(t.GetDrillValue())/2+.2,.2+k.ToMM(t.GetWidth(k.F_Cu))/2+.1)))
 elif t.GetNetname()!='/GND':tracks.append((xy(t.GetStart()),xy(t.GetEnd()),.2+k.ToMM(t.GetWidth())/2+.11))
for f in b.GetFootprints():
 for pad in f.Pads():
  if pad.GetNetname()=='/GND':continue
  q=pad.GetBoundingBox();pads.append([k.ToMM(v) for v in [q.GetX(),q.GetY(),q.GetWidth(),q.GetHeight()]])
for ix in range(180,261):
 for iy in range(290,361):
  x,y=ix*.05,iy*.05
  if any(math.dist((x,y),pos)<rad for pos,rad in vias):continue
  if any(dist(x,y,a,z)<rad for a,z,rad in tracks):continue
  if any(a-.31<x<a+w+.31 and c-.31<y<c+h+.31 for a,c,w,h in pads):continue
  out.append([math.hypot(x-11.02,y-16.48),x,y])
out.sort();(P/'usb-ground-sites.json').write_text(json.dumps(out[:20],indent=2));print(out[:5])
