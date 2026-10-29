"""Rebuild a coupled In2 USB pair with retained MCU/ESD fanout; trial only."""
from pathlib import Path
import math,json,shutil,hashlib
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent;src=P/'acoustic-clearance-candidate.kicad_pcb';out=P/'usb-pair-trial.kicad_pcb';b=k.LoadBoard(str(src));old=k.LoadBoard(str(P.parent/'mini-rect-v13/mic-jlc-overlap-candidate.kicad_pcb'))
nets=['/USB_DP','/USB_DM'];oldJ=next(f for f in old.GetFootprints() if f.GetReference()=='J1');jp={p.GetPosition().x:p.GetPosition() for p in oldJ.Pads() if p.GetNetname() in nets}
def v(x,y):return k.VECTOR2I(k.FromMM(x),k.FromMM(y))
for t in list(b.GetTracks()):
 if t.GetNetname() in nets:b.DeleteNative(t)
fpoints={(q.x,q.y) for t in old.GetTracks() if not isinstance(t,k.PCB_VIA) and t.GetLayer()==k.F_Cu and t.GetNetname() in nets and min(t.GetStart().y,t.GetEnd().y)>k.FromMM(14) for q in [t.GetStart(),t.GetEnd()]}
retained=0
for t in old.GetTracks():
 if t.GetNetname() not in nets:continue
 if not isinstance(t,k.PCB_VIA) and t.GetLayer()==k.In2_Cu:continue
 c=t.Duplicate();c.SetNet(b.FindNet(t.GetNetname()))
 # ESD and local fanout moved 7mm. Socket moved6; map exact connector terminals.
 if min(t.GetStart().y,t.GetEnd().y)>k.FromMM(14):
  if isinstance(c,k.PCB_VIA):
   q=t.GetPosition();c.Move(v(0,6 if (q.x,q.y) in fpoints else 7))
  else:
   for get,setter in [(t.GetStart,c.SetStart),(t.GetEnd,c.SetEnd)]:
    q=get();delta=6 if (q.x,q.y) in fpoints else 7;setter(v(k.ToMM(q.x),k.ToMM(q.y)+delta))
 b.Add(c);retained+=1
center=[(16.3659,8.87515),(15.7659,8.87515),(15.04655,8.87515),(12.10795,11.81375),(12.10795,12.58725),(12.32525,12.80455),(12.32525,20.56985),(10.825364,22.069736),(10.4011,22.494)]
width=.1171;gap=.1199;offset=(width+gap)/2;normals=[];paths={}
for a,z in zip(center,center[1:]):
 dx,dy=z[0]-a[0],z[1]-a[1];length=math.hypot(dx,dy);normals.append((-dy/length,dx/length))
for name,sign,first,last in [('/USB_DP',-1,(16.3606,9.155),(10.4011,22.7731)),('/USB_DM',1,(16.3712,8.5953),(10.4011,22.2149))]:
 path=[first]
 for i in range(1,len(center)-1):
  n,m=normals[i-1],normals[i];den=1+n[0]*m[0]+n[1]*m[1];path.append((center[i][0]+sign*offset*(n[0]+m[0])/den,center[i][1]+sign*offset*(n[1]+m[1])/den))
 if name=='/USB_DP':path.append((10.60,22.7731))
 path.append(last);paths[name]=path
 for a,z in zip(path,path[1:]):
  t=k.PCB_TRACK(b);t.SetLayer(k.In2_Cu);t.SetNet(b.FindNet(name));t.SetWidth(k.FromMM(width));t.SetStart(v(*a));t.SetEnd(v(*z));b.Add(t)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out),b)
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),out.with_suffix(ext))
r=dict(status='PAIR_ROUTING_TRIAL_NOT_RELEASED',source_sha256=hashlib.sha256(src.read_bytes()).hexdigest(),width_mm=width,edge_gap_mm=gap,retained_fanout_items=retained,paths=paths,limitations=['Fanout stretching at J1 requires DRC and USB topology review','New corridor may intersect non-USB traces; do not manufacture','Impedance and return-plane coverage not qualified']);(P/'usb-pair-trial-review.json').write_text(json.dumps(r,indent=2)+'\n')
