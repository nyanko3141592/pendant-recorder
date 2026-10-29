from pathlib import Path
import shutil,wx
app=wx.App(False)
import pcbnew as k
p=Path(__file__).resolve().parent;b=k.LoadBoard(str(p/'usb-return-pair-candidate.kicad_pcb'))
ids={'37e718fd-3138-47e7-8a18-1a28297a20dc','e08ce9f0-5270-4cca-8d42-94e59856a7a6'}
ts=[t for t in b.GetTracks() if t.m_Uuid.AsString() in ids];assert len(ts)==2
width=max(t.GetWidth() for t in ts);net=ts[0].GetNetCode();assert all(t.GetNetCode()==net and t.GetLayer()==k.In2_Cu for t in ts)
for t in ts:b.DeleteNative(t)
points=[(9.5573,11.7634),(9.5573,15.7),(10.1,16.2427),(10.1,17.474),(13.4658,20.8398)]
for a,z in zip(points,points[1:]):
 t=k.PCB_TRACK(b);t.SetLayer(k.In2_Cu);t.SetNetCode(net);t.SetWidth(width);t.SetStart(k.VECTOR2I(k.FromMM(a[0]),k.FromMM(a[1])));t.SetEnd(k.VECTOR2I(k.FromMM(z[0]),k.FromMM(z[1])));b.Add(t)
v=k.PCB_VIA(b);v.SetPosition(k.VECTOR2I(k.FromMM(9.6),k.FromMM(16.8)));v.SetWidth(k.FromMM(.45));v.SetDrill(k.FromMM(.2));v.SetViaType(k.VIATYPE_THROUGH);v.SetLayerPair(k.F_Cu,k.B_Cu);v.SetNetCode(b.FindNet('/GND').GetNetCode());b.Add(v)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(p/'usb-connector-ground-candidate.kicad_pcb'),b);shutil.copyfile(p/'power-width-candidate.kicad_pro',p/'usb-connector-ground-candidate.kicad_pro')
