from pathlib import Path
import shutil,wx
app=wx.App(False)
import pcbnew as k
p=Path(__file__).resolve().parent;b=k.LoadBoard(str(p/'power-width-candidate.kicad_pcb'))
for t in list(b.GetTracks()):
 if t.m_Uuid.AsString()!='21f98904-ad83-439b-945e-dabd435d6f81':continue
 width=t.GetWidth();net=t.GetNetCode();layer=t.GetLayer();b.DeleteNative(t)
 pts=[(17.488,7.7097),(17.1,7.7097),(16.9103,7.52),(16.1,7.52),(15.9103,7.7097),(14.9677,7.7097)]
 for a,z in zip(pts,pts[1:]):
  tr=k.PCB_TRACK(b);tr.SetLayer(layer);tr.SetNetCode(net);tr.SetWidth(width);tr.SetStart(k.VECTOR2I(k.FromMM(a[0]),k.FromMM(a[1])));tr.SetEnd(k.VECTOR2I(k.FromMM(z[0]),k.FromMM(z[1])));b.Add(tr)
 break
else:raise RuntimeError('Expected SD_V3 segment absent')
v=k.PCB_VIA(b);v.SetPosition(k.VECTOR2I(k.FromMM(16.5),k.FromMM(8.055)));v.SetWidth(k.FromMM(.45));v.SetDrill(k.FromMM(.2));v.SetViaType(k.VIATYPE_THROUGH);v.SetLayerPair(k.F_Cu,k.B_Cu);v.SetNetCode(b.FindNet('/GND').GetNetCode());b.Add(v)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(p/'usb-ground-corridor.kicad_pcb'),b);shutil.copyfile(p/'power-width-candidate.kicad_pro',p/'usb-ground-corridor.kicad_pro')
