from pathlib import Path
import json,shutil
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;name='usb-pair-repair'
shutil.copy2(P/'usb-pair-escape.kicad_pro',P/(name+'.kicad_pro'))
b=k.LoadBoard(str(P/'usb-pair-escape.kicad_pcb'))
d=json.loads((P/'usb-pair-escape-drc.json').read_text())
ids={i['uuid'] for v in d['violations'] for i in v['items'] if any('['+n+']' in i['description'] for n in ['/SWDIO','/SWCLK','/PDM_CLK_MCU'])}
assert ids
tracks=list(b.GetTracks())
for t in tracks:
 if t.m_Uuid.AsString() in ids:b.DeleteNative(t)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(P/(name+'.kicad_pcb')),b)
