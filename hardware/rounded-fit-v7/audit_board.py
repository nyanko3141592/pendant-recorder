from pathlib import Path
import json,math,wx,collections
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;b=k.LoadBoard(str(P/'pendant-compact-100-v5.kicad_pcb'));fs={f.GetReference():f for f in b.GetFootprints()}
r={'zones':b.GetAreaCount(),'nets':{}}
for t in b.GetTracks():
 n=t.GetNetname();d=r['nets'].setdefault(n,dict(length_mm=0,vias=0,layers=set(),min_width_mm=100))
 if isinstance(t,k.PCB_VIA):d['vias']+=1
 else:d['length_mm']+=k.ToMM(t.GetLength());d['layers'].add(b.GetLayerName(t.GetLayer()));d['min_width_mm']=min(d['min_width_mm'],k.ToMM(t.GetWidth()))
for n,d in r['nets'].items():d['layers']=sorted(d['layers']);d['length_mm']=round(d['length_mm'],3)
r['decoupling_distance_mm']={}
for cr,ur in [('C1','U1'),('C2','U1'),('C3','U1'),('C5','U1'),('C6','U1'),('C7','U1'),('C16','U4'),('C18','U6'),('C22','U8'),('C23','U9'),('C24','U9'),('C26','U11'),('C27','U11'),('C29','U12')]:
 a=fs[cr].GetPosition();z=fs[ur].GetPosition();r['decoupling_distance_mm'][cr+'-'+ur]=round(math.hypot(k.ToMM(a.x-z.x),k.ToMM(a.y-z.y)),2)
(P/'layout-audit.json').write_text(json.dumps(r,indent=2));print(json.dumps({'zones':r['zones'],'decoupling':r['decoupling_distance_mm'],'critical':{n:d for n,d in r['nets'].items() if any(s in n for s in ['USB_D','PDM','SD_CLK'])}},indent=2))
