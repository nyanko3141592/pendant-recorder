from pathlib import Path
import json,collections
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;b=k.LoadBoard(str(P/'pendant-mini-rect-v11.kicad_pcb'));out={}
for t in b.GetTracks():
 n=t.GetNetname();r=out.setdefault(n,dict(length_mm=0,vias=0,layers=set(),widths_mm=set()))
 if isinstance(t,k.PCB_VIA):r['vias']+=1
 else:r['length_mm']+=k.ToMM(t.GetLength());r['layers'].add(b.GetLayerName(t.GetLayer()));r['widths_mm'].add(k.ToMM(t.GetWidth()))
for r in out.values():
 r['length_mm']=round(r['length_mm'],4);r['layers']=sorted(r['layers']);r['widths_mm']=sorted(r['widths_mm'])
report={'scope':'Connectivity geometry only, not impedance or return-path qualification','zones':len(list(b.Zones())),'nets':out}
(P/'route-geometry.json').write_text(json.dumps(report,indent=2)+'\n')
for n,r in out.items():
 if 'USB' in n or n in ['/GND','/SYS','/BAT','/V3V3']:print(n,r)
