from pathlib import Path
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent
b=k.LoadBoard(str(P.parent/'mic-ground-route.kicad_pcb'))
net=b.FindNet('/CHG_ALLOW')
for t in list(b.GetTracks()):
 if t.GetNetCode()==net.GetNetCode():b.DeleteNative(t)
u=next(f for f in b.GetFootprints() if f.GetReference()=='U1')
for pad in u.Pads():
 if pad.GetNumber()=='12':pad.SetNet(net)
 if pad.GetNumber()=='20':pad.SetNetCode(0)
k.ZONE_FILLER(b).Fill(b.Zones())
k.SaveBoard(str(P/'pa2-route.kicad_pcb'),b)
