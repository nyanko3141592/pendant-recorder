from pathlib import Path
import json,shutil
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;name='chg-repair'
shutil.copy2(P/'chg-escape-probe.kicad_pro',P/(name+'.kicad_pro'))
b=k.LoadBoard(str(P/'chg-escape-probe.kicad_pcb'))
d=json.loads((P/'chg-escape-probe.json').read_text())
ids={i['uuid'] for v in d['violations'] if v['type'] in ['shorting_items','clearance'] for i in v['items'] if '配線 [/VBUS]' in i['description'] or '配線 [/BAT]' in i['description']}
assert len(ids)==5
tracks=list(b.GetTracks())
for t in tracks:
 if t.m_Uuid.AsString() in ids:b.DeleteNative(t)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(P/(name+'.kicad_pcb')),b)
