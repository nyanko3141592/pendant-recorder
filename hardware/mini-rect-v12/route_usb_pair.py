"""Explicit two-trace USB corridor; trial only until DRC/DFM/impedance review."""
from pathlib import Path
import wx,json,shutil,subprocess
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;name='usb-pair-trial';b=k.LoadBoard(str(P/'power-width-candidate.kicad_pcb'))
for ext in ['kicad_pro','kicad_sch']:shutil.copy2(P/('power-width-candidate.'+ext),P/(name+'.'+ext))
for t in list(b.GetTracks()):
 if t.GetNetname() in ['/USB_DP','/USB_DM']:b.DeleteNative(t)
def pt(x,y):return k.VECTOR2I(k.FromMM(x),k.FromMM(y))
def path(net,layer,points):
 for a,z in zip(points,points[1:]):
  t=k.PCB_TRACK(b);t.SetStart(pt(*a));t.SetEnd(pt(*z));t.SetWidth(k.FromMM(.1));t.SetLayer(layer);t.SetNetCode(b.FindNet(net).GetNetCode());b.Add(t)
def via(net,x,y):
 v=k.PCB_VIA(b);v.SetPosition(pt(x,y));v.SetWidth(k.FromMM(.35));v.SetDrill(k.FromMM(.15));v.SetViaType(k.VIATYPE_THROUGH);v.SetLayerPair(k.F_Cu,k.B_Cu);v.SetNetCode(b.FindNet(net).GetNetCode());b.Add(v)
path('/USB_DM',k.F_Cu,[(8.3125,10.65),(7.3,10.65),(6.8,11.15),(6.8,13.8),(7.8,14.8),(10.2,14.8),(10.75,15.35),(10.75,15.31)])
path('/USB_DP',k.F_Cu,[(8.3125,11.15),(7.65,11.15),(7.05,11.75),(7.05,13.7),(7.9,14.55),(9.9,14.55),(10.25,14.9),(10.25,15.31)])
for net,xs in [('/USB_DP',[10.25,11.25]),('/USB_DM',[9.75,10.75])]:
 for x in xs:via(net,x,15.31)
path('/USB_DP',k.B_Cu,[(10.25,15.31),(10.25,14.8),(11.25,14.8),(11.25,15.31),(12.15,16.21),(12.15,16.9875),(11.7,16.9875),(10.0,16.9875)])
path('/USB_DM',k.B_Cu,[(9.75,15.31),(9.75,15.7),(10.75,15.7),(10.75,15.31)])
path('/USB_DM',k.B_Cu,[(10.0,15.9125),(10.75,15.9125),(11.7,15.9125)])
path('/USB_DM',k.B_Cu,[(10.75,15.7),(10.75,15.9125)])
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(P/(name+'.kicad_pcb')),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(P/(name+'.kicad_pcb')),'--format','json','-o',str(P/(name+'-drc.json'))],check=True)
