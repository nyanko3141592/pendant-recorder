from pathlib import Path
import wx,shutil
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;b=k.LoadBoard(str(P/'charger-vbus-route.kicad_pcb'))
for layer in [k.F_Cu,k.In2_Cu,k.B_Cu]:
 z=k.ZONE(b);z.SetLayer(layer);z.SetNetCode(b.FindNet('/GND').GetNetCode());z.SetLocalClearance(k.FromMM(.15));z.SetPadConnection(k.ZONE_CONNECTION_FULL);z.SetMinThickness(k.FromMM(.1));o=z.Outline();o.NewOutline()
 for x,y in [(-1,-1),(22,-1),(22,24),(-1,24)]:o.Append(k.FromMM(x),k.FromMM(y))
 b.Add(z)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(P/'usb-ground-pours.kicad_pcb'),b)
shutil.copy2(P/'charger-vbus-route.kicad_pro',P/'usb-ground-pours.kicad_pro')
