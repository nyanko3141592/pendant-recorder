from pathlib import Path
import shutil,wx
app=wx.App(False)
import pcbnew as k
p=Path(__file__).resolve().parent;b=k.LoadBoard(str(p/'usb-return-dogleg.kicad_pcb'))
v=k.PCB_VIA(b);v.SetPosition(k.VECTOR2I(k.FromMM(15.8),k.FromMM(9.8)));v.SetWidth(k.FromMM(.5));v.SetDrill(k.FromMM(.3));v.SetViaType(k.VIATYPE_THROUGH);v.SetLayerPair(k.F_Cu,k.B_Cu);v.SetNetCode(b.FindNet('/GND').GetNetCode());b.Add(v)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(p/'usb-ground-island-screen.kicad_pcb'),b);shutil.copyfile(p/'power-width-candidate.kicad_pro',p/'usb-ground-island-screen.kicad_pro')
