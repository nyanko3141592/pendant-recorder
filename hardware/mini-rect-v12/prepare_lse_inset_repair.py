from pathlib import Path
import json,shutil
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;name='lse-inset-repair'
shutil.copy2(P/'lse-via-inset.kicad_pro',P/(name+'.kicad_pro'))
b=k.LoadBoard(str(P/'lse-via-inset.kicad_pcb'))
d=json.loads((P/'lse-via-inset.json').read_text())
ids={i['uuid'] for v in d['violations'] for i in v['items'] if '配線' in i['description']}
assert ids
tracks=list(b.GetTracks())
for t in tracks:
 if t.m_Uuid.AsString() in ids:b.DeleteNative(t)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(P/(name+'.kicad_pcb')),b)
