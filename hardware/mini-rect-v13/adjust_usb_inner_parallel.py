from pathlib import Path
import wx,shutil
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;b=k.LoadBoard(str(P/'usb-transition-spaced.kicad_pcb'));old=k.VECTOR2I(k.FromMM(15.6047),k.FromMM(8.1553));q=k.VECTOR2I(old.x-k.FromMM(.44),old.y+k.FromMM(.44));n=0
for t in b.GetTracks():
 if isinstance(t,k.PCB_VIA) or t.GetNetname()!='/USB_DM' or t.GetLayer()!=k.In2_Cu:continue
 if t.GetStart()==old:t.SetStart(q);n+=1
 if t.GetEnd()==old:t.SetEnd(q);n+=1
assert n==2,n
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(P/'usb-inner-parallel.kicad_pcb'),b);shutil.copy2(P/'usb-transition-spaced.kicad_pro',P/'usb-inner-parallel.kicad_pro')
