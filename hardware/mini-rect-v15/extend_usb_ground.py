from pathlib import Path
import json,shutil
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent;src=P/'usb-corridor-neck.kicad_pcb';out=P/'usb-ground-extension.kicad_pcb';b=k.LoadBoard(str(src))
for layer in [k.F_Cu,k.In1_Cu,k.In3_Cu,k.In4_Cu,k.B_Cu]:
 original=next(z for z in b.Zones() if z.GetLayer()==layer and z.GetNetname()=='/GND')
 z=k.ZONE(b);z.SetLayer(layer);z.SetNet(b.FindNet('/GND'));z.SetLocalClearance(k.FromMM(.15));z.SetPadConnection(k.ZONE_CONNECTION_FULL);z.SetThermalReliefGap(k.FromMM(.2));z.SetThermalReliefSpokeWidth(k.FromMM(.25));z.SetMinThickness(k.FromMM(.1));z.SetAssignedPriority(1);o=z.Outline();o.RemoveAllContours();o.NewOutline()
 for x,y in [(.3,22.5),(20.5,22.5),(20.5,.3),(25.7,.3),(25.7,28.7),(.3,28.7)]:o.Append(k.FromMM(x),k.FromMM(y))
 b.Add(z)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out),b)
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),out.with_suffix(ext))
