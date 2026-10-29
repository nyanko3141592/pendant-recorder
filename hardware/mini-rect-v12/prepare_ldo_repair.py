from pathlib import Path
import wx,json,shutil
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent
b=k.LoadBoard(str(P/'ldo-shift.kicad_pcb'))
x=json.loads((P/'ldo-shift-drc.json').read_text())
ids={i['uuid'] for v in x['violations'] for i in v['items'] if 'ビア' in i['description'] or v['type']=='track_dangling'}
removed=[]
for t in list(b.GetTracks()):
 if t.m_Uuid.AsString() in ids:
  removed.append((t.GetNetname(),t.m_Uuid.AsString()));b.DeleteNative(t)
shutil.copy2(P/'ldo-shift.kicad_pro',P/'ldo-repair.kicad_pro')
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(P/'ldo-repair.kicad_pcb'),b)
print(removed)
