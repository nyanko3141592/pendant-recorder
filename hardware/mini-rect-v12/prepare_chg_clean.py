from pathlib import Path
import json,shutil
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;name='chg-clean'
shutil.copy2(P/'chg-repair.kicad_pro',P/(name+'.kicad_pro'))
b=k.LoadBoard(str(P/'chg-repair.kicad_pcb'))
d=json.loads((P/'chg-repair-drc.json').read_text())
ids={i['uuid'] for v in d['violations'] for i in v['items'] if v['type'] in ['via_dangling','track_dangling'] or (v['type']=='clearance' and '配線 [/VBUS]' in i['description'])}
assert len(ids)==3
tracks=list(b.GetTracks())
for t in tracks:
 if t.m_Uuid.AsString() in ids:b.DeleteNative(t)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(P/(name+'.kicad_pcb')),b)
