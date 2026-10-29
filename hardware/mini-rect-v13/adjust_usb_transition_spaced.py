from pathlib import Path
import wx,shutil
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;b=k.LoadBoard(str(P/'usb-esd-ground.kicad_pcb'))
v=next(t for t in b.GetTracks() if isinstance(t,k.PCB_VIA) and t.GetNetname()=='/USB_DM' and abs(k.ToMM(t.GetPosition().x)-16.3712)<.001)
a=v.GetPosition();old=(a.x,a.y);q=k.VECTOR2I(a.x,a.y+k.FromMM(.44))
for t in b.GetTracks():
 if isinstance(t,k.PCB_VIA) or t.GetNetname()!='/USB_DM':continue
 if (t.GetStart().x,t.GetStart().y)==old:t.SetStart(q)
 if (t.GetEnd().x,t.GetEnd().y)==old:t.SetEnd(q)
v.SetPosition(q);k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(P/'usb-transition-spaced.kicad_pcb'),b);shutil.copy2(P/'usb-esd-ground.kicad_pro',P/'usb-transition-spaced.kicad_pro')
