from pathlib import Path
import json,hashlib,wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;src=P/'charger-vbus-route.kicad_pcb';b=k.LoadBoard(str(src))
nets={}
for t in b.GetTracks():
 d=nets.setdefault(t.GetNetname(),dict(length_mm=0,vias=0,layers=[],widths_mm=[]))
 if isinstance(t,k.PCB_VIA):d['vias']+=1
 else:
  d['length_mm']+=k.ToMM(t.GetLength())
  d['layers'].append(b.GetLayerName(t.GetLayer()));d['widths_mm'].append(round(k.ToMM(t.GetWidth()),4))
for d in nets.values():
 d['length_mm']=round(d['length_mm'],3);d['layers']=sorted(set(d['layers']));d['widths_mm']=sorted(set(d['widths_mm']))

(P/'charger-vbus-geometry.json').write_text(json.dumps(dict(status='CONNECTED_NOT_ELECTRICALLY_QUALIFIED',board_sha256=hashlib.sha256(src.read_bytes()).hexdigest(),nets=nets),indent=2)+'\n')
for n,d in nets.items():
 if n.startswith('/USB_') or n in ['/VBUS','/SYS','/V3V3','/SD_V3','/BAT']:print(n,d)
