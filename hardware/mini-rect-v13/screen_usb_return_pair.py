from pathlib import Path
import shutil,wx
app=wx.App(False)
import pcbnew as k
p=Path(__file__).resolve().parent;b=k.LoadBoard(str(p/'usb-ground-corridor.kicad_pcb'))
for t in list(b.GetTracks()):
 if isinstance(t,k.PCB_VIA) or t.GetLayer()!=k.In2_Cu or t.GetNetname()!='/USB_DP':continue
 a=(k.ToMM(t.GetStart().x),k.ToMM(t.GetStart().y));z=(k.ToMM(t.GetEnd().x),k.ToMM(t.GetEnd().y))
 if {a,z}!={(14.9284,9.155),(16.3606,9.155)}:continue
 width=t.GetWidth();net=t.GetNetCode();b.DeleteNative(t)
 points=[(14.9284,9.155),(15.2734,9.5),(16.0156,9.5),(16.3606,9.155)]
 for a,z in zip(points,points[1:]):
  tr=k.PCB_TRACK(b);tr.SetLayer(k.In2_Cu);tr.SetNetCode(net);tr.SetWidth(width);tr.SetStart(k.VECTOR2I(k.FromMM(a[0]),k.FromMM(a[1])));tr.SetEnd(k.VECTOR2I(k.FromMM(z[0]),k.FromMM(z[1])));b.Add(tr)
 break
else:raise RuntimeError('Expected segment absent')
for t in list(b.GetTracks()):
 if isinstance(t,k.PCB_VIA) or t.GetLayer()!=k.In2_Cu or t.GetNetname()!='/USB_DM':continue
 a=(k.ToMM(t.GetStart().x),k.ToMM(t.GetStart().y));z=(k.ToMM(t.GetEnd().x),k.ToMM(t.GetEnd().y))
 if {a,z}!={(15.1647,8.5953),(16.3712,8.5953)}:continue
 width=t.GetWidth();net=t.GetNetCode();b.DeleteNative(t)
 points=[(15.1647,8.5953),(15.5194,8.95),(16.0165,8.95),(16.3712,8.5953)]
 for a,z in zip(points,points[1:]):
  tr=k.PCB_TRACK(b);tr.SetLayer(k.In2_Cu);tr.SetNetCode(net);tr.SetWidth(width);tr.SetStart(k.VECTOR2I(k.FromMM(a[0]),k.FromMM(a[1])));tr.SetEnd(k.VECTOR2I(k.FromMM(z[0]),k.FromMM(z[1])));b.Add(tr)
 break
else:raise RuntimeError('Expected DM segment absent')
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(p/'usb-return-pair-candidate.kicad_pcb'),b);shutil.copyfile(p/'power-width-candidate.kicad_pro',p/'usb-return-pair-candidate.kicad_pro')
