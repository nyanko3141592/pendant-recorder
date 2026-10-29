from pathlib import Path
import wx,shutil
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;b=k.LoadBoard(str(P/'usb-surface-route.kicad_pcb'));removed=0
for t in list(b.GetTracks()):
 if not isinstance(t,k.PCB_VIA) and t.GetLength()<10:b.DeleteNative(t);removed+=1
for f in b.GetFootprints():
 if f.GetReference()=='J4':f.Reference().SetVisible(False)
for layer in [k.In1_Cu,k.In2_Cu]:
 z=k.ZONE(b);z.SetLayer(layer);z.SetNetCode(b.FindNet('/GND').GetNetCode());z.SetLocalClearance(k.FromMM(.15));z.SetPadConnection(k.ZONE_CONNECTION_FULL);z.SetMinThickness(k.FromMM(.1));o=z.Outline();o.NewOutline()
 for x,y in [(-1,-1),(22,-1),(22,24),(-1,24)]:o.Append(k.FromMM(x),k.FromMM(y))
 b.Add(z)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(P/'usb-surface-planes.kicad_pcb'),b);shutil.copy2(P/'usb-surface-route.kicad_pro',P/'usb-surface-planes.kicad_pro');print('Removed sub10nm segments',removed)
