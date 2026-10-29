import pcbnew as k,wx,json
from pathlib import Path
app=wx.App(False);w=Path(__file__).resolve().parent;b=k.LoadBoard(str(w/'pdm-tp6-routed.kicad_pcb'));xy=lambda p:[k.ToMM(p.x),k.ToMM(p.y)];rows=[]
for t in b.GetTracks():
 if t.IsOnLayer(k.B_Cu):rows.append({'kind':'via' if isinstance(t,k.PCB_VIA) else 'track','net':str(t.GetNetname()),'start':xy(t.GetStart()),'end':xy(t.GetEnd()),'width':k.ToMM(t.GetWidth(k.B_Cu) if isinstance(t,k.PCB_VIA) else t.GetWidth())})
for f in b.GetFootprints():
 for p in f.Pads():
  if p.IsOnLayer(k.B_Cu):
   bb=p.GetBoundingBox();rows.append({'kind':'pad','net':str(p.GetNetname()),'label':f.GetReference()+'.'+p.GetNumber(),'box':[k.ToMM(bb.GetX()),k.ToMM(bb.GetY()),k.ToMM(bb.GetWidth()),k.ToMM(bb.GetHeight())]})
(w/'iset-map-data.json').write_text(json.dumps(rows))
