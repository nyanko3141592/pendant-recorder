from pathlib import Path
import json,shutil
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;name='usb-lse-repair'
shutil.copy2(P/'usb-via-repair.kicad_pro',P/(name+'.kicad_pro'))
b=k.LoadBoard(str(P/'usb-via-repair.kicad_pcb'))
d=json.loads((P/'usb-via-repair-drc.json').read_text())
for t in list(b.GetTracks()):
 if t.GetNetname() in ['/LSE_IN']:b.DeleteNative(t)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(P/(name+'.kicad_pcb')),b)
