import wx
app=wx.App(False)
import pcbnew as k
from pathlib import Path
P=Path(__file__).parent;f=P/'pendant-compact-100-v5.kicad_pcb';b=k.LoadBoard(str(f))
for t in list(b.GetTracks()):
 if t.GetNetname() in ['/PDM_CLK','/BAT_ADC']:b.Delete(t)
k.SaveBoard(str(f),b)
