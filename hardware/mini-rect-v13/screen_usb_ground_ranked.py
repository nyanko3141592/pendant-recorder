from pathlib import Path
import shutil,wx
app=wx.App(False)
import pcbnew as k
p=Path(__file__).resolve().parent;b=k.LoadBoard(str(p/'power-width-candidate.kicad_pcb'))
v=k.PCB_VIA(b);v.SetPosition(k.VECTOR2I(k.FromMM(16.5),k.FromMM(8.155)));v.SetWidth(k.FromMM(.45));v.SetDrill(k.FromMM(.2));v.SetViaType(k.VIATYPE_THROUGH);v.SetLayerPair(k.F_Cu,k.B_Cu);v.SetNetCode(b.FindNet('/GND').GetNetCode());b.Add(v)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(p/'usb-ground-ranked.kicad_pcb'),b);shutil.copyfile(p/'power-width-candidate.kicad_pro',p/'usb-ground-ranked.kicad_pro')
