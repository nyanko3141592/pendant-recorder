from pathlib import Path
import shutil,wx
app=wx.App(False)
import pcbnew as k
p=Path(__file__).resolve().parent;b=k.LoadBoard(str(p/'usb-return-pair-candidate.kicad_pcb'))
ids={'74061216-ba75-4f55-be1d-70a9cb9cedbe'}
ts=[t for t in b.GetTracks() if t.m_Uuid.AsString() in ids];assert len(ts)==1
width=max(t.GetWidth() for t in ts);net=ts[0].GetNetCode();assert all(t.GetNetCode()==net and t.GetLayer()==k.F_Cu for t in ts)
for t in ts:b.DeleteNative(t)
points=[(12.25,15.7283),(12.25,15.88),(11.522,15.88),(11.522,16.4563)]
for a,z in zip(points,points[1:]):
 t=k.PCB_TRACK(b);t.SetLayer(k.F_Cu);t.SetNetCode(net);t.SetWidth(width);t.SetStart(k.VECTOR2I(k.FromMM(a[0]),k.FromMM(a[1])));t.SetEnd(k.VECTOR2I(k.FromMM(z[0]),k.FromMM(z[1])));b.Add(t)
v=k.PCB_VIA(b);v.SetPosition(k.VECTOR2I(k.FromMM(12.0),k.FromMM(16.3)));v.SetWidth(k.FromMM(.45));v.SetDrill(k.FromMM(.2));v.SetViaType(k.VIATYPE_THROUGH);v.SetLayerPair(k.F_Cu,k.B_Cu);v.SetNetCode(b.FindNet('/GND').GetNetCode());b.Add(v)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(p/'usb-cc2-ground-candidate.kicad_pcb'),b);shutil.copyfile(p/'power-width-candidate.kicad_pro',p/'usb-cc2-ground-candidate.kicad_pro')
