from pathlib import Path
import json,shutil
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent;src=P/'rejected-VBUS_LIMITED.kicad_pcb';out=P/'input-power-connected.kicad_pcb'
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(P/('input-connected-candidate'+ext),out.with_suffix(ext))
x=json.loads((P/'rejected-VBUS_LIMITED.json').read_text());assert len(x['violations'])==1 and x['violations'][0]['type']=='track_dangling';ids={i['uuid'] for i in x['violations'][0]['items']};b=k.LoadBoard(str(src));removed=[]
for t in list(b.GetTracks()):
 if t.m_Uuid.AsString() in ids:assert t.GetNetname()=='/VBUS_LIMITED' and k.ToMM(t.GetLength())<.03;removed.append(t.m_Uuid.AsString());b.DeleteNative(t)
assert len(removed)==1
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out),b)
# Inspect BOOT0 source route for a local layer change.
for t in b.GetTracks():
 if t.GetNetname()=='/BOOT0':print(t.m_Uuid.AsString(),t.GetClass(),b.GetLayerName(t.GetLayer()),[(k.ToMM(p.x),k.ToMM(p.y)) for p in [t.GetStart(),t.GetEnd()]])
