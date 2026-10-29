"""Explicit two-trace USB corridor; trial only until DRC/DFM/impedance review."""
from pathlib import Path
import wx,json,shutil,subprocess
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;name='usb-pair-escape';b=k.LoadBoard(str(P/'power-width-candidate.kicad_pcb'))
for ext in ['kicad_pro','kicad_sch']:shutil.copy2(P/('power-width-candidate.'+ext),P/(name+'.'+ext))
for t in list(b.GetTracks()):
 n=t.GetNetname()
 def xy(q):return k.ToMM(q.x),k.ToMM(q.y)
 if n=='/USB_DM' and ((isinstance(t,k.PCB_VIA) and xy(t.GetPosition())[0]<9) or (not isinstance(t,k.PCB_VIA) and (t.GetLayer()==k.In3_Cu or (t.GetLayer()==k.F_Cu and max(xy(t.GetStart())[0],xy(t.GetEnd())[0])<9)))):b.DeleteNative(t)
 elif n=='/USB_DP' and not isinstance(t,k.PCB_VIA) and t.GetLayer()==k.F_Cu and min(xy(t.GetStart())[0],xy(t.GetEnd())[0])<10.25:b.DeleteNative(t)
def pt(x,y):return k.VECTOR2I(k.FromMM(x),k.FromMM(y))
def path(net,layer,points):
 for a,z in zip(points,points[1:]):
  t=k.PCB_TRACK(b);t.SetStart(pt(*a));t.SetEnd(pt(*z));t.SetWidth(k.FromMM(.1));t.SetLayer(layer);t.SetNetCode(b.FindNet(net).GetNetCode());b.Add(t)
def via(net,x,y):
 v=k.PCB_VIA(b);v.SetPosition(pt(x,y));v.SetWidth(k.FromMM(.35));v.SetDrill(k.FromMM(.15));v.SetViaType(k.VIATYPE_THROUGH);v.SetLayerPair(k.F_Cu,k.B_Cu);v.SetNetCode(b.FindNet(net).GetNetCode());b.Add(v)
path('/USB_DM',k.F_Cu,[(8.3125,10.65),(7.6,10.65),(7.1,11.15),(7.1,13.4),(8.0,14.3),(9.4,14.3),(9.75,14.65),(9.75,15.31)])
path('/USB_DP',k.F_Cu,[(8.3125,11.15),(7.95,11.15),(7.35,11.75),(7.35,13.3),(8.1,14.05),(9.65,14.05),(10.25,14.65),(10.25,15.31)])
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(P/(name+'.kicad_pcb')),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(P/(name+'.kicad_pcb')),'--format','json','-o',str(P/(name+'-drc.json'))],check=True)
