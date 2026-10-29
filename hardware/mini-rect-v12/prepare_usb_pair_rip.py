from pathlib import Path
import json,shutil
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;name='usb-pair-rip'
shutil.copy2(P/'usb-pair-repair.kicad_pro',P/(name+'.kicad_pro'))
b=k.LoadBoard(str(P/'usb-pair-repair.kicad_pcb'))
d=json.loads((P/'usb-pair-repair-drc.json').read_text())
for t in list(b.GetTracks()):
 if t.GetNetname() in ['/SWCLK','/PDM_CLK_MCU']:b.DeleteNative(t)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(P/(name+'.kicad_pcb')),b)
