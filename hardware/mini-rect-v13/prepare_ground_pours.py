"""Free surface routing channels by using GND pours; validate connectivity afterward."""
from pathlib import Path
import json,shutil
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent
b=k.LoadBoard(str(P/'plane-clean-candidate.kicad_pcb'));removed=0
for t in list(b.GetTracks()):
 if not isinstance(t,k.PCB_VIA) and t.GetNetname()=='/GND':b.DeleteNative(t);removed+=1
for layer in [k.F_Cu,k.B_Cu]:
 z=k.ZONE(b);z.SetLayer(layer);z.SetNetCode(b.FindNet('/GND').GetNetCode());z.SetLocalClearance(k.FromMM(.15));z.SetPadConnection(k.ZONE_CONNECTION_FULL);z.SetMinThickness(k.FromMM(.1));o=z.Outline();o.NewOutline()
 for x,y in [(-1,-1),(22,-1),(22,24),(-1,24)]:o.Append(k.FromMM(x),k.FromMM(y))
 b.Add(z)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(P/'ground-pour-candidate.kicad_pcb'),b)
shutil.copyfile(P/'plane-clean-candidate.kicad_pro',P/'ground-pour-candidate.kicad_pro')
print('Replaced',removed,'GND segments with F/B pours; connectivity check required')
