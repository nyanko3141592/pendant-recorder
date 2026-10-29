import wx
app=wx.App(False)
import pcbnew as k
from pathlib import Path
P=Path(__file__).parent;f=P/'pendant-compact-100-v5.kicad_pcb';b=k.LoadBoard(str(f))
for t in list(b.GetTracks()):
 if t.GetNetname() in ['/CHG_N','/STATUS_LED'] or (t.GetNetname()=='/V3V3' and not isinstance(t,k.PCB_VIA) and t.GetLayer()==k.In2_Cu and t.GetLength()>k.FromMM(4)):b.Delete(t)
k.SaveBoard(str(f),b)
