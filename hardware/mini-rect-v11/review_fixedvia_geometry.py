from pathlib import Path
import json
import wx
app=wx.App(False)
import pcbnew as k
p=Path(__file__).parent
b=k.LoadBoard(str(p/'plane6-fixedvia-repair.kicad_pcb'))
nets={}
for t in b.GetTracks():
 n=nets.setdefault(t.GetNetname(),dict(length_mm=0,vias=0,layers=set(),widths_mm=set()))
 if isinstance(t,k.PCB_VIA):n['vias']+=1
 else:
  n['length_mm']+=k.ToMM(t.GetLength());n['layers'].add(b.GetLayerName(t.GetLayer()));n['widths_mm'].add(k.ToMM(t.GetWidth()))
for n in nets.values():
 n['length_mm']=round(n['length_mm'],4);n['layers']=sorted(n['layers']);n['widths_mm']=sorted(n['widths_mm'])
r=dict(scope='Geometry only; not impedance, reference-plane continuity or electrical qualification',zones=[dict(net=z.GetNetname(),layer=b.GetLayerName(z.GetLayer())) for z in b.Zones() if not z.GetIsRuleArea()],nets=nets)
(p/'plane6-fixedvia-geometry.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps({n:v for n,v in nets.items() if 'USB' in n or n in ['/VBUS','/V3V3','/SD_V3']},indent=2))
