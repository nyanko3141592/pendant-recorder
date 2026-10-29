from pathlib import Path
import wx,json,math,hashlib
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;src=P/'usb-return-candidate.kicad_pcb';b=k.LoadBoard(str(src))
v=next(t for t in b.GetTracks() if isinstance(t,k.PCB_VIA) and t.GetPosition()==k.VECTOR2I(k.FromMM(12.65),k.FromMM(16.7)))
assert v.GetNetname()=='/GND'
layers=[]
for layer in [k.In1_Cu,k.In4_Cu]:
 zones=[z for z in b.Zones() if z.GetNetname()=='/GND' and z.IsOnLayer(layer)]
 rings=[]
 for r in [.15,.19,.21,.3]:
  hits=[]
  for i in range(32):
   a=i*2*math.pi/32;p=k.VECTOR2I(k.FromMM(12.65+r*math.cos(a)),k.FromMM(16.7+r*math.sin(a)))
   hits.append(any(z.HitTestFilledArea(layer,p) for z in zones))
  rings.append(dict(radius_mm=r,filled=sum(hits),tested=32))
 layers.append(dict(layer=b.GetLayerName(layer),rings=rings))
 assert all(q['filled']==32 for q in rings[:3]),layers
report=dict(board=src.name,sha256=hashlib.sha256(src.read_bytes()).hexdigest(),via_net=v.GetNetname(),via_xy_mm=[12.65,16.7],reference_layers=layers,scope='Stored GND-zone fill sampled across annulus and just beyond via outer edge. DRC also passes; not exhaustive return-path/electrical proof.',qualified=False)
(P/'usb-return-connection.json').write_text(json.dumps(report,indent=2)+'\n');print(layers)
