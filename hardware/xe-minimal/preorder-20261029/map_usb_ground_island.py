import pcbnew as k,wx,json
from pathlib import Path
app=wx.App(False);w=Path(__file__).resolve().parent;b=k.LoadBoard(str(w/'ground-islands-centered.kicad_pcb'));diag=k.LoadBoard(str(w/'ground-islands-diagnostic.kicad_pcb'));z=next(z for z in diag.Zones() if z.GetNetname()=='/GND' and z.GetLayer()==k.In2_Cu);p=z.GetFilledPolysList(k.In2_Cu).COutline(21);xy=lambda p:[k.ToMM(p.x),k.ToMM(p.y)];rows=[]
for t in b.GetTracks():
 if t.IsOnLayer(k.In2_Cu):rows.append({'kind':'via' if isinstance(t,k.PCB_VIA) else 'track','net':str(t.GetNetname()),'start':xy(t.GetStart()),'end':xy(t.GetEnd()),'width':k.ToMM(t.GetWidth(k.In2_Cu) if isinstance(t,k.PCB_VIA) else t.GetWidth()),'uuid':str(t.m_Uuid.AsString())})
(w/'usb-island-map.json').write_text(json.dumps({'island':[xy(p.CPoint(i)) for i in range(p.PointCount())],'copper':rows},indent=2)+'\n')
